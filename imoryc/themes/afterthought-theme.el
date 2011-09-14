;;; afterthought-theme.el --- Custom face theme for Emacs

;; Copyright (C) 2010 Jonas Gorauskas.

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(deftheme afterthought
  "A dark theme with good contrast.")

(custom-theme-set-faces
 'afterthought
 '(default ((t (:background "#111111" :foreground "#eeeeee"))))
 '(cursor ((t (:background "#800517" :foreground "#ffffff"))))
 '(region ((t (:background "#003399" :foreground "#ffffff"))))
 '(mode-line ((t (:background "#333333" :foreground "#ffffff"))))
 '(mode-line-inactive ((t (:background "#111111" :foreground "#666666"))))
 '(fringe ((t (:background "#222222"))))
 '(minibuffer-prompt ((t (:slant italic :foreground "#99ff99" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "#cc99ff"))))
 '(font-lock-comment-face ((t (:slant italic :foreground "#999999"))))
 '(font-lock-constant-face ((t (:foreground "#99ff99" :weight bold))))
 '(font-lock-function-name-face ((t (:foreground "#ff9999"))))
 '(font-lock-keyword-face ((t (:foreground "#99ccff"))))
 '(font-lock-string-face ((t (:foreground "#ffff99"))))
 '(font-lock-type-face ((t (:foreground "#ff9999" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "#ff99ff"))))
 '(font-lock-warning-face ((t (:foreground "#800517" :weight bold))))
 '(isearch ((t (:background "#ff99ff" :foreground "#003399"))))
 '(lazy-highlight ((t (:background "#eeeeee" :foreground "#333333"))))
 '(link ((t (:foreground "#6699cc" :underline t))))
 '(link-visited ((t (:foreground "#cc66cc" :underline t))))
 '(button ((t (:background "#333333" :foreground "#cccccc" :underline t))))
 '(header-line ((t (:background "#222222" :foreground "#ffffff")))))

(provide-theme 'afterthought)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; afterthought-theme.el  ends here
