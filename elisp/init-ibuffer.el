(require 'ibuffer)
(require 'ibuffer-vc)

(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

;;( (setq ibuffer-saved-filter-groups
;;       (quote (("default"

;;                ("ICLS"
;;                 (filename . "couponing/"))
;;                ("Event Processor"
;;                 (filename . "event_processor/"))
;;                ("Programming" ;; prog stuff not already in MyProjectX
;;                 (or
;;                  (mode . clojrue-mode)
;;                  (mode . ruby-mode)
;;                  (mode . java-mode)
;;                  (mode . emacs-lisp-mode)
;;                  ;; etc
;;                  ))
;;                ("Org" ;; all org-related buffers
;;                 (mode . org-mode))))))


(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-ibuffer)
