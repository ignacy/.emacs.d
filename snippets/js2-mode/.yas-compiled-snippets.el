;;; Compiled snippets and support files for `js2-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
                     '(("cl"
                        (progn console\.log
                               ($1)
                               $0)
                        "cl" nil nil nil nil nil nil)
                       ("dbg" "console.log(\"$1 :\", $1);" "dbg" nil nil nil nil "direct-keybinding" nil)
                       ("dbg" "console.log(\"$1 is currently: \", $1);\n" "log" nil nil nil nil nil nil)
                       ("prop" "\n$1: function($2) {\n  $0\n}\n" "prop-func" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Tue Mar 17 10:59:37 2015
