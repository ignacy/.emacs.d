(require 'package)

;;(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))

;;(add-to-list 'package-archives
;; '("marmalade" . "http://marmalade-repo.org/packages/") t)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(markdown-mode yaml-mode haml-mode gist textmate scala-mode
                      exec-path-from-shell ido-ubiquitous rspec-mode smex quickrun
                      git-gutter
                      tango-2-theme haskell-mode rainbow-mode coffee-mode js2-mode
                      expand-region clojure-mode multiple-cursors magit flymake-ruby
                      mark-multiple s projectile ruby-mode inf-ruby ruby-compilation deft
                      paredit color-theme-sanityinc-tomorrow midje-mode js2-refactor
                      gist yasnippet jump color-theme rainbow-delimiters ruby-end
                      idle-highlight-mode feature-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'my-packages)
