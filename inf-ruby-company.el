;; Installation:
;; Add the following to your emacs setup:
;; (add-to-list 'load-path "<directory-of-this-file>")
;; (add-hook 'inf-ruby-mode-hook (lambda () (require 'inf-ruby-company)))

(require 'company)

(defun inf-ruby-company-backend (command &optional arg &rest ignored)
  (case command
    ('prefix
     (and (eq major-mode 'inf-ruby-mode)
          inf-ruby-at-top-level-prompt-p
          (ruby-grab-expression)))
    ('candidates
     (inf-ruby-completions arg))))

(defun ruby-grab-expression ()
  ;; Only proceed if the point is at the end of the line
  ;; or not inside a symbol
  (if (looking-at "\\W\\|$")
      (save-excursion
        (let ((start (point))
              (bol (point-at-bol)))
          ;; Jump back to whitespace|open/close delimiter|string quote|=
          (if (re-search-backward "\\s-\\|\\s)\\|\\s(\\|\\s\"\\|=" bol t)
              ;; whitespace|open delimiter|=
              (if (looking-at "\\s-\\|\\s(\\|=")
                  (forward-char)
                (forward-char)
                (backward-sexp))
            (beginning-of-line))
          (and (not (= start (point))) (>= (point) bol)
               (buffer-substring (point) start))))))

(add-to-list 'company-backends 'inf-ruby-company-backend)

(provide 'inf-ruby-company)
