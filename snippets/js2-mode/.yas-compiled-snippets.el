;;; Compiled snippets and support files for `js2-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
                     '(("dbg" "console.log(\"$1 is currently: \", $1);\n" "log" nil nil nil nil nil nil)
                       ("prop" "\n$1: function($2) {\n  $0\n}\n" "prop-func" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Fri Jan 11 22:10:20 2013