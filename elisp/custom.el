(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(ansi-term-color-vector
   [unspecified "#081724" "#ff694d" "#68f6cb" "#fffe4e" "#bad6e2" "#afc0fd" "#d2f1ff" "#d3f9ee"] t)
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(background-color "#202020")
 '(background-mode dark)
 '(bmkp-last-as-first-bookmark-file "~/.bookmarks_emacs")
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("0251780e8e79d2a5e75eec7ee3b6c646b882495cb884d9dd32f30c60f9d65db6" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "9b5b8562882c5393daa590bef170ff0b200ce11684cb95674f3f1857456b5d05" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" "90edd91338ebfdfcd52ecd4025f1c7f731aced4c9c49ed28cfbebb3a3654840b" "629d9ba6189ae9b42bb8d49ee57d23e6ea7cc697f1593c17ecf78bba38a65459" "70f5a47eb08fe7a4ccb88e2550d377ce085fedce81cf30c56e3077f95a2909f2" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "6920c114c80cd0919a76d1a882529c638e661500ae11adf684d118366af26963" "790ea1cf4cb52a0da6ceec10f798c1a5f06241addc7c71f278cedd4ad4cc0dee" "95f954ce018bbff3107b357bd87d060db195a2d5c6b70411587223597fde171d" "08851585c86abcf44bb1232bced2ae13bc9f6323aeda71adfa3791d6e7fea2b6" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "3fd36152f5be7e701856c3d817356f78a4b1f4aefbbe8bbdd1ecbfa557b50006" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "ea489f6710a3da0738e7dbdfc124df06a4e3ae82f191ce66c2af3e0a15e99b90" "6cb86285d0cee020bcb0e9d0ffa56bad4c5be86d2bd14f2f4997a46130a6fe56" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "01069a67135cd3ae7652aef5faafd11ea6bfa0b7af3911c16f11e4e2dd0321d8" "1c38f876d5f81b9a2527fa9d8195d1cb222324947e587685fd67cb0ffaf37639" "8737f66a76a88b71b8b774eb1f5310a8bb5c26b56b3ae0de698b1a8aab2b4058" "42c2b04d800fcc1c5716509574780bf111028d1e6c91ee86464c6cffa9dbacb6" "063cac08ff27945f421b14ebcfecd5a03092b20887a055669bf6757b6bc34077" "50ce32e372a728c373a275ae64ddd323f9ffb97e37f2ff70666fb0073d2d52b1" "bede70e4b2654751936d634040347bb4704fa956ecf7dceab03661a75e46a8ca" "6d866b81a4f78d5854c9d51e20b6b7c457b534d12701af13b9caff7961d47e0e" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "87ebe224d871e0af33b36bdb716d62567a503b17db54a6ea5cf30df4a61538fb" "08efabe5a8f3827508634a3ceed33fa06b9daeef9c70a24218b70494acdf7855" "733e05fdec43174c32b96cee83f434074326f7d4fdf49e857bc723f85f219077" "309280d4f2517d12997c170931deb6a93856bba37bc75354a24bf616fb971732" "3ab48085899d3bd4ddcb41686ded377bc10d5d641ccf0bb299b4fd47e2b88d6a" "57ebd24e5432292a7cd39cc768888da1a6e627835080872bd61888edf186aa2e" "1bcc25344dbd809487d47384658a66e3219edcacbe75f02c2b69808eda750e8a" "bc2bdeb097748ab996aa63f6fcfd7bbb3cd5fadd06de58418fe2874554cda654" "e0d0ffced8139d61357ea1378649e64a7ea12acbae0d3fa5086a43fdb24aafdf" "8d3069577320b1af35bd4be39c6838fea4d2ddbb67195c6f7e169c4b1cdae4d3" "b7ada9e1813e059e8c1b88785e392cd7062455db4a1d8bb6e9f2370e935ccbb0" "66a5c61c415b44703ae530921b8961823faa8682ab495c80667520d4dbdfbdf4" "85960419f214c6aa495861f5135bfbb076095edef64547bdd3cedb09803f07ce" "897bad0a5870dad294e0ae13d9cc6785f5e7db516a91835483a1eda83e3cf151" "02634c2cee978336204be4124bcc1801b6e620292ec6eca879329efe54531fcc" "fd940e2eecaf5f38e68bbb62c8423a1fa92b2e004e64021624196540c5f71319" "2333f97d9fb8bb2bb0516d58a912fa2a8c3897e8e61054eaff19286a91293029" "7566e565b3a2fe65680d3d3c0697e23ecd4b66dd1f5c60cc2e28475b983a6092" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "c0e59160f46007bd34beb9edb4274eb93b08ec159219df78a273656a3c8de33f" "a19329c8eb044f0b360bbe1f80ed320b0b79b04fd4351c58271231eec73f35c9" "4b844b30213cdb5463b54f50a2e6ad59b329b5fcc33458a545e469ae08540016" "3d7b25b9270378e32759fc2d0c5dd9c88306989887143352ea3141f8f6b1ae61" "c87cc60d01cf755375759d165c1d60d9586c6a31f0b5437a0378c2a93cfc8407" "2a4633af12fab5d00e2098d25cca0986752e21ff6211828a4aaf34e2428dfe79" "e24180589c0267df991cf54bf1a795c07d00b24169206106624bb844292807b9" "a8be70fe51a47280ddf068a8193c630e2c71b820a247dcdb188d45d0714e3b95" "0f6f3782d884f1b520a28a6b7cdd0198ddbff0ed6fe32ab3f6477bfec2ac2269" "0784ca4a498cd0f6819ba19008c74138d29fce0e7d05862d163cbf7ca77614b6" "0f6e58d1814b4138c5a88241f96547d35883cbb3df6cf9ec8ef44856ece04c13" "353861e69d6510a824905208f7290f90248f0b9354ee034fd4562b962790bdfc" "70ef61cc7736345eb1d2d449a9251e683625ba977f53a4d7cdbd4b9e81425b5e" "9eb5269753c507a2b48d74228b32dcfbb3d1dbfd30c66c0efed8218d28b8f0dc" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "789844278c5a75283b5015c1fc7bebe7e4cf97843b8f8cffe21fafa05e81e90a" "3b60e9582f0e34fa2efb6a67074264e42697a26087f16a2517f0a79a7335ab0f" "caaef884831c7dd6822d2686868e36f33621ef694d7e22c59d4d56136b4a714e" "456ac8176c7c01680384356cbdc568a7683d1bada9c83ae3d7294809ddda4014" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "8409889f57ecfde3ad50775711ed4338bb234daef38cf77278acecaca17212f9" "b88ff6188e5fe7e98dc8db32f40e05aae391a9e76adb3826e7a9f75640515181" "fbeff20de53b8af505925fee06ed2acbbbd4932e0c3f1e99089a18e01577cc53" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "5b8e23721744122c8852bc2ea3fa971b2224289c1ddbcdaa95273df2bca86ff7" "1a85b8ade3d7cf76897b338ff3b20409cb5a5fbed4e45c6f38c98eee7b025ad4" "e35ef4f72931a774769da2b0c863e11d94e60a9ad97fb9734e8b28c7ee40f49b" "a772eafba4eda0ed57a5d651a96804487a1dacbfbf8658084bfe84546a7c7008" "3164a65923ef23e0f3dff9f9607b4da1e07ef1c3888d0f6878feef6c28357732" "71b64c9f8331d7ea1429ec23c0c067bf014d78951dcfe79d1e123a78eb2ff61d" "a18ba4e20cf28d6e8032936766bb711a2adc76ec27c2246a238bd09a0dc67112" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "3bcffb95c7ac651757a9032753ac9fa9a80416cc712001648ec1d84f80bbe072" "43fa7d11f1fd4485ea4b6cb8c681e8f90d61c0698181f802570ac15d47d00400" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "6c55d5fb70499e20e645cdcf0840be1b92eea7757cba9816fc337addffd1ae02" "7ed6913f96c43796aa524e9ae506b0a3a50bfca061eed73b66766d14adfa86d1" "0f002f8b472e1a185dfee9e5e5299d3a8927b26b20340f10a8b48beb42b55102" "573e46dadf8c2623256a164831cfe9e42d5c700baed1f8ecd1de0675072e23c2" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "08f7bee7671cb55e0c3772c8a42a03e2f4e0a7ed4cadd53444308fe1f92d5049" "6209442746f8ec6c24c4e4e8a8646b6324594308568f8582907d0f8f0260c3ae" "a005ca9ce449d199eabefe6fa80d0d1762f563460cfdea9727ccfeee05665f46" "579e9950513524d8739e08eae289419cfcb64ed9b7cc910dd2e66151c77975c4" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "c739f435660ca9d9e77312cbb878d5d7fd31e386a7758c982fa54a49ffd47f6e" "fdb72d732d3511172f94599ae212397a4deaa888e74dc2220be86b659831eea4" "72407995e2f9932fda3347e44e8c3f29879c5ed88da71f06ba4887b0596959a4" "c69211d8567a0c5fa14b81c4cd08c4a458db7904c10d95f75d6ecd1b8baf19bd" "60f84026471bc44896ab79f0f0bb1e01d7a0eb8eecf53d90ea3e8016d020ad08" "4a60f0178f5cfd5eafe73e0fc2699a03da90ddb79ac6dbc73042a591ae216f03" "22ee8a5d6de86d5181f40e411c354ddde1f84ff246ad8a3cc8fa050282738d80" "56cb99174fad69feba8edd6663c592e77d77332fb4c4bb5be058ef459a426463" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "5799bedffd42f282db713e8a3138a0085f20b82073fb2e2a404340086b96a07b" "5ea20171762b3f9682fbf507ee4b4018ce7b6cc65415fa99799a125f112b2cdb" "c08c5e81432b54fcbc0a1f7f714687f02894e0a8d45e4a8298abb9eedd7f7a05" "3c9d994e18db86ae397d077b6324bfdc445ecc7dc81bb9d528cd9bba08c1dac1" "8a53b1ea9fccb70bac3ed0b68a522c171b6462bd68923be7500e83dc02570bf0" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "de66c72d07f5671ccf18901ab7873c94aa558d4231d678080ab194a2a95e6d91" "0c97dcff4ea6ac23af383e6153723a712c1de3a4b427e97d1e473504dbc2fe06" "1af9aa2eaaaf6cfa7d3b3d0c6d653a9e05b28f11681fbf4efb75812f4a2a310a" "a5beb9b1d6dc23dd8a3c204c159c9a5f1e0115ff14b5b8579d6f3ede4f3b3aee" "26247bcb0b272ec9a5667a6b854125450c88a44248123a03d9f242fd5c6ec36f" "3103287c8d39800d6b41f8664b223f8ecdd8c6cc0b073441e174b61afdb4ce02" "4530ef4d9cf54740fffb6ce25b393122158057d213a2b812f04930fcadf89d62" "d96416845141e99d05d45b5f99ecf46458bf97654be7d2e20184c5edcda1580a" "1934bf7e1713bf706a9cb36cc6a002741773aa42910ca429df194d007ee05c67" "e4bc8563d7651b2fed20402fe37b7ab7cb72869f92a3e705907aaecc706117b5" "3d003561784526d83d1dd187aecf4799c72af27046bc3aa2f6d95c64e5ee4746" "c01f093ab78aad6ae2c27abc47519709c6b3aaa2c1e35c712d4dd81ff1df7e31" "569dc84822fc0ac6025f50df56eeee0843bffdeceff2c1f1d3b87d4f7d9fa661" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(flycheck-check-syntax-automatically (quote (save mode-enabled)))
 '(flycheck-disabled-checkers (quote (ruby-rubylint ruby-lint)))
 '(flycheck-display-errors-delay 0.2)
 '(foreground-color "#cccccc")
 '(fringe-mode 5 nil (fringe))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")) t)
 '(ibuffer-deletion-face (quote error))
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(magit-item-highlight-face nil)
 '(magit-use-overlays nil)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(package-selected-packages
   (quote
    (find-file-in-project swiper swipper inf-ruby evil-tutor evil-matchit evil-nerd-commenter evil-surround evil-leader evil gist atom-dark-theme dash syntax-subword plan9-theme color-identifiers-mode alect-themes lenlen-theme tao-theme seti-theme cyberpunk-theme monokai-theme org-mode molokai-theme mustang-theme ace-window ace-jump-buffer key-chord auto-dim-other-buffers google-this apropospriate-theme color-theme-sanityinc-tomorrow ir-black-theme company-restclient restclient material-theme sublime-themes darktooth-theme afternoon-theme bliss-theme ace-jump-mode request elisp--witness--lisp unkillable-scratch ruby-hash-syntax rbenv ag yasnippet yaml-mode wrap-region wakatime-mode visual-regexp use-package term-run subatomic-theme smex smartscan smartparens sane-term rubocop rspec-mode rhtml-mode rainbow-mode rainbow-delimiters railscasts-theme projectile-rails persp-projectile noctilux-theme multiple-cursors multi-term mic-paren markdown-mode magit js2-mode hungry-delete highlight-symbol haml-mode guide-key gotham-theme golint go-eldoc font-lock+ flycheck flx-ido fancy-narrow expand-region exec-path-from-shell easy-kill company-quickhelp company-go async ample-theme ace-isearch)))
 '(pos-tip-background-color "#3a3a3a")
 '(pos-tip-foreground-color "#9E9E9E")
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(red "#ffffff")
 '(rspec-command-options "--color --order random" t)
 '(rspec-spec-command "sp")
 '(rspec-use-bundler-when-possible t t)
 '(rspec-use-spring-when-possible nil)
 '(tabbar-background-color "#353535")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:box nil) (:background "grey3"))))
 '(mode-line-inactive ((t (:box nil) (:background "grey6"))))
 '(org-level-1 ((t (:inherit nil :background "gray15" :foreground "gray95" :weight bold)))))
