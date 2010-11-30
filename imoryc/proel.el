;;; proel.el --- A package for software projects navigation

;; Copyright (C) 2008  Jaros³aw Rzeszótko <sztywny@gmail.com>

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

(require 'cl)
(require 'fuzzy-match)

;;; Logic

(defgroup proel nil
  "A package for software projects navigation" :prefix "proel-" :group 'programming)

(defface proel-mode-line-project-name-face
  '((t (:bold t :overline t :foreground "#b10011")))
  "Face for displaying the project name in the modeline." :group 'proel)

(defvar proel-dirs-with-projects (list (expand-file-name "~/code"))
  "The list of directories one stores projects in.")

(defvar proel-files-interesting "\\(?:\\.erl$\\|\\.hrl$\\|\\.cpp$\\|\\.hpp$\\|\\.java$\\|\\.lisp$\\|\\.scm$\\|\\.h$\\|\\.c$\\|\\.rb$\\|\\.rhtml$\\|\\.yml$\\|\\.rjs$\\|\\.erb$\\|\\.css$\\|\\.js$\\|.g$\\|\\.xpl$\\|\\.xml\\|^[^\\.]*$\\)"
  "The regular expression a path has to match to be considered a
part of a project")

(defvar proel-dirs-not-interesting "\\(?:\\.svn.*\\|\\.git.*\\|.*coverage.*\\|.*vendor.*\\)"
  "The regular expression a directory name has to match to be
excluded from gathering files from project")

(defvar proel-current-project nil
  "The project currently being active")

(make-variable-buffer-local 'proel-buffers-project)

(defun proel-directories (dir)
  "Returns relative names of all directories under 'dir'."
  (mapcar
   #'(lambda (absolute-path) (file-relative-name absolute-path dir))
   (cddr (remove-if-not 'file-directory-p (directory-files dir t)))))

(defun proel-projects-list ()
  "Returns the list of all projects available, sorted alphabetically."
  (sort (mapcan #'proel-directories proel-dirs-with-projects) #'string-lessp))

(defvar proel-projects-available (proel-projects-list)
  "The list of all projects available")

(defvar proel-loaded-projects '(projects)
  "This list of all projects that were already loaded")

(defun proel-files-from (main-path ignore-p select-p)
  "Traverses the directory under 'path', returning a list of
filenames for which select-p returned true, skipping files and
not traversing directories for which ignore-p returned true"
  (let ((files (list nil)) (queue (list main-path)))
    (while queue
      (mapc
       #'(lambda (path)
           (if (and (file-directory-p path)
                    (not (or (string-match "\\(/..\\|/.\\)$" path) (funcall ignore-p path))))
               (nconc queue (list path))
             (when (funcall select-p path)
               (nconc files (list (substring path (+ (length main-path) 1)))))))
       (directory-files (car queue) t nil nil))
      (setq queue (cdr queue)))
    (cdr files)))

(defun proel-gather-files-from (path)
  "Returns a list of files belonging to a project residing in 'path'"
  (sort
   (proel-files-from
    path
    #'(lambda (filename) (string-match proel-dirs-not-interesting filename))
    #'(lambda (filename) (string-match proel-files-interesting filename)))
   #'string<))

(defstruct
  (proel-project
   (:constructor make-proel-project
    (&key
     (name) (in-directory)
     &aux
     (path (concat in-directory "/" name))
     (files (proel-gather-files-from path)))))
  name in-directory path files)

(defun proel-detect-project (pathname)
  "Checks whether the given path belongs to some project or not."
  (some #'(lambda (dir-with-projects)
            (when (string-match (concat dir-with-projects "/\\(.+?\\)\\(?:/\\|$\\)") pathname)
              (let* ((name (match-string 1 pathname))
                     (key (intern (concat dir-with-projects "/" name)))
                     (project-cons (assoc key proel-loaded-projects))
                     (project
                      (if project-cons
                          (cdr project-cons)
                        (make-proel-project :name name :in-directory dir-with-projects))))
                (unless project-cons
                  (nconc proel-loaded-projects (list (cons key project))))
                project)))
        proel-dirs-with-projects))

(defun proel-relative-to-absolute (project path)
  "Converts relative 'path' from 'project' to an absolute path"
  (concat (proel-project-path project) "/" path))

(defun proel-find-file (relative-path)
  "Visits a file using a path relative to the current projects directory"
  (find-file (proel-relative-to-absolute proel-current-project relative-path)))

(defun proel-find-path (project-name)
  "Given a project name like 'foo', it returns an absolute path
the project resides in ie. ~/projects/foo"
  (some #'(lambda (dir-with-projects)
            (let ((potential-project-dir (concat dir-with-projects "/" project-name)))
              (when (and
                     (file-exists-p potential-project-dir)
                     (file-directory-p potential-project-dir))
                potential-project-dir)))
        proel-dirs-with-projects))

(defun proel-open-project (project-name)
  "Open project with name 'project-name' using dired"
  (dired (proel-find-path project-name)))

(defun proel-current-project-files ()
  (when proel-current-project
    (proel-project-files proel-current-project)))

;;; Hooks

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

(defun proel-activate-buffers-project ()
  (setq proel-current-project proel-buffers-project))

(defun proel-on-find-file ()
  "The trigger to run after visiting a file, or direding a directory"
  (let* ((path (if dired-directory (expand-file-name dired-directory) (buffer-file-name)))
         (project (proel-detect-project path)))
    (when project
      (setq proel-buffers-project project)
      (proel-activate-buffers-project)
      (proel-setup-cscope)
      (proel-setup-ctags)
      (proel-setup-modeline))))

(add-hook 'find-file-hook  #'proel-on-find-file)
(add-hook 'dired-after-readin-hook #'proel-on-find-file)

;;; Activate the matching project when changing buffer/window/frame

(defadvice switch-to-buffer (after activate-buffers-project (buffer &optional norecord) activate)
  (when proel-buffers-project (proel-activate-buffers-project)))

(defadvice select-window (after activate-windows-project (window &optional norecord) activate)
  (when proel-buffers-project (proel-activate-buffers-project)))

(defadvice other-window (after activate-windows-project-2 (count &optional all-frames) activate)
  (when proel-buffers-project (proel-activate-buffers-project)))

(defadvice select-frame (after activate-frames-project (frame &optional norecord) activate)
  (when proel-buffers-project (proel-activate-buffers-project)))

;;; General interface

;;; General interface - Version Control

(defun proel-vc-gitp ()
  (let ((git-dir (proel-relative-to-absolute proel-current-project ".git")))
    (and (file-exists-p git-dir)
         (file-directory-p git-dir))))

(defun proel-vc-git-run ()
  (git-status (proel-project-path proel-current-project)))

(defun proel-vc-svnp ()
  (let ((svn-dir (proel-relative-to-absolute proel-current-project ".svn")))
    (and (file-exists-p svn-dir)
         (file-directory-p svn-dir))))

(defun proel-vc-svn-run ()
  (svn-status (proel-project-path proel-current-project)))

(defvar proel-vc-backends
  '((proel-vc-gitp . proel-vc-git-run)
    (proel-vc-svnp . proel-vc-svn-run))
  "A list of predicate . runner dotted pairs. The predicate
determines whether the current project is under control of a
particular VCS and the runner functions gets executed if so.")

(defun proel-vc-in-project ()
  "Run a version control interface in the projects main
directory"
  (interactive)
  (mapc #'(lambda (vc-cons)
            (let ((vc-predicate (car vc-cons))
                  (vc-runner (cdr vc-cons)))
              (when (funcall (car vc-cons))
                (funcall (cdr vc-cons)))))
        proel-vc-backends))

;;; General interface - Grep

(defun proel-grep-in-project ()
  "Runs grep in one of the current projects directories"
  (interactive)
  (let* ((grep-pattern      (read-string "Search for: " nil 'pattern))
         (grep-in-dir-input (read-directory-name "In directory: " (proel-project-path proel-current-project)))
         (grep-in-dir       (file-name-as-directory (expand-file-name grep-in-dir-input))))
    (rgrep grep-pattern "*" grep-in-dir)))

;;; Anything interface

(defvar proel-anything-projects
  '((name . "Available projects")
    (candidates . proel-projects-available)
    (action ("Open project" . proel-open-project))
    (type . project)))

(defun proel-exact-selector (candidate)
  (string-match anything-input candidate))

(defun proel-fuzzy-selector (candidate)
  (> (FM-matchiness anything-input (file-name-nondirectory candidate))
     (* (/ 2.0 3.0) (length anything-input))))

(defun proel-fuzzy-sort (candidate-a-full candidate-b-full)
  (let* ((candidate-a  (file-name-nondirectory candidate-a-full))
         (candidate-b  (file-name-nondirectory candidate-b-full))
         (matchiness-a (FM-matchiness anything-input candidate-a))
         (matchiness-b (FM-matchiness anything-input candidate-b)))
    (if (= matchiness-a matchiness-b)
        (<
         (abs (- (length candidate-a) (length anything-input)))
         (abs (- (length candidate-b) (length anything-input))))
      (> matchiness-a matchiness-b))))

(defun proel-fuzzy-transformer (candidates source)
  (sort (copy-list candidates) #'proel-fuzzy-sort))

(defvar proel-anything-current-project-files
  '((name . "Project files")
    (candidates . proel-current-project-files)
    (match . (proel-exact-selector
              proel-fuzzy-selector))
    (filtered-candidate-transformer . proel-fuzzy-transformer)
    (action ("Find file in project" . proel-find-file))
    (type . project-file)))

(provide 'proel)
