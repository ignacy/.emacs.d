(defface sm-default-face
  '((t :inherit default :foreground "#FF1F69"))
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

(defun git-repo-name (dir)
  (if (string= "/" dir)
      "-"
    (if (file-exists-p (expand-file-name ".git/" dir))
        dir
      (git-repo-name (expand-file-name "../" dir)))))

(defun sm-clean-directory-name ()
  (car (last (butlast (split-string (git-repo-name default-directory) "/")))))


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

;;(force-mode-line-update)
(set-face-background 'mode-line "grey22")
;;(set-face-foreground 'mode-line "#444")
(set-face-background 'mode-line-inactive "#111")
;; (set-face-background 'mode-line-inactive "black")
;;(set-face-foreground 'mode-line-inactive "#eee")
;;(custom-set-faces '(mode-line ((t (:box nil)))))
;;(custom-set-faces '(mode-line ((t (:box (:line-width 1 :color "DarkBlue" :style released-button))))))
;;(custom-set-faces '(mode-line ((t (:box nil) (:background "#fff")))))

(provide 'smart-modeline)
