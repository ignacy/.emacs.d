(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(bmkp-last-as-first-bookmark-file "~/.bookmarks_emacs")
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil)
 '(flycheck-display-errors-delay 0.2)
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")) t)
 '(ibuffer-deletion-face (quote error))
 '(magit-diff-use-overlays nil)
 '(magit-item-highlight-face nil)
 '(magit-use-overlays nil)
 '(rspec-command-options "--color --order random")
 '(rspec-spec-command "sp")
 '(rspec-use-bundler-when-possible t)
 '(rspec-use-spring-when-possible nil)
 )


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray8" :foreground "#f6f2f3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Source Code Pro"))))
 '(font-lock-type-face ((t (:foreground "MediumPurple3"))))
 '(mode-line ((t (:box nil) (:background "grey3"))))
 '(mode-line-inactive ((t (:box nil) (:background "grey6"))))
 '(org-level-1 ((t (:inherit nil :background "gray15" :foreground "gray95" :weight bold)))))
