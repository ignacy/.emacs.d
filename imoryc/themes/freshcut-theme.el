;;; freshcut-theme.el --- Custom face theme for Emacs

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

(deftheme freshcut-theme "My dark theme")

(let ((background "#2F3030")
      (foreground "#F8F8F2")
      (selection "#161A1F")
      (hl-line "#11151a")
      (cursor "#F8F8F0")
      (comment "#556270")

      (gray-1 "#878289")   (gray-1bg "#181d23")
      (gray-2 "#2a3441")
      (gray-3 "#b3adb4")   (gray-3bg "#0e1116")
      (gray-4 "#1f2730")
      (gray-5 "#242d38")
      (gray-6 "#192028")
      (red-1 "#d15120")    (red-1bg "#2a1f1f")
      (red-2 "#b23f1e")    (red-2bg "#251c1e")
      (brown-1 "#9f621d")  (brown-1bg "#2a1f1f")
      (orange-1 "#d97a35") (orange-1bg "#272122")
      (yellow-1 "#deae3e") (yellow-1bg "#2a2921")
      (green-1 "#81af34")  (green-1bg "#1a2321")
      (green-2 "#4e9f75")  (green-2bg "#1a2321")
      (blue-1 "#7e9fc9")   (blue-1bg "#1e252f")
      (blue-2 "#417598")   (blue-2bg "#1b333e")
      (blue-3 "#00959e")   (blue-3bg "#132228")
      (blue-4 "#365e7a")   (blue-4bg "#172028")
      (purple-1 "#a878b5") (purple-1bg "#25222f")
      )

  (custom-theme-set-faces
   'freshcut-theme

   ;; Basics
   `(default ((t (:background ,background :foreground ,foreground))))
   `(cursor ((t (:background ,cursor))))
   `(region ((t (:background ,selection))))
   `(highlight ((t (:foreground ,blue-3 :background ,blue-3bg))))
   `(hl-line ((t (:background ,hl-line))))
   `(minibuffer-prompt ((t (:foreground ,orange-1 :background ,orange-1bg))))
   `(escape-glyph ((t (:foreground ,purple-1 :background , purple-1bg))))

   ;; Font-lock stuff
   `(font-lock-builtin-face ((t (:foreground "#8FBE00" :background ,background))))
   `(font-lock-constant-face ((t (:foreground "#8FBE00" :background ,background))))
   `(font-lock-comment-face ((t (:foreground ,comment :background ,background :italic t))))
   `(font-lock-doc-face ((t (:foreground ,gray-1 :background ,gray-1bg))))
   `(font-lock-doc-string-face ((t (:foreground "#e9ee00" :background ,gray-1bg))))
   `(font-lock-function-name-face ((t (:foreground "#AEE239" :background ,background))))
   `(font-lock-keyword-face ((t (:foreground "#C8D7E8" :background ,background))))
   `(font-lock-negation-char-face ((t (:foreground ,yellow-1 :background ,background))))
   `(font-lock-preprocessor-face ((t (:foreground "#00A8C6" :background ,background))))
   `(font-lock-string-face ((t (:foreground "#e9ee00" :background ,background))))
   `(font-lock-type-face ((t (:foreground "#8FBE00" :background ,background :bold nil))))
   `(font-lock-variable-name-face ((t (:foreground "#00A8C6" :background ,background))))
   `(font-lock-warning-face ((t (:foreground ,red-2 :background ,background))))

   ;; UI related
   `(link ((t (:foreground ,blue-1 :background ,blue-1bg))))
   `(fringe ((t (:background ,gray-1bg))))
   `(mode-line ((t (:foreground ,blue-1 :box (:line-width 1 :color ,blue-2bg)))))
   `(mode-line-inactive ((t (:foreground ,blue-4 :background ,gray-4))))
   `(vertical-border ((t (:background ,background :foreground ,gray-5))))

   ;; Linum
   `(linum ((t (:foreground ,gray-2 :background ,gray-1bg))))

   ;; show-paren-mode
   `(show-paren-match ((t (:foreground ,orange-1 :background ,orange-1bg))))
   `(show-paren-mismatch ((t (:foreground ,red-2bg :background ,red-2))))

   ;; ido
   `(ido-only-match ((t (:foreground ,green-1 :background ,green-1bg))))
   `(ido-subdir ((t (:foreground ,purple-1 :background ,purple-1bg))))

   ;; whitespace-mode
   `(whitespace-empty ((t (:foreground ,yellow-1bg :background ,yellow-1))))
   `(whitespace-hspace ((t (:foreground ,gray-2))))
   `(whitespace-indentation ((t (:foreground ,gray-2))))
   `(whitespace-line ((t (:background ,gray-2))))
   `(whitespace-newline ((t (:foreground ,gray-2))))
   `(whitespace-space ((t (:foreground ,gray-2))))
   `(whitespace-space-after-tab ((t (:foreground ,gray-2))))
   `(whitespace-tab ((t (:foreground ,gray-2))))
   `(whitespace-trailing ((t (:foreground ,background :background ,red-1))))

   ;; flyspell-mode
   `(flyspell-incorrect ((t (:underline ,red-2))))
   `(flyspell-duplicate ((t (:underline ,red-2))))

   ;; magit
   `(magit-diff-add ((t (:foreground ,green-1))))
   `(magit-diff-del ((t (:foreground ,red-2))))
   `(magit-item-highlight ((t (:background ,gray-1bg))))

   ;; highlight-indentation-mode
   `(highlight-indentation-face ((t (:background ,gray-1bg))))
   `(highlight-indentation-current-column-face ((t (:background ,gray-4))))

   ;; org-mode
   `(org-date ((t (:foreground ,purple-1 :background ,purple-1bg))))
   `(org-done ((t (:foreground ,green-1 :background ,green-1bg))))
   `(org-hide ((t (:foreground ,gray-2 :background ,gray-1bg))))
   `(org-link ((t (:foreground ,blue-1 :background ,blue-1bg))))
   `(org-todo ((t (:foreground ,red-1 :background ,background))))
   )

  (custom-theme-set-variables
   'freshcut-theme

   ;; ;; Fill Column Indicator mode
   `(fci-rule-color ,gray-6)
   `(fci-rule-character-color ,gray-6)

   `(ansi-color-names-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [,background ,red-1 ,green-1 ,yellow-1 ,blue-1 ,purple-1 ,blue-1 ,foreground])
   `(ansi-term-color-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [unspecified ,background ,red-1 ,green-1 ,yellow-1 ,blue-1 ,purple-1 ,blue-1 ,foreground])
   )
  )

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'freshcut-theme)
