(define-abbrev-table 'global-abbrev-table '(
    ("8luv" "♥")
    ("8smly" "☺")

    ;; emacs regex
    ("8num" "\\([0-9]+?\\)")
    ("8str" "\\([^\"]+?\\)\"")
    ("8curly" "“\\([^”]+?\\)”")

    ("enviroment" "environment")
    ("docment" "document")
    ("Docment" "Document")
    ("documment" "document")
    ))

;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)
