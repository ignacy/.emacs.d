(require 'svg-mode-line-themes)
(smt/enable)
(smt/set-theme 'black-crystal)
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)


(let (( theme-archetype (cdr (assoc 'archetype smt/themes)))
      ( row-archetype (cdr (assoc 'archetype smt/rows))))
  (setf (getf theme-archetype :style)
        (list :font-family "DejaVu Sans Mono"
              :font-size "10pt"))
  (setf (getf row-archetype :baseline) 12))

(provide 'init-svg-modeline)
