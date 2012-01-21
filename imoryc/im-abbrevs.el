; my personal abbreviations
(define-abbrev-table 'global-abbrev-table '(
    ("8num" "\\([0-9]+?\\)" nil 0)
    ("8str" "\\([^\"]+?\\)\"" nil 0)
    ("8curly" "“\\([^”]+?\\)”" nil 0)
    ("firend" "friend" nil 0)
    ))

;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)

;; turn on abbrev mode
(abbrev-mode 1)
