(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(beacon-blink-when-point-moves t)
 '(bmkp-last-as-first-bookmark-file "~/.bookmarks_emacs")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("8577da1641ed4bdf255341ca92e3d0e49c9f4d574458f09ce78159690442cade" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "63592fbfda4e07237ccc427947cf8286e84de105193594f5fbbede357e857e41" "0837ee61843a545a811238fa8f494f62d3de97cbd16b283511007dfb01653ae1" "38eaffa44090e0fe01f57c62492dc6b7ee685601b06270ad7a59862aa5e61ece" "27188886f3bb62e00f1f9a778d91afd6072c7f31941ecf9ec7a847da0ce65d96" "990d820911db2453a93fd80c8e10f1a25d73ea6859aeab8accc7c0c58e562588" "ba6f8606cae826654d4c2242363f2042dd35c1595ef6367ad44d5f42851e6aa9" "7f5837a7dbf54c2b7c41d94f5eb1373cf63274847d1971037faa24d7f2231eea" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "ba315a2ff476efd57a9ce7b9aec0d5e3f891ec1c8c262e40231edeea6a43aab3" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "118717ce0a2645a0cf240b044999f964577ee10137b1f992b09a317d5073c02d" "00f33c1c844d52ea581f6e6eefb00d44bfc0ce8c69da8d302cf6fdbc279267b5" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "9c8ac936853560f83aa9f2a586c1d687f9637c8428032a7dccedd337bf6352de" "0aca3a26459bbb43a77f34bc22851c05c0a5d70d3230cbcdbda4fec20fef77e6" "fe6330ecf168de137bb5eddbf9faae1ec123787b5489c14fa5fa627de1d9f82b" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9a3c51c59edfefd53e5de64c9da248c24b628d4e78cc808611abd15b3e58858f" "3ed645b3c08080a43a2a15e5768b893c27f6a02ca3282576e3bc09f3d9fa3aaa" "a3132bd39a977ddde4c002f8bd0ef181414c3fbe9228e3643b999491192680ad" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "7ceb8967b229c1ba102378d3e2c5fef20ec96a41f615b454e0dc0bfa1d326ea6" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "614f8478963ec8caac8809931c9d00f670e4519388c02f71d9d27b66d5741a7f" "bcd22c7dd8197a829c082018dcde06ba02ca7cf370a31b96f323e68bf6b97ed8" "e182202f3bbfa98383a20e9ea8dd98beb62c13759facfe9dbc94bb8d5bac93cc" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "4af6fad34321a1ce23d8ab3486c662de122e8c6c1de97baed3aa4c10fe55e060" "0155b3b94f6d5bce0275a15bc662be4f6f9f3284f9e469ca4ab1bd67ff9b5222" "e068fe5ad47d55ddb6dedd5dd91b020645ec42cc14190ff6a35e003d6ea6f449" "77c65d672b375c1e07383a9a22c9f9fc1dec34c8774fe8e5b21e76dca06d3b09" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "d25d9b2b1e800a74fea4f6d174c4bd1b9c19a7617b22cc349245a36417c56ece" "2ef75a0b64c58767376c9e2c5f07027add146720e6fab6b196cb6a1c68ef3c3f" "3d0ecdfc0bd10d18a8f73a607009339c302d695b8ffdc06adb324f466b6d3005" "76626efc044daee1c402e50f185bd633d1a688c332bc15c8fd5db4cdf2966b79" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#9876aa" :underline
          (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
                         (:color "#808080"))
     (implicitParams :underline
                     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6"))))
 '(fci-rule-color "#6c6c6c")
 '(flycheck-check-syntax-automatically nil)
 '(flycheck-disabled-checkers (quote (ruby-rubylint ruby-lint)))
 '(flycheck-display-errors-delay 0.2)
 '(gnus-logo-colors (quote ("#528d8d" "#c0c0c0")))
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (dracula-theme jbeans-theme phoenix-dark-mono-theme phoenix-dark-pink-theme monochrome-theme tao-theme beacon yaml-mode rainbow-identifiers rainbow-identifiers-mode color-identifiers-mode fill-column-indicator fish-mode puppet-mode darcula-theme spacegray-theme abyss-theme cyberpunk-theme htmlize ido-clever-match ido-ubiquitous company shell-pop solarized-theme ace-isearch helm-ag helm-projectile helm projectile-rails darkmine-theme turnip gandalf-theme professional-theme material-theme majapahit-theme afternoon-theme aurora-theme haml-mode haml org-mode php-mode ido-compleating-read+ gruber-darker-theme web-mode zonokai-theme zerodark-theme gotham-theme spacemacs-theme ruby-hash-syntax darktooth-theme color-theme-sanityinc-tomorrow alect-themes alert elixir-mode alchemist idoimenu idomenu imenus ido-completing-read+ rainbow-mode planet-theme apropospriate-theme seti-theme atom-dark-theme subatomic-theme underwater-theme inkpot-theme smart-compile sublime-themes firebelly-theme flatland-theme flatland-black-theme firecode-theme twilight-theme dark-krystal-theme bliss-theme minimal-theme farmhouse-theme focus powerline powerline-evil smart-mode-line evil emamux-ruby-test emamux wgrep-ag rbenv magit rubocop rspec-mode persp-projectile perspective imenu+ gist multi-term ir-black-theme inf-ruby elisp--witness--lisp yasnippet base16-theme haskell-mode markdown-mode iedit projectile js2-mode find-file-in-project wakatime-mode expand-region ag wrap-region smartparens smex flx-ido highlight-symbol flycheck rainbow-delimiters company-go golint go-eldoc go-mode syntax-subword exec-path-from-shell use-package)))
 '(rspec-command-options "")
 '(rspec-notification-command "terminal-notifier -message")
 '(rspec-spec-command "sp")
 '(rspec-use-bundler-when-possible t)
 '(rspec-use-spring-when-possible nil)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#bf616a")
     (40 . "#DCA432")
     (60 . "#ebcb8b")
     (80 . "#B4EB89")
     (100 . "#89EBCA")
     (120 . "#89AAEB")
     (140 . "#C189EB")
     (160 . "#bf616a")
     (180 . "#DCA432")
     (200 . "#ebcb8b")
     (220 . "#B4EB89")
     (240 . "#89EBCA")
     (260 . "#89AAEB")
     (280 . "#C189EB")
     (300 . "#bf616a")
     (320 . "#DCA432")
     (340 . "#ebcb8b")
     (360 . "#B4EB89"))))
 '(vc-annotate-very-old-color nil)
 '(wakatime-api-key "84;0;0c")
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
 )
