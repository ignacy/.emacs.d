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
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil)
 '(custom-safe-themes
   (quote
    ("d7e434a3c19f87fa00b945edfaedc9a21a6e436a7814c23277d4112ad83b5e85" "1dd2d01010a9ae1f54775abceb080e231b6f9c781c5282b25b8c4edd3f3a14e0" "d72836155cd3b3e52fd86a9164120d597cbe12a67609ab90effa54710b2ac53b" "e7ec0cc3ce134cc0bd420b98573bbd339a908ac24162b8034c98e1ba5ee1f9f6" "d3a86848a5e9bf123f3dd3bf82ab96995837b50f780dd7d5f65dc72c2b81a955" default)))
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-disabled-checkers (quote (ruby-rubylint ruby-lint)))
 '(flycheck-display-errors-delay 0.2)
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")) t)
 '(ibuffer-deletion-face (quote error))
 '(magit-diff-use-overlays nil)
 '(magit-item-highlight-face nil)
 '(magit-use-overlays nil)
 '(package-selected-packages
   (quote
    (yaml-mode xterm-keybinder wrap-region wakatime-mode visual-regexp use-package unkillable-scratch term-run syntax-subword swiper sublime-themes smex smartscan smartparens sane-term ruby-hash-syntax rubocop rspec-mode rhtml-mode restclient request rbenv rainbow-mode rainbow-delimiters persp-projectile multiple-cursors material-theme markdown-mode magit key-chord js2-mode ir-black-theme inf-ruby hungry-delete highlight-symbol haskell-mode haml-mode guide-key google-this golint go-eldoc gist font-lock+ flycheck flx-ido find-file-in-project farmhouse-theme fancy-narrow expand-region exec-path-from-shell evil-tutor evil-surround evil-nerd-commenter evil-matchit evil-leader easy-kill company-quickhelp company-go color-theme-sanityinc-tomorrow color-identifiers-mode base16-theme auto-dim-other-buffers atom-dark-theme ag ace-window ace-jump-mode)))
 '(rspec-command-options "--color --order random")
 '(rspec-spec-command "sp")
 '(rspec-use-bundler-when-possible t)
 '(rspec-use-spring-when-possible nil)
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
 '(default ((t (:inherit nil :stipple nil :background "gray8" :foreground "#f6f2f3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Source Code Pro"))))
 '(font-lock-type-face ((t (:foreground "MediumPurple3"))))
 '(mode-line ((t (:box nil) (:background "grey3"))))
 '(mode-line-inactive ((t (:box nil) (:background "grey6"))))
 '(org-level-1 ((t (:inherit nil :background "gray15" :foreground "gray95" :weight bold)))))
