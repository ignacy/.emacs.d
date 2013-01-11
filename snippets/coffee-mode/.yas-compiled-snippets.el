;;; Compiled snippets and support files for `coffee-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'coffee-mode
                     '(("fora" "for ${1:name} in ${2:array}\n  ${3:# body...}" "Array Comprehension" nil nil nil nil nil "2D4AC0B4-47AA-4E38-9A11-09A48C2A9439")
                       ("bfun" "(${1:args}) =>\n  ${2:# body...}" "Function (bound)" nil nil nil nil nil "20BDC055-ED67-4D0E-A47F-ADAA828EFF2B")
                       ("cla" "class ${1:ClassName}${2: extends ${3:Ancestor}}\n\n  ${4:constructor: (${5:args}) ->\n    ${6:# body...}}\n  $7" "Class" nil nil nil nil nil "765ACBD3-380A-4CF8-9111-345A36A0DAE7")
                       ("elif" "else if ${1:condition}\n  ${2:# body...}" "Else if" nil nil nil nil nil "EA8F5EDB-6E1E-4C36-9CA5-12B108F1A7C9")
                       ("fun" "(${1:args}) ->\n  ${2:# body...}\n\n" "Function" nil nil nil nil nil "F2E2E79A-A85D-471D-9847-72AE40205942")
                       ("ife" "if ${1:condition}\n  ${2:# body...}\nelse\n  ${3:# body...}" "If .. Else" nil nil nil nil nil "2AD19F12-E499-4715-9A47-FC8D594BC550")
                       ("if" "if ${1:condition}\n  ${2:# body...}" "If" nil nil nil nil nil "F4FDFB3A-71EF-48A4-93F4-178B949546B1")
                       ("#" "#{${1:`yas/selected-text`}}" "Interpolated Code" nil nil nil nil nil "C04ED189-6ACB-44E6-AD5B-911B760AD1CC")
                       ("foro" "for ${1:key}, ${2:value} of ${3:Object}\n  ${4:# body...}" "Object comprehension" nil nil nil nil nil "9D126CC5-EA14-4A40-B6D3-6A5FC1AC1420")
                       ("README" "" "README" nil nil nil nil nil nil)
                       ("forrex" "for ${1:name} in [${2:start}...${3:finish}]${4: by ${5:step}}\n  ${6:# body...}" "Range comprehension (exclusive)" nil nil nil nil nil "FA6AB9BF-3444-4A8C-B010-C95C2CF5BAB3")
                       ("forr" "for ${1:name} in [${2:start}..${3:finish}]${4: by ${5:step}}\n  ${6:# body...}" "Range comprehension (inclusive)" nil nil nil nil nil "E0F8E45A-9262-4DD6-ADFF-B5B9D6CE99C2")
                       ("Raw javascript.yasnippet" "\\`${1:`pbpaste`}\\`" "Raw javascript" nil nil nil nil nil "422A59E7-FC36-4E99-B01C-6353515BB544")
                       ("swi" "switch ${1:object}\n  when ${2:value}\n    ${3:# body...}" "Switch" nil nil nil nil nil "3931A7C6-F1FB-484F-82D1-26F5A8F779D0")
                       ("ifte" "if ${1:condition} then ${2:value} else ${3:other}" "Ternary If" nil nil nil nil nil "CF0B4684-E4CB-4E10-8C25-4D15400C3385")
                       ("try" "try\n  $1\ncatch ${2:error}\n  $3" "Try .. Catch" nil nil nil nil nil "CAFB0DED-5E23-4A84-AC20-87FBAF22DBAC")
                       ("unl" "${1:action} unless ${2:condition}" "Unless" nil nil nil nil nil "E561AECD-5933-4F59-A6F7-FA96E1203606")
                       ("/1" "# $1\n# ==============================================================================\n$0" "Subheader" nil nil nil nil nil "")
                       ("/2" "# $1\n# ----------------------------------------------------------------------\n$0" "Subheader" nil nil nil nil nil "")
                       ("/3" "# $1\n# -------------------------\n$0" "Subheader" nil nil nil nil nil "")
                       ("log" "console.log $0" "log" nil nil nil nil nil "FBC44B18-323A-4C00-A35B-15E41830C5AD")
                       ("req" "${2/^.*?([\\w_]+).*$/\\L$1/} = require ${2:'${1:sys}'}$3" "require" nil nil nil nil nil "8A65E175-18F2-428F-A695-73E01139E41A")))


;;; Do not edit! File generated at Fri Jan 11 22:10:20 2013
