(autoload 'clojure-mode "clojure-mode" t)

;;(add-to-list 'gist-supported-modes-alist '(clojure-mode . ".clj"))

(add-hook 'nrepl-mode-hook 'subword-mode)

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(setq auto-mode-alist (cons '("\\.cljs$" . clojure-mode) auto-mode-alist))
(setq inferior-lisp-program "lein repl")

;; align-cljlet
(use-package align-cljlet
  :init (global-set-key (kbd "C-c C-a") 'align-cljlet))


(use-package company-etags
  :init (add-to-list 'company-etags-modes 'clojure-mode))

(add-hook 'sldb-mode-hook
          #'(lambda ()
              (setq autopair-dont-activate )))

(add-hook 'slime-repl-mode-hook
          #'(lambda ()
              (setq autopair-dont-activate t)))

(add-hook 'clojure-mode-hook
          '(lambda ()
             (define-key clojure-mode-map
               "\C-c\C-k"
               '(lambda ()
                  (interactive)
                  (let ((current-point (point)))
                    (goto-char (point-min))
                    (let ((ns-idx (re-search-forward clojure-namespace-name-regex nil t)))
                      (when ns-idx
                        (goto-char ns-idx)
                        (let ((sym (symbol-at-point)))
                          (message (format "Loading %s ..." sym))
                          (lisp-eval-string (format "(require '%s :reload)" sym))
                          (lisp-eval-string (format "(in-ns '%s)" sym)))))
                    (goto-char current-point))))))

(add-hook 'inferior-lisp-mode-hook
          '(lambda ()
             (define-key inferior-lisp-mode-map
               "\C-cl"
               '(lambda ()
                  (interactive)
                  (erase-buffer)
                  (lisp-eval-string "")))))

;; (eval-after-load 'clojure-mode
;;   (font-lock-add-keywords
;;    'clojure-mode `(("\\(defn *\\)"
;;                 (0 (progn (compose-region (match-beginning 1)
;;                                           (match-end 1) "\u0192   ")
;;                           nil))))))


(provide 'init-clojure-mode)
