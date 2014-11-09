;; yosemite-theme.el --- Theme with colors from OS X Yosemite for GNU Emacs 24

;; Copyright (c) 2014 Paul Metzner <paul.metzner@gmail.com>

;; Author: Paul Metzner
;; http://github.com/pmetzner/color-theme-yosemite
;; Version: 0.1
;; Package-Requires: ((color-theme "6.6.1"))

;; This file is not a part of GNU Emacs.

;;; License:

;; This is free software; you can redistribute it and/or modify it under the
;; terms of the GNU General Public License as published by the Free Software
;; Foundation; either version 2, or (at your option) any later version.  This is
;; distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
;; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
;; PARTICULAR PURPOSE.  See the GNU General Public License for more details.
;; You should have received a copy of the GNU General Public License along with
;; GNU Emacs; see the file COPYING.  If not, write to the Free Software
;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

;;; Code:

(deftheme yosemite "Color theme for Emacs 24 with colors from OS X Yosemite")

;; Define colors
(let  ((*background-mode* 'light)
       (*border-color* "#232323")
       (*black* "#232323")
       (*white* "#FCFCFC")
       (*mouse-color* "#BCD5FA")
       (*red* "#FF5E59")
       (*blue* "#2CACF2")
       (*green* "#6CCB47")
       (*purple* "#D087E1")
       (*cyan* "#5CE1EB")
       (*yellow* "#F5CD3E")
       (*orange* "#F9A53D")
       (*lightgrey* "#EDEDEC")
       (*midgrey* "#A4A4A5")
       (*darkgrey* "#5A6264")
)

(custom-theme-set-faces
  'yosemite
    `(default ((t (:background, *white* :foreground, *black*))))
    `(ac-candidate-face ((t (:background, *lightgrey* :foreground, *black*))))
    `(ac-selection-face ((t (:background, *mouse-color* :foreground, *black*))))
    `(comint-highlight-prompt ((t (:background, *white* :foreground, *black*))))
    `(cursor ((t (:background, *black*))))
    `(css-property ((t (:bold t))))
    `(css-selector ((t (:foreground, *red*))))
    `(deft-title-face ((t (:bold t))))
    `(ecb-default-general-face ((t (:height 0.9))))
    `(ecb-default-highlight-face ((t (:background, *mouse-color* :foreground, *black*))))
    `(ecb-directories-general-face ((t (:bold t :weight bold))))
    `(ecb-source-in-directories-buffer-face ((t (:foreground, *blue*))))
    `(ein:cell-input-area ((t (:background, *darkgrey*))))
    `(erb-comment-delim-face ((t (:italic t :bold t :slant italic :foreground, *lightgrey* :weight bold))))
    `(erb-comment-face ((t (:foreground, *midgrey*))))
    `(erb-delim-face ((t (:bold t :weight bold))))
    `(erb-exec-delim-face ((t (:bold t :weight bold))))
    `(erb-exec-face ((t (:background, *lightgrey*))))
    `(erb-face ((t (:background, *lightgrey*))))
    `(erb-out-delim-face ((t (:bold t :foreground, *blue* :weight bold))))
    `(erb-out-face ((t (:background, *lightgrey*))))
    `(ess-numbers-face ((t (:foreground, *green*))) t)
    `(flx-highlight-face ((t (:inherit font-lock-variable-name-face :underline t))))
    `(font-latex-bold-face ((((class color) (background light)) (:inherit bold :weight bold))) t)
    `(font-latex-math-face ((t nil)) t)
    `(font-latex-sectioning-0-face ((t (:inherit `default :weight bold :foreground, *blue*))) t)
    `(font-latex-sectioning-1-face ((t (:inherit font-latex-sectioning-0-face))) t)
    `(font-latex-sectioning-2-face ((t (:inherit font-latex-sectioning-0-face))) t)
    `(font-latex-sectioning-3-face ((t (:inherit font-latex-sectioning-0-face))) t)
    `(font-latex-sectioning-4-face ((t (:inherit font-latex-sectioning-0-face))) t)
    `(font-latex-sectioning-5-face ((t (:inherit font-latex-sectioning-0-face))) t)
    `(font-latex-slide-title-face ((t (:inherit font-lock-type-face))) t)
    `(font-latex-verbatim-face ((t (:inherit font-lock-type-face))) t)
    `(font-latex-warning-face ((t (:foreground, *white* :background, *red* :bold t))))
    `(font-latex-sedate-face ((t (:bold t))))
    `(font-latex-string-face ((t (:inherit font-lock-string-face))))
    `(font-lock-builtin-face ((t (:foreground, *blue*))))
    `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
    `(font-lock-comment-face ((t (:foreground, *midgrey* :italic t))))
    `(font-lock-constant-face ((t (:foreground, *blue*))))
    `(font-lock-doc-face ((t (:foreground, *red*))))
    `(font-lock-function-name-face ((t (:foreground, *red* :weight bold))))
    `(font-lock-keyword-face ((t (:bold t :weight bold))))
    `(font-lock-negation-char-face ((t (:foreground, *orange*))))
    `(font-lock-reference-face ((t (nil))))
    `(font-lock-regexp-grouping-backslash ((t (:foreground, *green*))))
    `(font-lock-regexp-grouping-construct ((t (:foreground, *green*))))
    `(font-lock-string-face ((t (:foreground, *green*))))
    `(font-lock-type-face ((t (:foreground, *black* :bold t))))
    `(font-lock-other-type-face ((t (:foreground, *blue*))))
    `(font-lock-variable-name-face ((t (:inherit 'default))))
    `(font-lock-warning-face ((t (:foreground, *white* :background, *red*))))
    `(font-lock-exit-face ((t (:foreground, *red*))))
    `(font-lock-color-constant-face ((t (:foreground, *green*))))
    `(font-lock-other-emphasized-face ((t (:bold t :weight bold :foreground, *purple*))))
    `(fringe ((t (:foreground, *lightgrey* :background, *white*))))
    `(git-commit-nonempty-second-line-face ((t (:inherit default))))
    `(hl-line ((t (:background, *lightgrey*))))
    `(highlight ((t (:background, *mouse-color*))))
    `(link ((t (:foreground, *blue* :underline t))))
    `(link-visited ((t (:underline t :foreground, *purple*))))
    `(linum ((t (:foreground, *lightgrey* :height 0.8))))
    `(message-cited-text-face ((t (:foreground, *blue*))))
    `(message-header-name-face ((t (:weight bold :foreground, *black*))))
    `(message-header-other-face ((t (:foreground, *blue*))))
    `(message-header-to-face ((t (:foreground, *blue*))))
    `(message-header-cc-face ((t (:inherit message-header-to-face))))
    `(message-header-bcc-face ((t (:inherit message-header-to-face))))
    `(message-header-subject-face ((t (:foreground, *green*))))
    `(minibuffer-prompt ((t (:weight bold))))
    `(mmm-default-submode-face ((t (:background, *darkgrey*))))
    `(mmm-code-submode-face ((t (:background, *darkgrey*))))
    `(mode-line ((t (:height 1.0
                     :background , *black*
                     :foreground, *white*
                     :bold t
                     :box(:line-width 2 :color , *black*)))))
    `(mode-line-inactive ((t (:height 1.0
                              :background, *darkgrey*
                              :foreground, *lightgrey*
                              :box(:line-width 2 :color, *darkgrey*)))))
    `(mouse ((t (:background, *mouse-color*))))
    `(mu4e-flagged-face ((t (:foreground, *red*))))
    `(mu4e-replied-face ((t (:italic t))))
    `(mu4e-unread-face ((t (:inherit `default :weight bold))))
    `(mu4e-header-highlight-face ((t (:inherit `highlight :weight medium :underline nil))))
    `(mu4e-title-face ((t (:foreground, *black* :weight bold))))
    `(mu4e-view-header-key-face ((t (:weight bold :foreground, *black*))))
    `(mu4e-view-header-marks-face ((t (:inherit `message-header-to-face))))
    `(mu4e-view-header-title-face ((t (:background, *black* :foreground, *white*))))
    `(mu4e-view-link-face ((t (:foreground, *blue*))))
    `(mu4e-view-special-header-value-face ((t (:foreground, *blue*))))
    `(popup-tip-face ((t (:background, *yellow* :foreground, *black*))))
    `(quack-about-face ((t ())))
    `(quack-about-title-face ((t (:bold t :foreground, *green* :weight bold :height 2.0))))
    `(quack-banner-face ((t ())))
    `(quack-pltfile-dir-face ((t (:bold t :background, *midgrey* :foreground, *white* :weight bold :height 1.2))))
    `(quack-pltfile-file-face ((t (:bold t :background, *lightgrey* :foreground, *black* :weight bold :height 1.2))))
    `(quack-pltfile-prologue-face ((t (:background, *lightgrey* :foreground, *black*))))
    `(quack-pltish-class-defn-face ((t (:bold t :weight bold :foreground, *purple*))))
    `(quack-pltish-comment-face ((t (:foreground, *cyan*))))
    `(quack-pltish-defn-face ((t (:bold t :foreground, *blue* :weight bold))))
    `(quack-pltish-keyword-face ((t (:bold t :weight bold))))
    `(quack-pltish-module-defn-face ((t (:bold t :weight bold :foreground, *purple*))))
    `(quack-pltish-paren-face ((t (:foreground, *red*))))
    `(quack-pltish-selfeval-face ((t (:foreground, *green*))))
    `(quack-smallprint-face ((t (:height 0.8))))
    `(quack-threesemi-h1-face ((t (:bold t :weight bold :height 1.4))))
    `(quack-threesemi-h2-face ((t (:bold t :weight bold :height 1.2))))
    `(quack-threesemi-h3-face ((t (:bold t :weight bold))))
    `(quack-threesemi-semi-face ((t (:background, *cyan* :foreground, *cyan*))))
    `(quack-threesemi-text-face ((t (:background, *cyan* :foreground, *cyan*))))
    `(region ((t (:background, *mouse-color*))))
    `(sh-quoted-exec ((t (:foreground, *purple*))))
    `(sp-show-pair-match-face ((t (:inherit `region :bold t))))
    `(sp-show-pair-mismatch-face ((t (:background, *lightgrey* :bold t :foreground, *red*))))
    `(trailing-whitespace ((t (:background, *red*))))
    `(writegood-duplicates-face ((t (:inherit `default :underline t))))
    `(writegood-passive-voice-face ((t (:inherit `writegood-duplicates-face))))
    `(writegood-weasels-face ((t (:inherit `writegood-duplicates-face))))
))

(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'yosemite)
