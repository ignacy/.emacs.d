(deftheme hickey2
  "Created 2016-06-20.")

(custom-theme-set-faces
 'hickey2
 '(cursor ((t (:background "#999999"))))
 '(mode-line-inactive ((t (:box nil :foreground "#666666" :background "#333333"))))
 '(mode-line ((t (:box nil :foreground "#1D2021" :background "#A7DBD8"))))
 '(fringe ((t (:background "#1D2021"))))
 '(region ((t (:background "#161A1F" :foreground "DodgerBlue2"))))
 '(minibuffer-prompt ((default (:foreground "#A7DBD8"))))
 '(font-lock-builtin-face ((t (:foreground "#F38630"))))
 '(font-lock-constant-face ((t (:foreground "#AEE239"))))
 '(font-lock-comment-face ((t (:foreground "#505C63"))))
 '(font-lock-function-name-face ((t (:foreground "#AEE239"))))
 '(font-lock-keyword-face ((t (:foreground "#A7DBD8"))))
 '(font-lock-string-face ((t (:foreground "#F8F8F0"))))
 '(font-lock-variable-name-face ((t (:foreground "#FD971F"))))
 '(font-lock-type-face ((t (:foreground "#999999"))))
 '(font-lock-warning-face ((t (:foreground "#999999" :bold t))))
 '(default ((t (:background "#1D2021" :foreground "#F8F8F2")))))

(provide-theme 'hickey2)
