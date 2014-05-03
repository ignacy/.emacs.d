;; derfian-light-theme.el --- a light, low-contrast color theme for Emacs
;;
;; Copyright © 2014      Karl Mikaelsson <derfian@hamsterkollektivet.se>
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;

(deftheme derfian-light
  "A light, low-contrast color theme with Tango colors")

;; Helper functions to programmatically modify font weights.
;; FIXME: package this separately
(defvar derfian/font-weights
  '((ultra-bold . 9)
    (extra-bold . 8)
    (bold . 7)
    (semi-bold . 6)
    (normal . 5)
    (semi-light . 4)
    (light . 3)
    (extra-light . 2)
    (ultra-light . 1)))

(defun derfian/modify-font-weight (weight adj &optional steps)
  "Returns a relatively different font weight, optionally adjusted steps. "
  (let* ((step (if steps steps 1))
         (current (cdr (assoc weight derfian/font-weights)))
         ;; Clamp modified value to 1-9.
         (new (min (max 1 (funcall adj current step)) 9)))
    (car (rassoc new derfian/font-weights))))

(defun derfian/font-weight-bolder (weight &optional steps)
  "Return a relatively bolder font weight."
  (derfian/modify-font-weight weight '+ steps))

(defun derfian/font-weight-lighter (weight &optional steps)
  "Returns a relatively lighter font weight."
  (derfian/modify-font-weight weight '- steps))

(custom-theme-set-variables
 'derfian-light
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(show-trailing-whitespace t))

;; Thanks for the color definitions, tango-theme.el!
(let* ((class '((class color) (min-colors 89)))

       (butter-0 "#fff496")
       (butter-1 "#fce94f")
       (butter-2 "#edd400")
       (butter-3 "#c4a000")
       (butter-4 "#9c8000")
       (butter-5 "#665400")

       (orange-1 "#fcaf3e")
       (orange-2 "#f57900")
       (orange-3 "#ce5c00")
       (orange-4 "#9c4900")
       (orange-5 "#663000")

       (choc-1 "#e9b96e")
       (choc-2 "#c17d11")
       (choc-3 "#8f5902")
       (choc-4 "#724701")
       (choc-5 "#402700")

       (cham-1 "#8ae234")
       (cham-2 "#73d216")
       (cham-3 "#4e9a06")
       (cham-4 "#346604")
       (cham-5 "#274D03")

       (blue-0 "#8cc4ff")
       (blue-1 "#729fcf")
       (blue-2 "#3465a4")
       (blue-3 "#204a87")
       (blue-4 "#193b6c")
       (blue-5 "#001F4D")

       (plum-1 "#ad7fa8")
       (plum-2 "#75507b")
       (plum-3 "#5c3566")
       (plum-4 "#492a51")
       (plum-5 "#2B0336")

       (red-1 "#ef2929")
       (red-2 "#cc0000")
       (red-3 "#a40000")
       (red-4 "#830000")
       (red-5 "#6e0000")

       (alum-1 "#eeeeec")
       (alum-2 "#d3d7cf")
       (alum-3 "#babdb6")
       (alum-4 "#888a85")
       (alum-5 "#5f615c")
       (alum-6 "#2e3436")
       (alum-7 "#24292b")

       ;; Palette to generic names
       (global-bg alum-1)
       (global-fg alum-6)

       ;; Font weights
       ;; light/medium/demibold/bold/black?
       (default-weight (face-attribute 'default :weight))
       (bold-weight (derfian/font-weight-bolder default-weight 1))
       (bolder-weight (derfian/font-weight-bolder bold-weight 2))
       (light-weight (derfian/font-weight-lighter default-weight 1))
       (lighter-weight (derfian/font-weight-lighter light-weight 2)))

  (custom-theme-set-faces
   'derfian-light
   `(default ((,class (:foreground ,global-fg :background ,global-bg))))
   `(fringe ((,class (:inherit linum))))
   `(trailing-whitespace ((,class (:strike-through ,red-3))))
   `(highlight ((,class ())))
   `(highline-face ((,class (:inherit highlight))))
   `(linum ((,class (:background ,global-bg :foreground ,alum-3))))
   `(show-paren-mismatch ((,class (:background ,red-1 :foreground ,red-3))))
   `(show-paren-match ((,class (:weight ,bolder-weight :foreground ,red-4))))

   ;; default mode line look
   `(mode-line ((,class (:foreground ,global-fg
                         :background ,alum-2
                         :box (:line-width 1 :color ,alum-3)))))
   ;; Inactive mode line
   `(mode-line-inactive ((,class (:inherit mode-line :foreground ,alum-3))))

   ;; stuff in mode line that is clickable
   `(mode-line-highlight ((,class (:inherit mode-line))))

   `(region ((,class (:background ,alum-5 :foreground ,alum-1))))
   `(warning ((,class (:foreground ,orange-2))))
   `(error ((,class (:foreground ,red-1))))

   ;; isearch
   `(isearch ((,class (:background ,blue-0))))
   `(isearch-fail ((,class (:strike-through ,red-1))))
   `(lazy-highlight ((,class (:weight ,bolder-weight :underline ,blue-0))))

   ;; font-lock

   `(font-lock-builtin-face ((,class (:foreground ,blue-2 :weight ,bold-weight))))
   `(font-lock-comment-delimiter-face ((,class (:inherit font-lock-comment-face))))
   `(font-lock-comment-face ((,class (:foreground ,red-5 :weight ,lighter-weight))))
   `(font-lock-constant-face ((,class (:foreground ,choc-2 :weight ,bold-weight))))
   `(font-lock-doc-face ((,class (:foreground ,orange-3))))
   `(font-lock-doc-string-face ((,class (:inherit font-lock-doc-face))))
   `(font-lock-function-name-face ((,class (:foreground ,blue-2 :weight ,bold-weight))))
   `(font-lock-keyword-face ((,class (:foreground ,alum-7 :weight ,bold-weight))))
   `(font-lock-negation-char-face ((,class (:foreground ,red-3 :weight ,bold-weight))))
   `(font-lock-other-type-face ((,class (:foreground ,cham-2 :weight ,bold-weight))))
   `(font-lock-preprocessor-face ((,class (:foreground ,plum-3))))
   `(font-lock-special-keyword-face ((,class (:background ,red-3 :foreground ,red-1))))
   `(font-lock-string-face ((,class (:foreground ,cham-4))))
   `(font-lock-type-face ((,class (:foreground "#2F8547" :weight ,bold-weight))))
   `(font-lock-variable-name-face ((,class (:foreground ,orange-4))))
   `(font-lock-warning-face ((,class (:foreground ,butter-4 :background ,butter-2))))
   `(font-lock-pseudo-keyword-face ((,class (:weight ,bold-weight))))

   ;; FIXME: what does these control?
   ;; `(font-lock-other-emphasized-face ((,class ())))
   ;; `(font-lock-reference-face ((,class ())))
   ;; `(font-lock-regexp-grouping-backslash ((,class ())))
   ;; `(font-lock-regexp-grouping-construct ((,class ())))

   ;; outlines/org

   `(outline-1 ((,class (:foreground ,blue-3 :weight ,bold-weight))))
   `(outline-2 ((,class (:foreground ,blue-2 :weight ,bold-weight))))
   `(outline-3 ((,class (:foreground ,plum-3 :weight ,bold-weight))))
   `(outline-4 ((,class (:foreground ,plum-2 :weight ,bold-weight))))
   `(outline-5 ((,class (:foreground ,plum-1 :weight ,bold-weight))))
   `(outline-6 ((,class (:foreground ,choc-3 :weight ,bold-weight))))
   `(outline-7 ((,class (:foreground ,choc-2 :weight ,bold-weight))))
   `(outline-8 ((,class (:foreground ,blue-1 :weight ,bold-weight))))
   `(org-todo ((,class (:foreground ,red-3 :background ,red-1 :weight ,bold-weight))))
   `(org-done ((,class (:foreground ,cham-3 :background ,cham-1 :weight ,bold-weight))))
   `(org-table ((,class (:foreground ,choc-3))))
   `(org-mode-line-clock ((,class (:weight ,bold-weight))))
   `(org-date ((,class (:foreground ,blue-1 :underline ,blue-1))))
   `(org-special-keyword ((,class (:foreground ,blue-4 :weight ,bold-weight))))

   ;; mu4e

   ;; `(mu4e-cited-1-face ((,class (:foreground ,plum-1))))
   ;; `(mu4e-compose-separator-face ((,class (:inherit message-separator))))
   ;; `(mu4e-contact-face ((,class (:foreground ,orange-3))))
   ;; `(mu4e-draft-face ((,class (:foreground ,blue-1 :slant italic))))
   ;; `(mu4e-flagged-face ((,class (:foreground ,butter-1 :background ,butter-3))))
   ;; `(mu4e-forwarded-face ((,class (:inherit mu4e-replied-face))))
   ;; `(mu4e-footer-face ((,class (:foreground ,alum-4))))
   `(mu4e-header-face ((,class (:foreground ,alum-7 :weight ,default-weight))))
   `(mu4e-header-highlight-face ((,class (:background ,alum-2))))
   ;; `(mu4e-header-key-name ((,class (:inherit message-header-name))))
   ;; `(mu4e-header-marks-face ((,class (:foreground ,red-1))))
   ;; `(mu4e-header-title-face ((,class (:foreground ,plum-1))))
   ;; `(mu4e-header-value-face ((,class (:foreground ,orange-3))))
   ;; `(mu4e-moved-face ((,class (:strike-through ,choc-2))))
   ;; `(mu4e-replied-face ((,class (:foreground ,cham-3))))
   ;; `(mu4e-trashed-face ((,class (:strike-through ,red-1))))
   `(mu4e-unread-face ((,class (:foreground ,red-2 :weight ,bold-weight))))

   ;; mu4e-attach-number-face,
   ;; mu4e-cited-2-face
   ;; mu4e-cited-3-face
   ;; mu4e-cited-4-face
   ;; mu4e-cited-5-face
   ;; mu4e-cited-6-face
   ;; mu4e-cited-7-face
   ;; mu4e-compose-header-face
   ;; mu4e-contact-face
   ;; mu4e-highlight-face
   ;; mu4e-link-face
   ;; mu4e-ok-face
   ;; mu4e-special-header-value-face
   ;; mu4e-system-face
   ;; mu4e-title-face,
   ;; mu4e-url-number-face
   ;; mu4e-warning-face

   ;; message

   ;; `(message-cited-text ((,class (:inherit mu4e-cited-1-face))))
   ;; `(message-header-name ((,class (:foreground ,blue-3 :weight ,bold-weight))))
   ;; `(message-header-from ((,class (:foreground ,blue-3 :weight ,bold-weight))))
   ;; `(message-header-to ((,class (:foreground ,orange-3 :weight ,bold-weight))))
   ;; `(message-header-subject ((,class (:foreground ,cham-3 :weight ,bold-weight))))
   ;; `(message-header-other ((,class (:foreground ,orange-3))))
   ;; `(message-separator ((,class (:foreground ,global-bg :strike-through ,global-fg))))

   ;; message-header-newsgroups
   ;; message-header-xheader
   ;; message-mml

   ;; flyspell

   `(flyspell-incorrect ((,class (:underline (:color ,red-1 :style wave)))))
   `(flyspell-duplicate ((,class (:inherit flyspell-incorrect))))

   ;; diff

   `(diff-indicator-removed ((,class (:background ,red-1 :foreground ,red-3))))
   `(diff-indicator-added ((,class (:background ,cham-1 :foreground ,cham-3))))

   ;; diff-removed
   ;; diff-added
   ;; diff-context
   ;; diff-header
   ;; diff-file-header
   ;; diff-hunk-header

   ;; sh-mode
   `(sh-quoted-exec ((,class (:foreground ,red-1))))

   ;; js2-mode
   `(js2-external-variable ((,class (:foreground ,orange-4))))

   ;; Magit
   `(magit-item-highlight ((,class (:background ,butter-0))))
   ;; magit-diff-hunk-header
   `(magit-diff-file-header ((,class (:weight ,default-weight :background ,alum-3))))
   `(magit-diff-hunk-header ((,class (:weight ,bold-weight :background ,alum-2 :box (:line-width 1 :color ,alum-3)))))
   ;; magit-diff-file-header
   `(magit-section-title ((,class (:weight ,bold-weight))))

   ;; magit-branch
   `(magit-tag ((,class (:weight ,bold-weight :background ,alum-2 :foreground ,blue-2))))

   ;; magit-diff-add
   ;; magit-diff-del
   ;; magit-diff-none
   ))

(provide-theme 'derfian-light)
