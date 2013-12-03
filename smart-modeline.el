
(defface sm-column-overflow-face
  '((t :inherit mode-line :foreground "red"))
  "Smart modeline " :group 'smart-modeline-faces)


(defface sm-project-name-face
  '((t :inherit font-lock-function-name-face))
  "Smart modeline " :group 'smart-modeline-faces)

(defface sm-branch-face
  '((t :inherit font-lock-string-face))
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
               (propertize "> " 'face 'sm-branch-face)

               '(:eval (if (buffer-modified-p)
                           (propertize "*" 'face 'font-lock-warning-face
                                       'help-echo "Buffer has been modified")
                         " "))

               '(:eval (propertize "%b " 'face 'font-lock-variable-name-face
                                   'help-echo (buffer-file-name)))

               (propertize "  %03l," 'face 'sm-branch-face)

               '(:eval (propertize "%02c" 'face
                                   (if (>= (current-column) 80)
                                       'sm-column-overflow-face
                                     'sm-branch-face)))
               " "
               '(:eval (when (vc-mode)
                         (propertize (sm-clean-directory-name)
                                     'face 'sm-project-name-face)))

               " "
               '(:eval (when (vc-mode)
                         (propertize (concat "(" (substring vc-mode 5) ")")
                                     'face 'sm-branch-face)))
               ;; " "
               ;; '(:eval (propertize persp-modestring 'face 'sm-project-name-face))

               ))

;;(force-mode-line-update)



(set-face-background 'mode-line "black")
;; (set-face-foreground 'mode-line "white")
;; (set-face-background 'mode-line-inactive "black")
;; (set-face-foreground 'mode-line-inactive "#eee")
(custom-set-faces '(mode-line ((t (:box nil)))))
(custom-set-faces '(mode-line-inactive ((t (:box nil)))))

(provide 'smart-modeline)
