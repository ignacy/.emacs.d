;;(force-mode-line-update)
;;(set-face-background 'mode-line "grey99")
;;(set-face-foreground 'mode-line "#dedede")
;;(set-face-background 'mode-line-inactive "grey90")
;;(set-face-foreground 'mode-line-inactive "#dbdbdb")
;; (set-face-background 'mode-line-inactive "black")
;;(set-face-foreground 'mode-line-inactive "#eee")
;;(custom-set-faces '(mode-line ((t (:box nil)))))
;;(custom-set-faces '(mode-line ((t (:box (:line-width 1 :color "DarkBlue" :style released-button))))))
(custom-set-faces '(mode-line ((t (:box nil) (:background "grey3")))))
(custom-set-faces '(mode-line-inactive ((t (:box nil) (:background "grey6")))))
(set-face-foreground 'mode-line "grey7")
(set-face-foreground 'mode-line-inactive "grey10")



(defface sm-default-face
  '((t :inherit default :foreground "#FF1F68"))
  "Smart modeline " :group 'smart-modeline-faces)

(defface sm-project-face
  '((t :inherit default :foreground "lightblue"))
  "Smart modeline " :group 'smart-modeline-faces)

(defface sm-branch-face
  '((t :inherit default :foreground "green"))
  "Smart modeline " :group 'smart-modeline-faces)

(defface sm-file-face
  '((t :inherit default :foreground "#FF1F69"))
  "Smart modeline " :group 'smart-modeline-faces)

(defun git-repo-name ()
  "Get the nane of the closest .git directory or ...?"
  (locate-dominating-file default-directory ".git"))

(defun sm-clean-directory-name ()
  (car (last (butlast (split-string (git-repo-name) "/")))))

(setq-default mode-line-format
              (list
               ;;'(:eval (propertize mode-line-misc-info 'face 'sm-branch-face))

               '(:eval (if (buffer-modified-p)
                           (propertize "*" 'face 'sm-default-face
                                       'help-echo "Buffer has been modified")
                         " "))

               '(:eval (propertize "%b " 'face 'sm-file-face
                                   'help-echo (buffer-file-name)))

               (propertize "  %03l," 'face 'sm-project-face)
               '(:eval (propertize "%02c" 'face 'sm-project-face))


               " "
               '(:eval (when (vc-mode)
                         (propertize (concat (substring vc-mode 5) " @") 'face 'sm-branch-face)))

               " "
               '(:eval (when (vc-mode)
                         (propertize (sm-clean-directory-name)
                                     'face 'sm-project-face)))


               ))

(provide 'smart-modeline)
