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
 '(custom-safe-themes
   (quote
    ("17f35b689dd41e49cb740bfb810ac8a53d13292cbebf68f41f772787d8b3aebf" "ced74ff794aad9ac93266bf9a9a92c5641c01b05715c6862e30459a24844eec9" "8a36587d6cbcc30c85372568ed29d45ec393a32e3c779cba8cfd5fade229025d" "d3a86848a5e9bf123f3dd3bf82ab96995837b50f780dd7d5f65dc72c2b81a955" "fe6fb0cb1aa50dc563d81aad98c470a30f4e89db6d55a108f1083f33317ad413" "54a8c782a7a66e9aeb542af758f7f9f1a5702b956f425ffe15fccf5339f01f1e" "6184465774e662dc5f3ddb0751b20d97aaff2ae95d5cf3c885b6c1944ddcb371" "cc495c40747ae22dd2de6e250cbd9a408e3588b59989368af565deeeff334126" "9fab7d4f70b99927d898a0c93b1ae90fc1529248b9c2604ed88e864fc2665aa7" "f0e69da2cf73c7f153fc09ed3e0ba6e1fd670fec09b8a6a8ed7b4f9efea3b501" "17fd8388e49d3055185e817ed3a2b7c955a2dda92b990f475c14a8e1d97dbe4b" "3f04f37604c5f5cc3c71bc1a4a604ed8be340d0f150946b25658e403ccbad6d2" "3328e7238e0f6d0a5e1793539dfe55c2685f24b6cdff099c9a0c185b71fbfff9" "113ae6902d98261317b5507e55ac6e7758af81fc4660c34130490252640224a2" "1dd2d01010a9ae1f54775abceb080e231b6f9c781c5282b25b8c4edd3f3a14e0" "3514fe07ecd0dc2f8b747706370c169b3d8053f825c009414e1a86eac8978327" "d7e434a3c19f87fa00b945edfaedc9a21a6e436a7814c23277d4112ad83b5e85" default)))
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
    (multi-term ir-black-theme inf-ruby elisp--witness--lisp yasnippet base16-theme haskell-mode markdown-mode iedit projectile js2-mode find-file-in-project wakatime-mode expand-region ag wrap-region smartparens smex flx-ido highlight-symbol flycheck rainbow-delimiters company-go golint go-eldoc go-mode syntax-subword exec-path-from-shell use-package)))
 '(rspec-command-options "--color --order random" t)
 '(rspec-spec-command "sp")
 '(rspec-use-bundler-when-possible t t)
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
 '(mode-line ((t (:box nil) (:background "grey3"))))
 '(mode-line-inactive ((t (:box nil) (:background "grey6"))))
 '(org-level-1 ((t (:inherit nil :background "gray15" :foreground "gray95" :weight bold)))))
