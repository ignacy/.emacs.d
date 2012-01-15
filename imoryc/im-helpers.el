;; Moje funkcje


;; (defun im/clear-elc-files
;;   "Clear all bytecompiled emacs files"
;;   (shell-command "find ~/.emacs.d/ -name *.elc -exec rm {} \;"))

(defun im/diff-current-buffer-with-disk ()
  "Compare the current buffer with it's disk file."
  (interactive)
  (diff-buffer-with-file b(current-buffer)))


(defun im/kill-current-buffer()
  "Most of the times you just want to kill currently opened buffer"
  (interactive)
  (kill-buffer (current-buffer)))

(defun im/reek-on-buffer()
  "Run reek on current buffer"
  (interactive)
  (get-buffer-create "reekOut")
  (shell-command-on-region (point-min) (point-max) "reek"
                           ;; output buffer
                           "reekOut" nil
                           "*reekErrors*" nil)
  (split-window-horizontally)
  (other-window 0)
  (set-buffer (get-buffer-create "reekOut"))
  (other-window 0))

;; (defun figlet-region (&optional b e)
;;   (interactive "r")


;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

(defun im/find-project-root (&optional root)
  "Recursively find .git dir"
  (when (null root) (setq root default-directory))
  (cond
   ((root-matches root '(".git"))
    (expand-file-name root))
   ((equal (expand-file-name root) "/") nil)
   (t (im/find-project-root (concat (file-name-as-directory root) "..")))))


(defun root-match(root names)
  (member (car names) (directory-files root)))

(defun root-matches(root names)
  (if (root-match root names)
      (root-match root names)
      (if (eq (length (cdr names)) 0)
          'nil
          (root-matches root (cdr names))
          )))

(defun im/goto-file ()
  "Use ido to select a file from the project."
  (interactive)
  (setq project-files
        (split-string
         (shell-command-to-string
          "git ls-files") "\n"))
  ;; populate hash table (display repr => path)
  (setq tbl (make-hash-table :test 'equal))
  (let (ido-list)
    (mapc (lambda (path)
            ;; format path for display in ido list
            ;; (setq key (replace-regexp-in-string "\\(.*?\\)\\([^/]+?\\)$" (lambda (v) (propertize v 'face 'bold))
            ;;                                     path))
            ;;                                     ;;"\\1\\2" path))
            (setq key (replace-regexp-in-string "\\(.*?\\)\\([^/]+?\\)$" "\\1 \\2" path))
            ;; strip project root
            (setq key (replace-regexp-in-string (im/find-project-root) "" key))
            ;; remove trailing | or /
            (setq key (replace-regexp-in-string "\\(|\\|/\\)$" "" key))
            (puthash key path tbl)
            (push key ido-list)
            )
          project-files
          )
    (find-file (gethash (ido-completing-read "Open: " ido-list) tbl))))

(custom-set-faces
 '(ido-subdir ((t (:foreground "#66ff00")))) ;; Face used by ido for highlighting subdirs in the alternatives.
 '(ido-first-match ((t (:foreground "#ccff66")))) ;; Face used by ido for highlighting first match.
 '(ido-only-match ((t (:foreground "#ffcc33")))) ;; Face used by ido for highlighting only match.
 '(ido-indicator ((t (:foreground "#ffffff")))) ;; Face used by ido for highlighting its indicators (don't actually use this)
 '(ido-incomplete-regexp ((t (:foreground "#ffffff"))))) ;; Ido face for indicating incomplete regexps. (don't use this either)

 	
;;
