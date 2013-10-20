(require 'projectile)

(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'fiplr)
(setq fiplr-ignored-globs '((directories (".git" ".svn" "log" "tmp"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))

(defadvice find-tag-at-point (before auto-visti-tags)
  "Load default TAGS file from home directory if needed"
  (visit-tags-table (concat (projectile-project-root) "TAGS")))
(ad-activate 'find-tag-at-point)

(eval-after-load "grep"
  '(progn
     (add-to-list 'grep-find-ignored-directories ".bundle")
     (add-to-list 'grep-find-ignored-directories "tmp")
     (add-to-list 'grep-find-ignored-directories "coverage")
     (add-to-list 'grep-find-ignored-directories "log")))

(provide 'init-projectile)
