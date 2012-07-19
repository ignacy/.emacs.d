;; My minimalistic modeline settings

(setq-default mode-line-format
              (list
               "       "
               ;; was this buffer modified since the last save?
               '(:eval (when (buffer-modified-p)
                         (propertize "*" 'face 'font-lock-warning-face
                                     'help-echo "Buffer has been modified")))

               ;;the buffer name; the file name as a tool tip
               '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                                   'help-echo (buffer-file-name)))
               ;; relative position, size of file
               '(:eval (when (vc-mode)
                         (propertize (substring vc-mode 5)
                                     'face 'font-lock-constant-face)))
               "  line#"
               (propertize " %02l" 'face 'font-lock-type-face)
               " column#"
               (propertize " %02c" 'face 'font-lock-type-face)
               minor-mode-alist  ;; list of minor modes
               ))

;; (set-face-background 'modeline "#123")
;; (set-face-foreground 'modeline "#fff")


;;  (set-face-background 'modeline "#4477aa")
;; ;; (set-face-background 'modeline-inactive "SkyBlue4")
;; (set-face-background 'fringe "DodgerBlue4")
;; (set-face-background 'modeline "DodgerBlue4")
;; (custom-set-faces
;;  '(mode-line ((t (:box (:line-width 2 :color "DodgerBlue4"))))))
