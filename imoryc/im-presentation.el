(require 'org)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ruby . t)
   (java . t)
   ))

(defun org-presentation-start ()
  "Start a presentation from the first headline of the file"
  (interactive)
  (beginning-of-buffer)
  (outline-next-visible-heading 1)
  (org-narrow-to-subtree)
  (org-show-subtree))

(defun org-presentation-adjacent (arg)
  "An arg of 1 moves to the next heading, an arg of negative 1
moves to the previous heading."
  (interactive)
  (beginning-of-buffer)
  (widen)
  (outline-next-visible-heading arg)
  (org-narrow-to-subtree)
  (org-show-subtree))

(define-key org-mode-map (kbd "C-c s") '(lambda () (interactive) (org-presentation-start)))
(define-key org-mode-map (kbd "C-c n") '(lambda () (interactive) (org-presentation-adjacent 1)))
(define-key org-mode-map (kbd "C-c p") '(lambda () (interactive) (org-presentation-adjacent -1)))  
