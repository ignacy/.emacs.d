(dolist (i '("xml" "xsd" "rng" "xsl" "xslt" "svg" "rss" "html" "php"))
  (add-to-list 'auto-mode-alist (cons (concat "\\." i "\\'") 'nxml-mode)))

(setq magic-mode-alist (cons '("<\\?xml " . nxml-mode) magic-mode-alist))
(fset 'html-mode 'nxml-mode)
(fset 'xml-mode 'nxml-mode)
(setq nxml-slash-auto-complete-flag t)

(provide 'init-web-development)
