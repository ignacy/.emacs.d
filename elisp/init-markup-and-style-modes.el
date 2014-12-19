(use-package haml-mode)
(use-package markdown-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun customizations-for-coffee-mode ()
  (interactive)
  (flyspell-prog-mode)
  (auto-complete-mode)
  (setq tab-width 2)
  (setq highlight-indentation-offset 2)
  (highlight-indentation-mode)
  (highlight-indentation-current-column-mode))

(add-hook 'coffee-mode-hook 'customizations-for-coffee-mode)

(add-to-list 'load-path (concat dotfiles-dir "/coffee-mode"))
(use-package coffee-mode)

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . html-mode))

(use-package yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(provide 'init-markup-and-style-modes)
