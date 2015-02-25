(use-package haml-mode
  :ensure haml-mode
  :defer t
  :config (progn
            (add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))))



(use-package markdown-mode
  :ensure markdown-mode
  :defer t
  :config (add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode)))

;; (defun customizations-for-coffee-mode ()
;;   (interactive)
;;   (flyspell-prog-mode)
;;   (auto-complete-mode)
;;   (setq tab-width 2)
;;   (setq highlight-indentation-offset 2)
;;   (highlight-indentation-mode)
;;   (highlight-indentation-current-column-mode))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))

(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . html-mode))3

(use-package yaml-mode
  :ensure yaml-mode
  :defer t
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
          (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))))

(provide 'init-markup-and-style-modes)
