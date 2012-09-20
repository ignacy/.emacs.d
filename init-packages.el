(require 'package)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(autopair markdown-mode yaml-mode haml-mode magit gist textmate
                               autopair haskell-mode rainbow-mode coffee-mode js2-mode
                               color-theme-sanityinc-solarized elnode zencoding-mode
                               expand-region
                               rinari ruby-mode inf-ruby ruby-compilation rinari deft
                               gist find-file-in-project android-mode flymake-ruby yasnippet
                               rvm jump color-theme rainbow-delimiters ruby-end
                               idle-highlight-mode feature-mode marmalade))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'init-packages)

