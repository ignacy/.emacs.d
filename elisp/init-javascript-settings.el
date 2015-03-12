(use-package js2-mode
  :ensure js2-mode)

(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


(font-lock-add-keywords
 'js2-mode `(("\\<\\(function\\) *("
              (0 (progn (compose-region (match-beginning 1)
                                        (match-end 1) "\u0192") nil)))))


;; Javascript
(setq-default js2-basic-offset 4)
;; JSON
(setq-default js-indent-level 4)

(setq-default js2-mode-indent-ignore-first-tab t)
(setq-default js2-show-parse-errors nil)
(setq-default js2-strict-inconsistent-return-warning nil)
(setq-default js2-strict-var-hides-function-arg-warning nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning nil)
(setq-default js2-strict-cond-assign-warning nil)
(setq-default js2-strict-var-redeclaration-warning nil)
(setq-default js2-global-externs
              '("module" "require" "__dirname" "process" "console" "define"
                "JSON" "$" "_" "Backbone" "buster" "sinon" "moment" "_gaq"
                "Zenbox" "Mousetrap" "Comoyo"))

(eval-after-load "js2-mode"
  '(define-key js2-mode-map (kbd "M-j") nil))

;; (add-hook 'js-mode-hook 'js2-minor-mode)
(setq js2-highlight-level 3)
(provide 'init-javascript-settings)
