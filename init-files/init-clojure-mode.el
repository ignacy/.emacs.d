(autoload 'clojure-mode "clojure-mode" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(autoload 'midje-mode "midje-mode" t)
(add-hook 'clojure-mode-hook 'midje-mode)

(after 'gist-autoloads
  (add-to-list 'gist-supported-modes-alist '(clojure-mode . ".clj")))

(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'nrepl-mode-hook 'subword-mode)

(setq inferior-lisp-program "lein repl")

(add-hook 'sldb-mode-hook
          #'(lambda ()
              (setq autopair-dont-activate )))

(add-hook 'slime-repl-mode-hook
          #'(lambda ()
              (setq autopair-dont-activate t)))

;; (eval-after-load 'clojure-mode
;;   (font-lock-add-keywords
;;    'clojure-mode `(("\\(defn *\\)"
;;                 (0 (progn (compose-region (match-beginning 1)
;;                                           (match-end 1) "\u0192   ")
;;                           nil))))))


(provide 'init-clojure-mode)
