;;; im-dark-theme.el --- Custom face theme for Emacs

;; Copyright (C) 2012 Ignacy Moryc

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

(deftheme im-dark-theme
  "")

(custom-theme-set-faces
 'night
 '(default ((t (:background "gray5" :foreground "#ffffff"))))
 '(cursor ((t (:background "#000000" :foreground "#ffffff"))))
 '(region ((t (:background "#1420e3" :foreground "#ffffff"))))
 '(mode-line ((t (:background "#bfbfbf" :foreground "#080808"))))
 '(mode-line-inactive ((t (:background "#e5e5e5" :foreground "#333333"))))
 '(fringe ((t (:background "gray11"))))
 '(border ((t (:background "gray11"))))
 '(border-glyph ((t (nil))))
 '(mode-line ((t (:foreground nil :background "gray18"
                                  :box (:line-width 1 :color "green")))))
 '(mode-line-buffer-id ((t (:foreground "MistyRose2" :background nil))))
 '(mode-line-inactive ((t (:inherit mode-line
                                        :foreground "aquamarine3"
                                        :background "gray6" :weight normal
                                        :box (:line-width 1 :color "gray8")))))
 '(mode-line-emphasis ((t (:foreground "green" :slant italic))))
 '(mode-line-highlight ((t (:foreground "MistyRose2" :box nil :weight bold))))
 '(minibuffer-prompt ((t (:foreground "cyan1"))))
 '(font-lock-builtin-face ((t (:foreground "#d2d3de"))))
 '(font-lock-comment-face ((t (:foreground "#2ab52e"))))
 '(font-lock-constant-face ((t (:foreground "#00e8e8"))))
 '(font-lock-function-name-face ((t (:foreground "#5cff0a"))))
 '(font-lock-keyword-face ((t (:foreground "#0f8fff"))))
 '(font-lock-string-face ((t (:foreground "SpringGreen2"))))
 '(font-lock-type-face ((t (:foreground "#d940ff"))))
 '(font-lock-variable-name-face ((t (:foreground "#23a055"))))
 '(font-lock-warning-face ((t (:foreground "#ff3d51" :weight bold))))
 '(isearch ((t (:background "#17cdb5" :foreground "#010505"))))
 '(lazy-highlight ((t (:background "#a1ee81" :foreground "#030303"))))
 '(link ((t (:foreground "#57ffff" :underline t))))
 '(link-visited ((t (:foreground "#158b2c" :underline t))))
 '(button ((t (:underline t))))
 '(header-line ((t (:background "#e5e5e5" :foreground "#9e54ff")))))

(provide-theme 'im-dark-theme)

