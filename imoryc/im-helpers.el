;; Moje funkcje


;; (defun im/clear-elc-files
;;   "Clear all bytecompiled emacs files"
;;   (shell-command "find ~/.emacs.d/ -name *.elc -exec rm {} \;"))


(defun my-ido-find-tag ()
  "Find a tag using ido"
  (interactive)
  (tags-completion-table)
  (let (tag-names)
    (mapatoms (lambda (x)
                (push (prin1-to-string x t) tag-names))
              tags-completion-table)
    (find-tag (ido-completing-read "Tag: " tag-names))))

(defun heroku-run-ask ()
  "Runs heroku command and always asks for app name"
  (interactive)
  (heroku-run t))



(defun defunkt-duplicate-line ()
  (interactive)
  (beginning-of-line)
  (copy-region-as-kill (point) (progn (end-of-line) (point)))
  (textmate-next-line)
  (yank)
  (beginning-of-line)
  (indent-according-to-mode))

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

(require 'ido-hacks)

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

;; (custom-set-faces
;;  '(ido-subdir ((t (:foreground "PaleGreen")))) ;; Face used by ido for highlighting subdirs in the alternatives.
;;  '(ido-first-match ((t (:foreground "DodgerBlue" :background "#dff")))) ;; Face used by ido for highlighting first match.
;;  '(ido-only-match ((t (:foreground "#ffcc33")))) ;; Face used by ido for highlighting only match.
;;  '(ido-indicator ((t (:foreground "#ffffff")))) ;; Face used by ido for highlighting its indicators (don't actually use this)
;;  '(ido-incomplete-regexp ((t (:foreground "#ffffff"))))) ;; Ido face for indicating incomplete regexps. (don't use this either)

(custom-set-faces
 '(ido-subdir ((t (:foreground "PaleGreen")))) ;; Face used by ido for highlighting subdirs in the alternatives.
 '(ido-first-match ((t (:foreground "SeaGreen1" :background "gray14")))) ;; Face used by ido for highlighting first match.
 '(ido-only-match ((t (:foreground "#ffcc33")))) ;; Face used by ido for highlighting only match.
 '(ido-indicator ((t (:foreground "#ffffff")))) ;; Face used by ido for highlighting its indicators (don't actually use this)
 '(ido-incomplete-regexp ((t (:foreground "#ffffff"))))) ;; Ido face for indicating incomplete regexps. (don't use this either)



