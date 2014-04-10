
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

(display-time-mode 1)
(defface egoge-display-time
  '((((type x w32 mac))
     ;; #060525 is the background colour of my default face.
     (:foreground "#060525" :inherit bold))
    (((type tty))
     (:foreground "blue")))
  "Face used to display the time in the mode line.")

(setq display-time-string-forms
      '((propertize (concat " " 24-hours ":" minutes " ")
                    'face 'egoge-display-time)))

(which-function-mode t)
;; (setq-default header-line-format
;;               '((which-func-mode ("" which-func-format " "))))
;; (setq mode-line-misc-info
;;             ;; We remove Which Function Mode from the mode line, because it's mostly
;;             ;; invisible here anyway.
;;             (assq-delete-all 'which-func-mode mode-line-misc-info))


(setq-default mode-line-format
              (list
               '(:eval mode-line-misc-info)

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

;;(set-face-background 'mode-line "black")
;; (set-face-foreground 'mode-line "white")
;; (set-face-background 'mode-line-inactive "black")
;; (set-face-foreground 'mode-line-inactive "#eee")
(custom-set-faces '(mode-line ((t (:box nil)))))
(custom-set-faces '(mode-line-inactive ((t (:box nil)))))

(provide 'smart-modeline)
