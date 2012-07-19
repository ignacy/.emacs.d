
(defadvice switch-to-buffer (before existing-buffer
                                    activate compile)
  "When interactive, switch to existing buffers only,
unless given a prefix argument."
  (interactive
   (list (read-buffer "Switch to buffer: "
                      (other-buffer)
                      (null current-prefix-arg)))))

;; IBUFFER Settings
(defalias 'list-buffers 'ibuffer)
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-always-show-last-buffer nil)
(setq ibuffer-sorting-mode 'recency)
(setq ibuffer-formats '((mark modified read-only " "
                              (name 30 30 :left :elide)
                              " " filename-and-process)))

(setq ibuffer-use-header-line t)
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("TERMINAL" (name . "^\\*terminal\\*$"))
               ("middleware" (filename . "/code/middleware/"))
               ("fyre" (filename . "/code/webapp/"))
               ("ruby" (mode . ruby-mode))
               ("javascript" (name . "\\.js.erb$\\|.js$"))
               ("ogórki" (name . "\\.feature\$"))
               ("dired" (mode . dired-mode))
               ("Org" (mode . org-mode))
               ("haml" (mode . haml-mode))
               ("elisp" (name . "\\.el\$"))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(defadvice ibuffer-update-title-and-summary (after remove-column-titles)
  (save-excursion
    (set-buffer "*Ibuffer*")
    (toggle-read-only 0)
    (goto-char 1)
    (search-forward "-\n" nil t)
    (delete-region 1 (point))
    (let ((window-min-height 1))
      ;; save a little screen estate
      (shrink-window-if-larger-than-buffer))
    (toggle-read-only)))

(provide 'init-buffer-switching)
