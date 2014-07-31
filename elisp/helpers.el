(defalias 'spell 'ispell-buffer)


(defun remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil
            t))

(add-hook 'emacs-lisp-mode-hook 'remove-elc-on-save)

(defun clean-up-buffer-or-region ()
  "Untabifies, indents and deletes trailing whitespace from buffer or region."
  (interactive)
  (save-excursion
    (unless (region-active-p)
      (mark-whole-buffer))
    (untabify (region-beginning) (region-end))
    (indent-region (region-beginning) (region-end))
    (save-restriction
      (narrow-to-region (region-beginning) (region-end))
      (delete-trailing-whitespace))))


(defun cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that
might be bad."
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))

;; Various superfluous white-space. Just say no.
(add-hook 'before-save-hook 'cleanup-buffer-safe)


(defun prompt-quit-emacs ()
  "Prompt before quitting Emacs."
  (interactive)
  (if (y-or-n-p (format "Really quit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))
(when window-system
  (global-set-key (kbd "C-x C-c") 'prompt-quit-emacs))

(defun find-tag-at-point ()
  (interactive)
  (find-tag (thing-at-point 'symbol)))

(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))

(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))
(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-buffer)
        (message "Indented buffer.")))))


(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun im/kill-current-buffer()
  "Most of the times you just want to kill currently opened buffer"
  (interactive)
  (kill-buffer (current-buffer)))

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(setq deployable-apps '("dev_locator" "dev_nds" "dev_qbp" "dev_otp"))

(defun deploy ()
  (interactive)
  (let ((app (ido-completing-read "Which app?: " deployable-apps)))
    (compile (concat "cd " "/Users/ignacymoryc/code/capistrano_configuration && cap " app " deploy"))))


(setq deployed-applications '("qbp_backend" "otp_manager"))

(defun search-dev-log-for ()
  (interactive)
  (let ((app (ido-completing-read "Which app?: " deployed-applications))
        (query (read-string "Query: " nil nil)))
    (compile (concat "search_dev_log_for " app " " query))))


(defun im/split ()
  "Splits window into 3 nice columns"
  (interactive)
  (save-excursion
    (split-window-horizontally)
    (split-window-horizontally)
    (balance-windows)))

(defun deploy-nds-local ()
  (interactive)
  (compile "~/bin/local_nds_deploy"))

(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))

(defun tail-nds-local ()
  (interactive)
  (shell-command "tail -f /usr/local/Cellar/tomcat/7.0.53/libexec/logs/pnds1.log"))


(defun node-repl ()
  (interactive)
  (pop-to-buffer (make-comint "node-repl" "node" nil "--interactive")))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(defun swap-windows ()
  "If you have 2 windows, it swaps them." (interactive)
  (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (first (window-list)))
                (w2 (second (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1)))))

(defun other-window-backwards ()
  "Select the previous window."
  (interactive)
  (other-window -1))

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line] 'smarter-move-beginning-of-line)


(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))


(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))

(defadvice other-window (after other-window-now activate)
  (when (< (window-width) 80)
    (enlarge-window (- 80 (window-width)) t)))

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))
(add-hook 'after-save-hook 'byte-compile-current-buffer)


(define-minor-mode focus-on-buffer-mode
  "Minor mode to center the buffer onscreen and display it in a narrow column.
Currently only supports doing this in one frame at a time."
  :init-value nil
  :lighter " Focus"
  (message "focus-on-buffer-mode is %s" (prin1-to-string focus-on-buffer-mode))
  (if focus-on-buffer-mode
      (progn
        ;; (setq focus-on-buffer-mode:fullscreen (frame-parameter nil 'fullscreen))
        ;; TODO: make focus-on-buffer-mode:config a set of configurations, one
        ;; per frame
        ;; (setq focus-on-buffer-mode:config (current-window-configuration))
        (setq focus-on-buffer-mode:fringe fringe-mode)
        (setq focus-on-buffer-mode:indicators fringe-indicator-alist)
        (delete-other-windows)
        ;; TODO: uncomment this once the Emacs bug is fixed where
        ;; (frame-pixel-width) is unreliable in full screen
        ;; (set-frame-parameter nil 'fullscreen 'fullboth)
        (set-fringe-mode
         (/ (- (frame-pixel-width)
               (* 100 (frame-char-width)))
            2))
        (setq fringe-indicator-alist nil))
    ;; (set-frame-parameter nil 'fullscreen focus-on-buffer-mode:fullscreen)
    (setq fringe-indicator-alist focus-on-buffer-mode:indicators)
    ;; (set-window-configuration focus-on-buffer-mode:config)
    (set-fringe-mode focus-on-buffer-mode:fringe)))


(defmacro make-backward-kill-word-fn (backward-kill-word-fn
                                      &optional backward-kill-word-args)
  "Construct a function that kills the region if active,
otherwise invokes BACKWARD-KILL-WORD-FN, which must be an unquoted symbol."
  (let* ((bkwf-name (symbol-name backward-kill-word-fn))
         (defun-name (intern (concat "kill-region-or-" bkwf-name)))
         (docstring (format "Kill the region if active, otherwise invoke %s."
                            bkwf-name)))
    `(defun ,defun-name ()
       ,docstring
       (interactive)
       (if (region-active-p)
           (kill-region (region-beginning) (region-end))
         (apply (quote ,backward-kill-word-fn) (quote ,backward-kill-word-args))))))



(defun endless/ispell-word-then-abbrev (p)
  "Call `ispell-word'. Then create an abbrev for the correction made.
With prefix P, create local abbrev. Otherwise it will be global."
  (interactive "P")
  (let ((bef (downcase (or (thing-at-point 'word) ""))) aft)
    (call-interactively 'ispell-word)
    (setq aft (downcase (or (thing-at-point 'word) "")))
    (unless (string= aft bef)
      (message "\"%s\" now expands to \"%s\" %sally"
               bef aft (if p "loc" "glob"))
      (define-abbrev
        (if p global-abbrev-table local-abbrev-table)
        bef aft))))

(setq selective-display-level 0)
(setq selective-display-increment 4)
(setq max-selective-display-level 8)
(defun switch-selective-display ()
  "Switch to the next selective display level, starting over if appropriate"
  (if (>= selective-display-level max-selective-display-level)
      (setq selective-display-level 0)
    (setq selective-display-level
          (+ selective-display-increment
             selective-display-level)))
  (interactive)
  (set-selective-display selective-display-level))
(global-set-key "\M-c" 'switch-selective-display)


(defun narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, subtree, or defun, whichever applies
first.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode) (org-narrow-to-subtree))
        (t (narrow-to-defun))))

(global-set-key (kbd "C-x t n") 'narrow-or-widen-dwim)

(defun join-lines (arg)
  (interactive "p")
  (end-of-line)
  (delete-char 1)
  (delete-horizontal-space)
  (insert " "))

(provide 'helpers)
