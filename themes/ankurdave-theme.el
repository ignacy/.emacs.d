(deftheme ankurdave
  "Created 2012-06-10.")

(custom-theme-set-variables
 'ankurdave
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"]))

(custom-theme-set-faces
 'ankurdave
 '(default ((t (:stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Menlo"))))
 '(diff-added ((t (:inherit diff-changed :foreground "#006600"))))
 '(diff-removed ((t (:inherit diff-changed :foreground "#990000"))))
 '(echo-area ((((type ns)) nil)))
 '(highlight ((t (:background "#EEEEEE"))))
 '(magit-diff-add ((t (:inherit diff-added)))))

(provide-theme 'ankurdave)
