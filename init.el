(package-initialize)

(load-library "url-handlers")
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(require 'use-package)

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
