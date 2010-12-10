;;; ==================================================================
;;; Author:  Jim Weirich
;;; File:    ini-toggle
;;; Purpose: Setups for Ruby test file toggle
;;; ==================================================================

;;(require 'toggle)

;;; Note that we have switched the order of test/code files in these
;;; rules.  This allows the lib/*.rb rules to work properly.

(defun add-toggle-mapping (mapping)
  (setq toggle-mapping-styles
        (assq-delete-all (car mapping) toggle-mapping-styles))
  (add-to-list 'toggle-mapping-styles mapping))

(add-toggle-mapping
 '(jw-rails
   ("test/functional/\\1_test.rb"   . "app/controllers/\\1.rb")
   ("test/unit/helpers/\\1_test.rb" . "app/helpers/\\1.rb")
   ("test/unit/lib/\\1_test.rb"     . "lib/\\1.rb" )
   ("test/unit/\\1_test.rb"         . "app/models/\\1.rb")))

(add-toggle-mapping
 '(jw-rails-spec
   ("spec/\\1_spec.rb"              . "app/\\1.rb")))

(add-toggle-mapping
 '(jw-spec
   ("spec/\\1_spec.rb"         . "lib/\\1.rb")
   ("\\1_spec.rb"              . "\\1.rb")))

(add-toggle-mapping
 '(jw-postfix
   ("test/\\1_test.rb" . "lib/\\1.rb")
   ("\\1_test.rb"      . "\\1.rb")))

(add-toggle-mapping
 '(jw-prefix
   ("test/test_\\1.rb" . "lib/\\1.rb")
   ("test_\\1.rb"      . "\\1.rb")))

(toggle-style 'jw-postfix)

;;; Debugging ========================================================

(defun toggle-debug-loop (path rules)
  "Search the lookup rules for a toggle match displaying debug statements as you go."
  (cond ((null rules)
         (insert "END OF RULES\n")
         nil)
        ((string-match (caar rules) path)
         (insert (concat "Matching Rule: " (caar rules) "\n"))
         (let ((result (replace-match (cdar rules) nil nil path)))
           (insert "RESULT: " result)
           result) )
        (t
         (insert (concat "Failing  Rule: " (caar rules) "\n"))
         (toggle-debug-loop path (rest rules)))))

(defun toggle-debug (path)
  "Same as the standard toggle-filename, but prints debug messages."
  (interactive "fFile Name: ")
  (pop-to-buffer (set-buffer (get-buffer-create "*dbg*")))
  (goto-char (point-max))
  (insert "\n*************************************\n\n")
  (insert (format "LOOKING FOR %s\n" path))
  (insert (format "IN RULES %s\n\n" toggle-mappings))
  (toggle-debug-loop path toggle-mappings))
