(require 'scala-mode2)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(add-to-list 'load-path "~/.emacs.d/ensime/elisp/")


(require 'flymake)
(add-hook 'java-mode-hook 'flymake-mode-on)
(add-hook 'scala-mode2-hook 'flymake-mode-on)

(add-hook 'scala-mode-hook
          (lambda ()
            (setq imenu-generic-expression
                  '(
                    ("var" "\\(var +\\)\\([^(): ]+\\)" 2)
                    ("val" "\\(val +\\)\\([^(): ]+\\)" 2)
                    ("override def" "^[ \\t]*\\(override\\) +\\(def +\\)\\([^(): ]+\\)" 3)
                    ("implicit def" "^[ \\t]*\\(implicit\\) +\\(def +\\)\\([^(): ]+\\)" 3)
                    ("def" "^[ \\t]*\\(def +\\)\\([^(): ]+\\)" 2)
                    ("trait" "\\(trait +\\)\\([^(): ]+\\)" 2)
                    ("class" "^[ \\t]*\\(class +\\)\\([^(): ]+\\)" 2)
                    ("case class" "^[ \\t]*\\(case class +\\)\\([^(): ]+\\)" 2)
                    ("object" "\\(object +\\)\\([^(): ]+\\)" 2)
                    ))))

(provide 'init-scala)
