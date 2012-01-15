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


(defun im/goto-file ()
  "Find file in git project"
  (interactive)
  (let ((root (im/find-project-root)))
    (when (null root) 
      (error "Can't find root"))
    (ido-find-file-in-dir root)))
     
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
