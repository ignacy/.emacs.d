
(defface sm-column-overflow-face
  '((t :inherit mode-line :foreground "red"))
  "SmartModelineFaces" :group 'smart-modeline-faces)

(setq-default mode-line-format
              (list
               "> "
               ;; was this buffer modified since the last save?
               '(:eval (if (buffer-modified-p)
                           (propertize "*" 'face 'font-lock-warning-face
                                       'help-echo "Buffer has been modified")
                         " "))

               ;;the buffer name; the file name as a tool tip
               '(:eval (propertize "%b " 'face 'font-lock-variable-name-face
                                   'help-echo (buffer-file-name)))

               " @ "
               ;; relative position, size of file
               '(:eval (when (vc-mode)
                         (propertize (substring vc-mode 5)
                                     'face 'font-lock-constant-face)))

               '(:eval (when (vc-mode)
                         (vs-state (buffer-file-name))))

               "  %03l,"
               '(:eval (propertize "%02c" 'face
                                   (if (>= (current-column) 80)
                                       'sm-column-overflow-face
                                     nil)))
               " "
               ;; "  line#"
               ;; (propertize " %02l" 'face 'font-lock-type-face)
               ;; " column#"
               ;; (propertize " %02c" 'face 'font-lock-type-face)
               ))


;;(force-mode-line-update)



(provide 'smart-modeline)
