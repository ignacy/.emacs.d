(ignore-errors
;;  (load-file (concat imoryc-dir "/themes/purple-haze-theme.el"))
  (load-theme 'tango-2 t))
;;  (load-theme 'ir-black t))

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(custom-set-faces
 '(completions-common-part ((t (:inherit default :foreground "red"))))
 '(diredp-compressed-file-suffix ((t (:foreground "#7b68ee"))))
 '(diredp-ignored-file-name ((t (:foreground "#aaaaaa"))))

 '(rainbow-delimiters-depth-1-face ((t (:foreground "green3"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "aquamarine3"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "DeepSkyBlue2"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "SlateBlue4"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "peru"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "dark green"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "DeepSkyBlue3"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "lawn green"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#8b7500"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "red"))))

 '(show-paren-match ((((class color) (background light)) (:background "azure2")))))


;; Diff/git addons
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

;;(set-face-attribute 'default nil :font "Monaco-14")

(require 'custom-modeline)
(provide 'im-set-colors)
