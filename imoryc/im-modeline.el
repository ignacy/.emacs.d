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
               " "

               "col:"
               (propertize "%02c " 'face 'font-lock-type-face)

               " time: "
               ;; add the time, with the date and the emacs uptime in the tooltip
               '(:eval (propertize (format-time-string "%H:%M") 'face 'font-lock-constant-face))

               ;; minor-mode-alist  ;; list of minor modes
               ))

(set-face-background 'modeline "#222")
(set-face-foreground 'modeline "#777")
