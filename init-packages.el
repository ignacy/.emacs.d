(require 'package)
;;(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))

;;(add-to-list 'package-archives
;; '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(autopair markdown-mode yaml-mode haml-mode magit gist textmate
                               exec-path-from-shell ido-ubiquitous rspec-mode
                               autopair haskell-mode rainbow-mode coffee-mode js2-mode
                               wgrep expand-region slime clojure-mode multiple-cursors
                               s projectile ruby-mode inf-ruby ruby-compilation deft
                               web-mode paredit mustache-mode color-theme-sanityinc-tomorrow
                               gist find-file-in-project flymake-ruby yasnippet
                               rvm jump color-theme rainbow-delimiters ruby-end
                               idle-highlight-mode feature-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'init-packages)
