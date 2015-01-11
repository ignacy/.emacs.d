(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#383830" "#f92672" "#a6e22e" "#f4bf75" "#66d9ef" "#ae81ff" "#66d9ef" "#f5f4f1"])
 '(ansi-term-color-vector
   [unspecified "#081724" "#ff694d" "#68f6cb" "#fffe4e" "#bad6e2" "#afc0fd" "#d2f1ff" "#d3f9ee"] t)
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(background-mode dark)
 '(bmkp-last-as-first-bookmark-file "~/.bookmarks_emacs")
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("b27703f48debe5b4d9127c2712d0baeab4381ec72024e073225db17aa79241fa" "71b64c9f8331d7ea1429ec23c0c067bf014d78951dcfe79d1e123a78eb2ff61d" "3b60e9582f0e34fa2efb6a67074264e42697a26087f16a2517f0a79a7335ab0f" "3bcffb95c7ac651757a9032753ac9fa9a80416cc712001648ec1d84f80bbe072" "43fa7d11f1fd4485ea4b6cb8c681e8f90d61c0698181f802570ac15d47d00400" "a233249cc6f90098e13e555f5f5bf6f8461563a8043c7502fb0474be02affeea" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" "0f002f8b472e1a185dfee9e5e5299d3a8927b26b20340f10a8b48beb42b55102" "fbeff20de53b8af505925fee06ed2acbbbd4932e0c3f1e99089a18e01577cc53" "1bcc25344dbd809487d47384658a66e3219edcacbe75f02c2b69808eda750e8a" "a772eafba4eda0ed57a5d651a96804487a1dacbfbf8658084bfe84546a7c7008" "a8be70fe51a47280ddf068a8193c630e2c71b820a247dcdb188d45d0714e3b95" "a005ca9ce449d199eabefe6fa80d0d1762f563460cfdea9727ccfeee05665f46" "85960419f214c6aa495861f5135bfbb076095edef64547bdd3cedb09803f07ce" "caaef884831c7dd6822d2686868e36f33621ef694d7e22c59d4d56136b4a714e" "f0c681516141144b23c09a54edae3c3027e97b2ce41050f8effe5db409f51f6c" "e80f6b86db417072aa428e662f5d0606cfea6f8084009a943d82ea25bbd9c700" "c69211d8567a0c5fa14b81c4cd08c4a458db7904c10d95f75d6ecd1b8baf19bd" "60f84026471bc44896ab79f0f0bb1e01d7a0eb8eecf53d90ea3e8016d020ad08" "4a60f0178f5cfd5eafe73e0fc2699a03da90ddb79ac6dbc73042a591ae216f03" "22ee8a5d6de86d5181f40e411c354ddde1f84ff246ad8a3cc8fa050282738d80" "56cb99174fad69feba8edd6663c592e77d77332fb4c4bb5be058ef459a426463" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "5799bedffd42f282db713e8a3138a0085f20b82073fb2e2a404340086b96a07b" "5ea20171762b3f9682fbf507ee4b4018ce7b6cc65415fa99799a125f112b2cdb" "c08c5e81432b54fcbc0a1f7f714687f02894e0a8d45e4a8298abb9eedd7f7a05" "3c9d994e18db86ae397d077b6324bfdc445ecc7dc81bb9d528cd9bba08c1dac1" "8a53b1ea9fccb70bac3ed0b68a522c171b6462bd68923be7500e83dc02570bf0" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "de66c72d07f5671ccf18901ab7873c94aa558d4231d678080ab194a2a95e6d91" "0c97dcff4ea6ac23af383e6153723a712c1de3a4b427e97d1e473504dbc2fe06" "1af9aa2eaaaf6cfa7d3b3d0c6d653a9e05b28f11681fbf4efb75812f4a2a310a" "a5beb9b1d6dc23dd8a3c204c159c9a5f1e0115ff14b5b8579d6f3ede4f3b3aee" "26247bcb0b272ec9a5667a6b854125450c88a44248123a03d9f242fd5c6ec36f" "3103287c8d39800d6b41f8664b223f8ecdd8c6cc0b073441e174b61afdb4ce02" "4530ef4d9cf54740fffb6ce25b393122158057d213a2b812f04930fcadf89d62" "d96416845141e99d05d45b5f99ecf46458bf97654be7d2e20184c5edcda1580a" "1934bf7e1713bf706a9cb36cc6a002741773aa42910ca429df194d007ee05c67" "e4bc8563d7651b2fed20402fe37b7ab7cb72869f92a3e705907aaecc706117b5" "3d003561784526d83d1dd187aecf4799c72af27046bc3aa2f6d95c64e5ee4746" "c01f093ab78aad6ae2c27abc47519709c6b3aaa2c1e35c712d4dd81ff1df7e31" "569dc84822fc0ac6025f50df56eeee0843bffdeceff2c1f1d3b87d4f7d9fa661" default)))
 '(fci-rule-color "#f1c40f")
 '(flycheck-display-errors-delay 0.5)
 '(fringe-mode 5 nil (fringe))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(linum-format " %7i ")
 '(magit-use-overlays nil)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(rspec-command-options "--color --order random")
 '(rspec-use-bundler-when-possible t)
 '(rspec-use-spring-when-possible nil)
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(vc-annotate-background "#2b2b2b")
 '(vc-annotate-color-map
   (quote
    ((20 . "#bc8383")
     (40 . "#cc9393")
     (60 . "#dfaf8f")
     (80 . "#d0bf8f")
     (100 . "#e0cf9f")
     (120 . "#f0dfaf")
     (140 . "#5f7f5f")
     (160 . "#7f9f7f")
     (180 . "#8fb28f")
     (200 . "#9fc59f")
     (220 . "#afd8af")
     (240 . "#bfebbf")
     (260 . "#93e0e3")
     (280 . "#6ca0a3")
     (300 . "#7cb8bb")
     (320 . "#8cd0d3")
     (340 . "#94bff3")
     (360 . "#dc8cc3"))))
 '(vc-annotate-very-old-color "#dc8cc3"))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "black" :foreground "white" :inverse-video t)))))