(defun toggle-letter-case ()
  "Toggle the letter case of current word or text selection.
Toggles between: “all lower”, “Init Caps”, “ALL CAPS”."
  (interactive)
  (let (p1 p2 (deactivate-mark nil) (case-fold-search nil))
    (if (region-active-p)
        (setq p1 (region-beginning) p2 (region-end))
      (let ((bds (bounds-of-thing-at-point 'word) ) )
        (setq p1 (car bds) p2 (cdr bds)) ) )

    (when (not (eq last-command this-command))
      (save-excursion
        (goto-char p1)
        (cond
         ((looking-at "[[:lower:]][[:lower:]]") (put this-command 'state "all lower"))
         ((looking-at "[[:upper:]][[:upper:]]") (put this-command 'state "all caps") )
         ((looking-at "[[:upper:]][[:lower:]]") (put this-command 'state "init caps") )
         ((looking-at "[[:lower:]]") (put this-command 'state "all lower"))
         ((looking-at "[[:upper:]]") (put this-command 'state "all caps") )
         (t (put this-command 'state "all lower") ) ) ) )

    (cond
     ((string= "all lower" (get this-command 'state))
      (upcase-initials-region p1 p2) (put this-command 'state "init caps"))
     ((string= "init caps" (get this-command 'state))
      (upcase-region p1 p2) (put this-command 'state "all caps"))
     ((string= "all caps" (get this-command 'state))
      (downcase-region p1 p2) (put this-command 'state "all lower")) )
    ) )

(defun save-macro (name)
  "save a macro. Take a name as argument
     and save the last defined macro under
     this name at the end of your .emacs"
  (interactive "SName of the macro :")  ; ask for the name of the macro
  (kmacro-name-last-macro name)         ; use this name for the macro
  (find-file "~/.emacs.d/imoryc/im-helpers.el")
  (goto-char (point-max))               ; go to the end of the .emacs
  (newline)                             ; insert a newline
  (insert-kbd-macro name)               ; copy the macro
  (newline)                             ; insert a newline
  (switch-to-buffer nil))               ; return to the initial buffer

(require 'etags)
(defun ido-find-tag ()
  "Find a tag using ido"
  (interactive)
  (tags-completion-table)
  (let (tag-names)
    (mapc (lambda (x)
            (unless (integerp x)
              (push (prin1-to-string x t) tag-names)))
          tags-completion-table)
    (find-tag (ido-completing-read "Tag: " tag-names))))

(global-set-key [remap find-tag] 'ido-find-tag)


(defvar smart-use-extended-syntax nil
  "If t the smart symbol functionality will consider extended
syntax in finding matches, if such matches exist.")

(defvar smart-last-symbol-name ""
  "Contains the current symbol name.

This is only refreshed when `last-command' does not contain
either `smart-symbol-go-forward' or `smart-symbol-go-backward'")

(make-local-variable 'smart-use-extended-syntax)

(defvar smart-symbol-old-pt nil
  "Contains the location of the old point")

(defun smart-symbol-goto (name direction)
  "Jumps to the next NAME in DIRECTION in the current buffer.

DIRECTION must be either `forward' or `backward'; no other option
is valid."

  ;; if `last-command' did not contain
  ;; `smart-symbol-go-forward/backward' then we assume it's a
  ;; brand-new command and we re-set the search term.
  (unless (memq last-command '(smart-symbol-go-forward
                               smart-symbol-go-backward))
    (setq smart-last-symbol-name name))
  (setq smart-symbol-old-pt (point))
  (message (format "%s scan for symbol \"%s\""
                   (capitalize (symbol-name direction))
                   smart-last-symbol-name))
  (unless (catch 'done
            (while (funcall (cond
                             ((eq direction 'forward) ; forward
                              'search-forward)
                             ((eq direction 'backward) ; backward




                              'search-backward)
                             (t (error "Invalid direction"))) ; all others
                            smart-last-symbol-name nil t)
              (unless (memq (syntax-ppss-context
                             (syntax-ppss (point))) '(string comment))
                (throw 'done t))))
    (goto-char smart-symbol-old-pt)))

(defun smart-symbol-go-forward ()
  "Jumps forward to the next symbol at point"
  (interactive)
  (smart-symbol-goto (smart-symbol-at-pt 'end) 'forward))

(defun smart-symbol-go-backward ()
  "Jumps backward to the previous symbol at point"
  (interactive)
  (smart-symbol-goto (smart-symbol-at-pt 'beginning) 'backward))

(defun smart-symbol-at-pt (&optional dir)
  "Returns the symbol at point and moves point to DIR (either `beginning' or `end') of the symbol.

If `smart-use-extended-syntax' is t then that symbol is returned
instead."
  (with-syntax-table (make-syntax-table)
    (if smart-use-extended-syntax
        (modify-syntax-entry ?. "w"))
    (modify-syntax-entry ?_ "w")
    (modify-syntax-entry ?- "w")
    ;; grab the word and return it
    (let ((word (thing-at-point 'word))
          (bounds (bounds-of-thing-at-point 'word)))
      (if word
          (progn
            (cond
             ((eq dir 'beginning) (goto-char (car bounds)))
             ((eq dir 'end) (goto-char (cdr bounds)))
             (t (error "Invalid direction")))
            word)
        (error "No symbol found")))))


(defun other-window-backwards ()
  "Select the previous window."
  (interactive)
  (other-window -1))


(setq line-move-visual nil)

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))
