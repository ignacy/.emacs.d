(defun idle-coding-hook ()
  (idle-highlight-mode t))

(defun set-javascript()
  (setq autopair-mode nil))

(add-hook 'emacs-lisp-mode-hook 'idle-coding-hook)
(add-hook 'clojure-mode-hook 'idle-coding-hook)
(add-hook 'ruby-mode-hook 'idle-coding-hook)
(add-hook 'js2-mode-hook 'idle-coding-hook)
(add-hook 'js2-mode-hook 'set-javascript)
(add-hook 'matlab-mode-hook 'idle-coding-hook)
(add-hook 'rhtml-mode-hook 'idle-coding-hook)
(add-hook 'java-mode-hook 'idle-coding-hook)

(provide 'init-idle-highlight)
