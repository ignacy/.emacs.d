;; different stuff

(defun append-to-buffer (buffer start end)
  (interactive
   (list
    (read-buffer "Apend to buffer " (other-buffer (current-buffer) t))
    (region-beginning) (region-end)))
  (let ((oldbuf (current-buffer)))
    (save-excursion
      (let* ((append-to)))

      )
    )
