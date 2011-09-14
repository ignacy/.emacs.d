;;; tango-dark-theme.el --- Custom face theme for Emacs

;; Copyright (C) 2010 Free Software Foundation, Inc.

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

(deftheme tango-dark
  "Theme for faces, based on the Tango palette on a dark background.
The Tango palette is in the public domain: http://tango.freedesktop.org/")

(custom-theme-set-faces
 'tango-dark
 '(default ((t (:background "#2e3436" :foreground "#eeeeec"))))
 '(cursor ((t (:background "#fce94f" :foreground "#2e3436"))))
 '(region ((t (:background "#555753"))))
 '(mode-line ((t (:background "#d3d7cf" :foreground "#000000"))))
 '(mode-line-inactive ((t (:background "#555753" :foreground "#ffffff"))))
 '(fringe ((t (:background "#2c2c2c"))))
 '(minibuffer-prompt ((t (:foreground "#fce94f"))))
 '(font-lock-builtin-face ((t (:foreground "#ad7fa8"))))
 '(font-lock-comment-face ((t (:foreground "#73d216"))))
 '(font-lock-constant-face ((t (:foreground "#e6a8df"))))
 '(font-lock-function-name-face ((t (:foreground "#fce84f"))))
 '(font-lock-keyword-face ((t (:foreground "#8cc4ff"))))
 '(font-lock-string-face ((t (:foreground "#e9b96e"))))
 '(font-lock-type-face ((t (:foreground "#a5ff4d"))))
 '(font-lock-variable-name-face ((t (:foreground "#fcaf3e"))))
 '(font-lock-warning-face ((t (:foreground "#ef2929"))))
 '(isearch ((t (:background "#ce5c00" :foreground "#ffffff"))))
 '(lazy-highlight ((t (:background "#8f5902"))))
 '(link ((t (:foreground "#729fcf" :underline t))))
 '(link-visited ((t (:foreground "#3465a4" :underline t))))
 '(button ((t (:foreground "#729fcf" :underline t))))
 '(header-line ((t (:background "#555753" :foreground "#ffffff")))))

(provide-theme 'tango-dark)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; tango-dark-theme.el  ends here
