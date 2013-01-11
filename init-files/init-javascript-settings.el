(autoload 'espresso-mode "espresso")

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (espresso--proper-indentation parse-status))
           node)

      (save-excursion

        ;; I like to indent case and labels to half of the tab width
        (back-to-indentation)
        (if (looking-at "case\\s-")
            (setq indentation (+ indentation (/ espresso-indent-level 2))))

        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 2 indentation))))

      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

(require 'mustache-mode)


(defun my-js2-mode-hook ()
  (interactive)
  (require 'espresso)
  (setq espresso-indent-level 2
        indent-tabs-mode nil
        c-basic-offset 2)
  (c-toggle-auto-state 0)
  (c-toggle-hungry-state 1)
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function))

(eval-after-load 'js2-mode
  '(progn   (define-key js2-mode-map "{" 'paredit-open-curly)
            (define-key js2-mode-map "}" 'paredit-close-curly-and-newline)
            (add-hook 'js2-mode-hook 'esk-paredit-nonlisp)
            (add-hook 'js2-mode-hook 'my-js2-mode-hook)
            ;; fixes problem with pretty function font-lock
            (define-key js2-mode-map (kbd ",") 'self-insert-command)
            (font-lock-add-keywords
             'js2-mode `(("\\(function *\\)("
                          (0 (progn (compose-region (match-beginning 1)
                                                    (match-end 1) "\u0192")
                                    nil)))))))

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(provide 'init-javascript-settings)
