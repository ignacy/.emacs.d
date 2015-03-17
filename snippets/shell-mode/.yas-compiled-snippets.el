;;; Compiled snippets and support files for `shell-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'shell-mode
                     '(("cr" "git push -u origin $0\n" "create_remote_branch" nil nil nil nil nil nil)
                       ("hr" "heroku run $1 --app $2 $0\n" "heroku_run" nil nil nil nil nil nil)
                       ("pat" "git push axle-test $1:master $0\n" "push to axle-test" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Tue Mar 17 10:59:37 2015
