(use-package projectile
  :init (progn
          (projectile-global-mode)
          (setq projectile-enable-caching t)
          (defadvice find-tag-at-point (before auto-visti-tags)
            "Load default TAGS file from home directory if needed"
            (visit-tags-table (concat (projectile-project-root) "TAGS")))
          (ad-activate 'find-tag-at-point)))

;; (use-package fiplr
;;   :init (setq fiplr-ignored-globs '((directories (".git" ".svn" "log" "tmp"))
;;                                     (files ("*.jpg" "*.png" "*.zip" "*~")))))

(eval-after-load "grep"
  '(progn
     (add-to-list 'grep-find-ignored-directories ".bundle")
     (add-to-list 'grep-find-ignored-directories "tmp")
     (add-to-list 'grep-find-ignored-directories "coverage")
     (add-to-list 'grep-find-ignored-directories "log")))

(provide 'init-projectile)
