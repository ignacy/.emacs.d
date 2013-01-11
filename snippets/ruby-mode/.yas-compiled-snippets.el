;;; Compiled snippets and support files for `ruby-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'ruby-mode
                     '(("context" "\ncontext \"$1\" do\n  $0\nend" "context" nil nil nil nil nil nil)
                       ("dbg" "puts \"$1 is currently:  #{$1.inspect}\"" "debug" nil nil nil nil nil nil)
                       ("delegate" "delegate :$1, to: :$2, prefix: true, allow_nil: true\n$0" "delegate" nil nil nil nil nil nil)
                       ("expect" "expect do\n  $0\nend.to change { $1 }.by($2)" "expect" nil nil nil nil nil nil)
                       ("init" "def initialize($1, $2, $3)\n  @$1 = $1\n  @$2 = $2\n  @$3 = $3\nend\n\n$0" "init" nil nil nil nil nil nil)
                       ("it" "it \"should $1\" do\n  $0\nend\n  " "it" nil nil nil nil nil nil)
                       ("let" "let($1) { FactoryGirl.create $1$0 }" "let" nil nil nil nil nil nil)
                       ("spec" "require 'spec_helper'\n\ndescribe $1 do\n  it \"should $2\" do\n    $0\n  end\nend\n" "spec_file" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Fri Jan 11 22:10:20 2013
