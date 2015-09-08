(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#2f1e2e" "#ef6155" "#48b685" "#fec418" "#06b6ef" "#815ba4" "#06b6ef" "#a39e9b"])
 '(ansi-term-color-vector
   [unspecified "#2f1e2e" "#ef6155" "#48b685" "#fec418" "#06b6ef" "#815ba4" "#06b6ef" "#a39e9b"] t)
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(bmkp-last-as-first-bookmark-file "~/.bookmarks_emacs")
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(fci-rule-color "#6c6c6c")
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-disabled-checkers (quote (ruby-rubylint ruby-lint)))
 '(flycheck-display-errors-delay 0.2)
 '(gnus-logo-colors (quote ("#528d8d" "#c0c0c0")))
 '(package-selected-packages
   (quote
    (org-mode php-mode ido-compleating-read+ gruber-darker-theme web-mode zonokai-theme zerodark-theme gotham-theme spacemacs-theme ruby-hash-syntax darktooth-theme color-theme-sanityinc-tomorrow alect-themes alert elixir-mode alchemist idoimenu idomenu imenus ido-completing-read+ rainbow-mode planet-theme apropospriate-theme seti-theme atom-dark-theme subatomic-theme underwater-theme inkpot-theme smart-compile sublime-themes firebelly-theme flatland-theme flatland-black-theme firecode-theme twilight-theme dark-krystal-theme bliss-theme minimal-theme farmhouse-theme focus powerline powerline-evil smart-mode-line evil emamux-ruby-test emamux wgrep-ag rbenv magit rubocop rspec-mode persp-projectile perspective imenu+ gist multi-term ir-black-theme inf-ruby elisp--witness--lisp yasnippet base16-theme haskell-mode markdown-mode iedit projectile js2-mode find-file-in-project wakatime-mode expand-region ag wrap-region smartparens smex flx-ido highlight-symbol flycheck rainbow-delimiters company-go golint go-eldoc go-mode syntax-subword exec-path-from-shell use-package)))
 '(rspec-command-options "--color --order random")
 '(rspec-spec-command "sp")
 '(rspec-use-bundler-when-possible t)
 '(rspec-use-spring-when-possible nil)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(when
      (or
       (not
        (boundp
         (quote ansi-term-color-vector)))
       (not
        (facep
         (aref ansi-term-color-vector 0))))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-symbol-face ((t (:background "dark blue" :underline nil :weight normal))))
 '(org-level-1 ((t (:inherit nil :background "gray15" :foreground "gray95" :weight bold)))))
