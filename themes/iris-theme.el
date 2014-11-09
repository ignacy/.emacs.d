;;; iris-theme.el --- An empirical dark on light color theme based on some scientific researches for GNU Emacs 24

;; Author: Romano Augusto
;; Keywords: iris color theme emacs
;; URL: https://github.com/romanoaugusto88/emacs-color-theme-iris

;; This file is NOT part of GNU Emacs.

;;; License:

;;; The MIT License (MIT)
;;;
;;; Copyright (c) 2014 Romano Augusto Mariano de Souza <romanoaugusto88@gmail.com>
;;;
;;; Permission is hereby granted, free of charge, to any person obtaining a copy of
;;; this software and associated documentation files (the "Software"), to deal in
;;; the Software without restriction, including without limitation the rights to
;;; use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
;;; the Software, and to permit persons to whom the Software is furnished to do so,
;;; subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be included in all
;;; copies or substantial portions of the Software.
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
;;; FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
;;; COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
;;; IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;;; Code:

(deftheme iris
  "An empirical dark on light color theme based on some scientific researches")

(custom-theme-set-faces
  'iris

  ; base
  `(default ((t (:background, "#f8f8f8" :foreground, "#333"))))
  `(cursor ((t (:background, "#000"))))
  `(fringe ((t (:foreground "#333" :background "#f8f8f8"))))
  `(highlight ((t (:background "#e5e5e5"))))
  `(region ((t :foreground "#fff" :background "#375eaf")))

  ; font-lock
  `(font-lock-builtin-face ((t (:foreground, "#0086b3"))))
  `(font-lock-comment-face ((t (:foreground, "#999988" :italic t))))
  `(font-lock-constant-face ((t (:foreground, "#0086b3"))))
  `(font-lock-function-name-face ((t (:foreground, "#333"))))
  `(font-lock-keyword-face ((t (:foreground "#333" :bold t))))
  `(font-lock-string-face ((t (:foreground "#d14"))))
  `(font-lock-type-face ((t (:foreground "#445588" :bold t))))
  `(font-lock-variable-name-face ((t (:foreground "#333"))))

  ; linum
  `(linum ((t :foreground "#ccc", :background "#f8f8f8")))
  `(linum-relative-current-face ((t :foreground "#f8f8f8" :background "#333")))

  ; modeline
  `(minibuffer-prompt ((t (:foreground "#0000cd" :bold t))))
  `(mode-line ((t (:height 1.0  :foreground "#f8f8f8" :background "#333" :bold t :box(:line-width 2 :color "#333")))))
  `(mode-line-inactive ((t (:height 1.0 :foreground "#999988" :background "#666666" :box(:line-width 2 :color "#666666")))))

  ; search
  `(evil-ex-lazy-highlight ((t (:foreground "#333" :background "#ffff00"))))
  `(evil-ex-search ((t (:foreground "#333" :background "#ffff00"))))
  `(evil-ex-substitute-matches ((t (:foreground "#333" :background "#ffff00"))))
  `(evil-ex-substitute-replacement ((t (:foreground "#333" :background "#cccccc"))))
  `(isearch ((t (:foreground "#333" :background "#ffff00"))))
  `(lazy-highlight ((t (:foreground "#333" :background "#ffff00"))))

  ; company
  `(company-tooltip ((t (:foreground "#333" :background "#e5e5e5"))))
  `(company-tooltip-selection ((t (:foreground "#f8f8f8" :background "#333"))))
  `(company-tooltip-common ((t :foreground "#0000cd" :background "#e5e5e5" :bold t)))
  `(company-tooltip-common-selection ((t :foreground "#0000cd" :background "#e5e5e5" :bold t)))
  `(company-scrollbar-fg ((t :background "#333")))
  `(company-scrollbar-bg ((t :background "#fff")))

  ; parens
  `(show-paren-match ((t (:foreground "#333" :background "#eeee00"))))
  `(show-paren-mismatch ((t (:foreground "#fff" :background "#ee0000"))))

  ; js3-mode
  `(js3-error-face ((t (:foreground "#ff0000"))))
  `(js3-external-variable-face ((t :foreground "#ffa500")))
  `(js3-function-param-face ((t :foreground "#333")))
  )

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'iris)

;;; iris-theme.el ends here
