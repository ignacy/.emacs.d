;;; proel.el --- A package for software projects navigation

;; Copyright (C) 2010  Jaros³aw Rzeszótko <sztywny@gmail.com>

;; Author: Jaros³aw Rzeszótko <sztywny@gmail.com>
;; Keywords: programming, files, frames, navigation, projects
;; URL: http://www.stifflog.com/proel.el
;; Site: http://www.stifflog.com/2008/12/14/proel-project-support-for-emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.


;;; Requires


(eval-when-compile (require 'cl))
(require 'anything)


;;; Utility functions


(defun proel-for-each-buffer (fn)
  "Executes the given function in each from the currently opened buffers"
  (save-current-buffer
      (mapc
       #'(lambda (buffer)
	   (set-buffer buffer)
	   (funcall fn buffer))
       (buffer-list))))

(defun proel-read-file (file-name)
  "Returns the contents of the file 'file-name' as a string"
  (if (and (file-exists-p file-name) (file-readable-p file-name))
      (with-temp-buffer
	(insert-file-contents file-name)
	(buffer-string))
    '()))

(defun proel-write-file (file-name string)
  "Writes a string to a given 'file-name'"
  (with-temp-file file-name
    (insert string)))

(defun proel-current-line ()
  (buffer-substring-no-properties
   (line-beginning-position)
   (line-end-position)))

(defun proel-reverse-string (string)
  (mapconcat #'identity (reverse (split-string string "" t)) ""))

(defun proel-reverse-index-of (substring string)
  (let ((pos (string-match (proel-reverse-string substring) (proel-reverse-string string))))
    (if pos  
	(- (length string) pos 1)
      nil)))


;;; Core logic


(defvar proel-loaded-projects (list)
  "Association list mapping from project paths to projects that
were already loaded at least once")

(make-variable-buffer-local 'proel-current-project)
(make-variable-buffer-local 'proel-buffer-seen)

(defun proel-set-current-project (project)
  (setq proel-current-project project))

(defstruct (proel-project (:constructor make-proel-project-raw))
  path name parent-directory compile-command compile-regexp persistent file-tree file-list)

(defun* make-proel-project (&key path (compile-command) (compile-regexp) (persistent))
  (let* ((match (string-match "\\(.*\\)/\\(.*\\)/" path))
	 (project (make-proel-project-raw
		   :path path
		   :name (match-string 2 path)
		   :parent-directory (match-string 1 path)
		   :persistent persistent)))
  (add-to-list 'proel-loaded-projects (cons (intern path) project))
  project))

(defun proel-project-set-compile-command (project compile-command)
  (setf (proel-project-compile-command project) compile-command)
  (proel-persist-project project))

(defun proel-project-set-compile-regexp (project compile-regexp)
  (setf (proel-project-compile-regexp project) compile-regexp)
  (proel-persist-project project))

(defun proel-project-lessp (p1 p2)
  (string-lessp (proel-project-name p1) (proel-project-name p2)))

(defun proel-projects ()
  "Generates the list of paths of all projects handled by proel"
  (sort
   (append
    (proel-projects-from-directories-storing-projects)
    (copy-list proel-persisted-projects))
   #'proel-project-lessp))

(defun proel-projects-from-directories-storing-projects ()
  (let ((paths (mapcar #'proel-project-path proel-persisted-projects)))
    (mapcar
     #'(lambda (path) (proel-load-project (concat path "/")))
     (mapcan #'(lambda (dir)
		 (cddr (remove-if
			#'(lambda (file)
			    (or (not (file-directory-p file))
				(member (concat file "/") paths)))
			(directory-files dir t))))
	   proel-directories-storing-projects))))

(defun proel-determine-project (path)
  "Given a path, checks if it belongs to a project and returns it if so."
  (some #'(lambda (project-directory)
	    (when (string-prefix-p project-directory path)
	      (proel-load-project project-directory)))
	(mapcar #'proel-project-path (proel-projects))))

(defun proel-load-project (project-path)
  "Given a project directory name and a parent directory path,
returns the project structure for it."
  (or (assoc-default (intern project-path) proel-loaded-projects)
      (make-proel-project :path project-path)))

(defun proel-relative-to-absolute (project path)
  "Converts relative 'path' from 'project' to an absolute path"
  (concat (proel-project-path project) "/" path))

(defun proel-find-file (relative-path &optional project)
  "Visits a file using a path relative to the current projects directory"
  (find-file (proel-relative-to-absolute (or project proel-current-project) relative-path)))


;;; Persistence


(defvar proel-persisted-projects (list)
  "List of projects that are persisted")

(defvar proel-projects-directory
  (let* ((proel-directory (expand-file-name (concat user-emacs-directory "proel/")))
         (projects-directory (concat proel-directory "projects/")))
    (unless (file-exists-p proel-directory)
      (make-directory proel-directory))
    (unless (file-exists-p projects-directory)
      (make-directory projects-directory))
    projects-directory)
  "The path to the directory in which the proel projects are saved")

(defun proel-serialize-project (project)
  "Returns a string representation of a project"
  (prin1-to-string project))

(defun proel-deserialize-project (string)
  "Returns a new proel project from its string representation"
  (let ((project (read string)))
    (add-to-list 'proel-loaded-projects (cons (intern (proel-project-path project)) project))
    (add-to-list 'proel-persisted-projects project)
    project))

(defun proel-persist-project (project)
  "Stores a project in its associated file"
  (let* ((project-hash (sha1 (proel-project-path project)))
	 (project-file-name (concat proel-projects-directory project-hash)))
	(proel-write-file project-file-name (proel-serialize-project project))
	(add-to-list 'proel-persisted-projects project)))

(defun proel-load-persisted-projects ()
  "Loads all saved projects into proel"
  (let ((project-projects-file-names (cddr (directory-files proel-projects-directory t))))
    (loop for project-file-name in project-projects-file-names do
	  (proel-deserialize-project (proel-read-file project-file-name)))))

(defun proel-new-persistent-project (path)
  "Creates and persists a new project from 'path'"
  (let ((project (make-proel-project :path (expand-file-name path) :persistent t)))
    (proel-persist-project project)
    project))

(proel-load-persisted-projects)


;;; Macros for defining commands


(defmacro def-proel-command (name comment body)
  "All generic proel commands share the same structure, so this
macro abstracts it out. It defines a function that will work with
a supplied project path (for example when invoked from anything
for a chosen project) or, when none is given, with the current
project, if any."
  (let ((project (gensym)))
    `(defun ,name (&optional a-project)
       ,comment
       (interactive)
       (let ((,project (or a-project
			proel-current-project
			(error "Proel: No project available"))))
	 (,body ,project)))))

(defmacro proel-with-new-buffers-preserving-project (project body)
  "When executing a command that will create its own buffer, keep
that buffer a part of the proels project"
  `(progn
     (proel-for-each-buffer
      (lambda (buffer)
	(setq proel-buffer-seen t)))
     ,body
     (proel-for-each-buffer
      (lambda (buffer)
	(unless proel-buffer-seen
	  (proel-set-current-project ,project)
	  (proel-mode t))))))
       
(defmacro with-proel-project-directory (project &rest body)
  (let ((buffer (gensym))
	(working-dir (gensym)))
    `(let ((,working-dir default-directory)
	   (,buffer (current-buffer)))
       (setq default-directory (proel-project-path ,project))
       ,@body
       (save-current-buffer
	 (set-buffer ,buffer)
	 (setq default-directory ,working-dir)))))


;;; Buffer setup


(defun proel-setup-cscope ()
  (when (and (featurep 'xcscope)
		 (file-exists-p (proel-relative-to-absolute proel-current-project "cscope.out")))
	(cscope-set-initial-directory (proel-project-path proel-current-project))))

(defun proel-setup-ctags ()
  (let ((tags-file-path (proel-relative-to-absolute proel-current-project "TAGS")))
    (when (file-exists-p tags-file-path)
	(visit-tags-table tags-file-path))))

(defun proel-setup-modeline ()
  (make-local-variable 'mode-line-buffer-identification)
  (setq mode-line-buffer-identification
	(nconc
	 (list
	  (propertize
	   (proel-project-name proel-current-project)
	   'face 'proel-mode-line-project-name-face)
	  " ")
	 (copy-list (default-value 'mode-line-buffer-identification)))))

(add-hook 'svn-status-mode-hook #'proel-setup-modeline t)
(add-hook 'git-status-mode-hook #'proel-setup-modeline t)


;;; Commands


(defun proel-define-project (path)
  "Lets the user define a new project manually"
  (interactive "DChoose a project directory: ")
  (let* ((project (proel-new-persistent-project path)))
    (mapc #'(lambda (buffer)
	      (proel-refresh-buffer path buffer))
	  (buffer-list))
    (proel-dired-in-project project)))

(defun proel-refresh-buffer (path buffer)
  "Sets up proel for a buffer that potentially was previously not a part of
any project"
  (when (and (stringp (buffer-file-name buffer))
	     (string-prefix-p path (buffer-file-name buffer)))
    (save-current-buffer
      (set-buffer buffer)
      (proel-mode t))))

(def-proel-command proel-dired-in-project
  "Open the projects main directory using dired"
  (lambda (project)
    (dired (proel-project-path project))))

(def-proel-command proel-grep-in-project
  "Runs grep in one of the current projects directories"
  (lambda (project)
    (let* ((grep-pattern      (read-string "Search for: " nil 'pattern))
	   (grep-in-dir-input (read-directory-name "In directory: " (proel-project-path project)))
	   (grep-in-dir       (file-name-as-directory (expand-file-name grep-in-dir-input))))
      (proel-with-new-buffers-preserving-project project
       (rgrep grep-pattern "*" grep-in-dir)))))

(def-proel-command proel-rails-console-in-project
  "Runs Rails console in the project"
  (lambda (project)
    (with-proel-project-directory project
      (run-ruby "ruby script/console"))))


;;; Compilation


(defun proel-setup-compilation (project)
  "Sets up the compile command and compilation error regexp for a
given project:"
  (defun proel-read-compilation-parameters (command)
    (interactive "sEnter the compilation command: ")
    command)
  (let ((new-compile-command (call-interactively 'proel-read-compilation-parameters)))
    (proel-project-set-compile-command project new-compile-command)))

(def-proel-command proel-compile
  "Compiles the current project"
  (lambda (project)
    (with-proel-project-directory
     project
     (let ((project-compile-command (proel-project-compile-command project)))
       (message project-compile-command)
       (unless project-compile-command
	 (proel-setup-compilation project))
       (compile (proel-project-compile-command project))))))


;;; Version Control


(defun proel-vc-gitp (project)
  (let ((git-dir (proel-relative-to-absolute project ".git")))
    (and (file-exists-p git-dir)
	 (file-directory-p git-dir))))

(defun proel-vc-git-run (project)
  (let ((magit-buffer-name (concat "*magit: " (proel-project-name project) "*")))
    (if (get-buffer magit-buffer-name)
	(switch-to-buffer magit-buffer-name)
      (progn
	(magit-status (concat (proel-project-path project) "/"))
	(magit-refresh)))))

(defun proel-vc-svnp (project)
  (let ((svn-dir (proel-relative-to-absolute project ".svn")))
    (and (file-exists-p svn-dir)
	 (file-directory-p svn-dir))))

(defun proel-vc-svn-run (project)
  (svn-status (proel-project-path project)))

(defvar proel-vc-backends
  '((proel-vc-gitp . proel-vc-git-run)
    (proel-vc-svnp . proel-vc-svn-run))
  "A list of predicate . runner dotted pairs. The predicate
determines whether the current project is under control of a
particular VCS and the runner functions gets executed if so.")

(def-proel-command proel-vc-in-project
  "Run a version control interface for the project"
  (lambda (project)
    (unless
	(some #'(lambda (vc-cons)
		  (let ((vc-predicate (car vc-cons))
			(vc-runner (cdr vc-cons)))
		    (when (funcall vc-predicate project)
		      (proel-with-new-buffers-preserving-project project (funcall vc-runner project)))))
	      proel-vc-backends)
      (message "Proel: No supported VC backend present"))))


;;; File list


(defcustom proel-ignored-file-patterns (list ".*\.png" ".*\.jpg" ".*\.class")
  "A list of patterns specifying which files to ignore when
building a list of project files/directories. Passed in to the
'find' program as -regex <pattern1> -prune -o regex <pattern2>
-prune etc."
  :group 'proel
  :type '(repeat string))

(defcustom proel-ignored-dir-patterns (list ".*\/\.git")
  "A list of patterns specifying which directories to ignore when
building a list of project files/directories. Passed in to the
'find' program as -regex <pattern1> -prune -o regex <pattern2>
-prune etc."
  :group 'proel
  :type '(repeat string))

(defun proel-file-list (path)
  (let* ((files-selector
	  (append
	   (mapcar #'(lambda (pattern)
		       (concat "-regex '" pattern "' -prune"))
		   proel-ignored-file-patterns)
	   (list "-type f -printf '%P\n'")))
	 (dirs-selector
	  (append
	   (mapcar #'(lambda (pattern)
		       (concat "-regex '" pattern "' -prune"))
		   proel-ignored-dir-patterns)
	   (list "-type d -printf '%P\n'")))
	 (find-options
	  (concat (combine-and-quote-strings files-selector " -o ") " , "
                  (combine-and-quote-strings dirs-selector " -o ")))
	 (find-command (concat "find " path " " find-options " | sort")))
    (call-process-shell-command find-command nil (current-buffer) nil)
    (save-excursion
      (goto-char (point-min))
      (insert "."))))

(defun proel-anything-file-list (project)
  (let* ((anything-buffer (anything-candidate-buffer 'global)))
    (with-current-buffer anything-buffer
      (if project
	(proel-file-list (proel-project-path project))
	(delete-region (point-min) (point-max))))))

(defvar proel-path-token-separators
  (regexp-opt (list "/" "_" "?" "-" ".")))

(defun proel-camel-split (string)
  "Splits a string at case changes e.g. returns ('Foo' 'Bar') for
'FooBar'"
  (let ((current 0)
	(last 0)
	(result (list)))
    (setq case-fold-search nil)
    (while (setq current (string-match "[a-z][A-Z]" string last))
      (setq result (cons (substring string last (+ current 1)) result))
      (setq last (+ current 1)))
    (setq result (cons (substring string last (length string)) result))
    (nreverse result)))

(defun proel-tokenize-path (path)
  (let ((result (list))
	(last 0)
	(current 0))
    (while (setq current (string-match proel-path-token-separators path last))
      (when (not (and (eq last 0) (eq current 0)))
	(setq result (cons (substring path last current) result)))
      (setq result (cons (substring path current (+ current 1)) result))
      (setq last (+ current 1)))
    (setq result (cons (subseq path last (length path)) result))
    (mapcan #'proel-camel-split (nreverse result))))

(defun proel-path-input-pattern-to-regexp (pattern)
  (concat "^\\(.*\\)"
	  (combine-and-quote-strings (proel-tokenize-path pattern) "\\(.*\\)")
	  "\\(.*\\)$"))

(defun proel-anything-file-list-sort (files &optional anything-source)
  (if (or (< (length files) 15) (> (length anything-input) 4))
      (let ((regexp (proel-path-input-pattern-to-regexp anything-input)))
	(defun mismatch (file)
	  (let ((last-slash (proel-reverse-index-of "/" file)))
	    (if (string-match regexp file)
		(loop for n from 2 until (null (match-string n file)) sum
		      (* n (length (match-string n file))))
	      (error "proel-anything-file-list-sort -- attempt to sort a candidate that doesn't match at all"))))
	(sort files
	      #'(lambda (a b)
		  (let ((mismatch-a (mismatch a))
			(mismatch-b (mismatch b)))
		    (if (= mismatch-a mismatch-b)
			(< (length a) (length b))
		      (< mismatch-a mismatch-b))))))
    files))

(defun proel-file-list-search (pattern &optional dummy-a dummy-b)
  (re-search-forward (proel-path-input-pattern-to-regexp pattern) nil t))


;;; Anything interface


(defun proel-anything-project-candidates ()
  (mapcar #'(lambda (project)
	      (cons (proel-project-name project)
		    project))
	  (proel-projects)))

(defvar proel-anything-projects
  '((name . "Proel - Projects")
    (candidates . proel-anything-project-candidates)
    (action ("Open" . proel-anything)
            ("Dired" . proel-dired-in-project)
	    ("Version control" . proel-vc-in-project)
	    ("Grep" . proel-grep-in-project)
	    ("Rails console" . proel-rails-console-in-project))
    (type . proel-project)))

(defun proel-anything-file-list-source (project)
  '((name . "Proel - Project files")
    (init . (lambda () (proel-anything-file-list project)))
    (search . (proel-file-list-search))
    (filtered-candidate-transformer . proel-anything-file-list-sort)
    (action ("Find file in project" . (lambda (file) (proel-find-file file project))))
    (type . project-file)
    (candidates-in-buffer)))

(defun proel-anything-create-file-source (project)
  '((name . "Create file in project")
    (dummy)
    (action ("Create" .
	     (lambda (name)
	       (let ((subdirectory
		      (read-directory-name "In directory: " (proel-project-path project))))
		 (find-file (concat subdirectory "/" name))))))))

(defun proel-anything (&optional a-project)
  (interactive)
  (let* ((project (or a-project proel-current-project)))
    (anything :sources
	      `(,(proel-anything-file-list-source project)		
		proel-anything-projects
		,(proel-anything-create-file-source project)))))

;;; Minor mode


(defgroup proel nil
  "A package for software projects navigation" :prefix "proel-" :group 'programming)

(defface proel-mode-line-project-name-face
  '((t (:bold t :overline t :foreground "#b10011")))
  "Face for displaying the project name in the modeline."
  :group 'proel)

(defcustom proel-directories-storing-projects (list (expand-file-name "~/projects"))
  "The list of directories one stores projects in."
  :group 'proel
  :type '(repeat string))

(easy-mmode-defmap proel-basic-map
  `(("a" . proel-anything)
    ("n" . proel-define-project)
    ("c" . proel-compile)
    ("d" . proel-dired-in-project)
    ("g" . proel-grep-in-project)
    ("v" . proel-vc-in-project)
    ("r" . proel-rails-console-in-project))
  "The base keymap for `proel'.")

(defcustom proel-command-prefix "\M-p"
  "Prefix for `proel' commands."
  :group 'proel
  :type '(choice string vector))

(easy-mmode-defmap proel-mode-map
  `((,proel-command-prefix . ,proel-basic-map))
  "Keymap for `proel'.")

(define-minor-mode proel-mode proel-mode-map
  "A project-oriented workflow for Emacs"
  :group 'proel
  (let* ((path (or dired-directory (buffer-file-name)))
         (project (when path (proel-determine-project (expand-file-name path)))))
    (when project
      (proel-set-current-project project))
    (when proel-current-project
      (proel-setup-cscope)
      (proel-setup-ctags)
      (proel-setup-modeline))))

(define-global-minor-mode global-proel-mode proel-mode
  (lambda () (proel-mode t)))

(provide 'proel)
