(use-package projectile-rails
  :ensure projectile-rails)

(use-package projectile
  :ensure projectile
  :init (progn
          (add-hook 'projectile-mode-hook 'projectile-rails-on)
          (projectile-global-mode)
          (setq projectile-enable-caching t)
          (defadvice find-tag-at-point (before auto-visti-tags)
            "Load default TAGS file from home directory if needed"
            (visit-tags-table (concat (projectile-project-root) "TAGS")))
          (ad-activate 'find-tag-at-point)))

(use-package perspective
  :init (persp-mode)
  :ensure perspective)

(use-package persp-projectile
  :ensure persp-projectile
  :defer t
  :init (global-set-key (kbd "C-c C-p") 'projectile-persp-switch-project))

(eval-after-load "grep"
  '(progn
     (add-to-list 'grep-find-ignored-files "TAGS*")
     (add-to-list 'grep-find-ignored-directories ".bundle")
     (add-to-list 'grep-find-ignored-directories "tmp")
     (add-to-list 'grep-find-ignored-directories "coverage")
     (add-to-list 'grep-find-ignored-directories "log")))

(provide 'init-projectile)
