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
 '(custom-safe-themes
   (quote
    ("56cb99174fad69feba8edd6663c592e77d77332fb4c4bb5be058ef459a426463" "a18ba4e20cf28d6e8032936766bb711a2adc76ec27c2246a238bd09a0dc67112" "0f6f3782d884f1b520a28a6b7cdd0198ddbff0ed6fe32ab3f6477bfec2ac2269" "09233dff5af535c4ba3ccabc4c9267bb7bf1131cccbfab5db65e96103c7aa023" "6920c114c80cd0919a76d1a882529c638e661500ae11adf684d118366af26963" "f5bd8485ec9ba65551bf9b9fcaa6af6bcbaebaa4591c0f30d3e512b1d77b3481" "ab3e4108e9b6d9b548cffe3c848997570204625adacef60cbd50a39306866db1" "24e512295051999848d40911d4dff95494f05942710d468a1ed11d9f59b20fb1" "a233249cc6f90098e13e555f5f5bf6f8461563a8043c7502fb0474be02affeea" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "953f02a3fcf3f79e6f666798b6fdad91d9785e50fe8050edb71925a3ad86fbef" "c7cd81771525ff66c105413134cdf0330b0b5b88fd8096e5d56b0256872ba6c7" "f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" "b9ad132eb093b4259b2f97e3f12b6a279e6fd392171dde650646fbd11c19544d" "9c1cc747b9c1b0a1e6dfc7e30787eb24bdbebc4e0fe0850b8539de0703dd3954" "c739f435660ca9d9e77312cbb878d5d7fd31e386a7758c982fa54a49ffd47f6e" "e6d83e70d2955e374e821e6785cd661ec363091edf56a463d0018dc49fbc92dd" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "e292ec749f785d348969926448e25790356a7ce1a8fda6e695f5e8b70bed786b" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "46223bc978f9e7ab7f5b61d171da7ce98e69661158b75ed011603d3134fbad02" "1011be33e9843afd22d8d26b031fbbb59036b1ce537d0b250347c19e1bd959d0" "013e87003e1e965d8ad78ee5b8927e743f940c7679959149bbee9a15bd286689" "941bc214a26ed295e68bbeaadcd279475a3d6df06ae36b0b2872319d58b855f7" "7b0433e99dad500efbdf57cf74553499cde4faf2908a2852850c04b216c41cc9" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "a8be70fe51a47280ddf068a8193c630e2c71b820a247dcdb188d45d0714e3b95" "7dd515d883520286fc8936ce32381fb01b978d0d7cfb6fe56f7f55d8accbf63a" "442c946bc5c40902e11b0a56bd12edc4d00d7e1c982233545979968e02deb2bc" "573e46dadf8c2623256a164831cfe9e42d5c700baed1f8ecd1de0675072e23c2" "5ea20171762b3f9682fbf507ee4b4018ce7b6cc65415fa99799a125f112b2cdb" "01069a67135cd3ae7652aef5faafd11ea6bfa0b7af3911c16f11e4e2dd0321d8" "ff7aa2066d276f9bd2dc891886e3163b0b6690a5b5340fd2705120023f4f7415" "3bcffb95c7ac651757a9032753ac9fa9a80416cc712001648ec1d84f80bbe072" "71b64c9f8331d7ea1429ec23c0c067bf014d78951dcfe79d1e123a78eb2ff61d" "1c6c7d5e4beaec0a54d814454106d180de7b90f8961d3edd2f6567f7c08da97e" "85960419f214c6aa495861f5135bfbb076095edef64547bdd3cedb09803f07ce" "c793221e18b9e52ffa82cf09ee6398322293e486a80ac7ea6458e4f0da04ac0c" "2b5aa66b7d5be41b18cc67f3286ae664134b95ccc4a86c9339c886dfd736132d" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "9eb5269753c507a2b48d74228b32dcfbb3d1dbfd30c66c0efed8218d28b8f0dc" "353861e69d6510a824905208f7290f90248f0b9354ee034fd4562b962790bdfc" "298f3826066ad761b9f461eec62b578c9725fd6134fdcab75fef579032f03d34" "5799bedffd42f282db713e8a3138a0085f20b82073fb2e2a404340086b96a07b" "12c168f7ff396c457e559cde27a9eca019e6423bea3dea57a59e3397366a1272" "08f7bee7671cb55e0c3772c8a42a03e2f4e0a7ed4cadd53444308fe1f92d5049" "5b8e23721744122c8852bc2ea3fa971b2224289c1ddbcdaa95273df2bca86ff7" "f0c681516141144b23c09a54edae3c3027e97b2ce41050f8effe5db409f51f6c" "22ee8a5d6de86d5181f40e411c354ddde1f84ff246ad8a3cc8fa050282738d80" "25f330cb050c7e7ec402af1b60243e8185a7837b455af0fa026593d4f48a78b2" "1ba463f6ac329a56b38ae6ac8ca67c8684c060e9a6ba05584c90c4bffc8046c3" "8737f66a76a88b71b8b774eb1f5310a8bb5c26b56b3ae0de698b1a8aab2b4058" "60f84026471bc44896ab79f0f0bb1e01d7a0eb8eecf53d90ea3e8016d020ad08" "2a4633af12fab5d00e2098d25cca0986752e21ff6211828a4aaf34e2428dfe79" "caaef884831c7dd6822d2686868e36f33621ef694d7e22c59d4d56136b4a714e" "02634c2cee978336204be4124bcc1801b6e620292ec6eca879329efe54531fcc" "3c9d994e18db86ae397d077b6324bfdc445ecc7dc81bb9d528cd9bba08c1dac1" "4a60f0178f5cfd5eafe73e0fc2699a03da90ddb79ac6dbc73042a591ae216f03" "c08c5e81432b54fcbc0a1f7f714687f02894e0a8d45e4a8298abb9eedd7f7a05" default)))
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#383838")
 '(flycheck-display-errors-delay 0.5)
 '(fringe-mode 5 nil (fringe))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(linum-format " %7i ")
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(rspec-use-bundler-when-possible t)
 '(rspec-use-spring-when-possible nil)
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(split-height-threshold 0)
 '(split-width-threshold 9999)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-dim-other-buffers-face ((t (:background "gray8")))))
