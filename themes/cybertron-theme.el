;;; cybertron-theme.el --- Cybertron Colour Theme

;; Copyright 2013, Benjamin Slade

;; Author: Benjamin Slade <slade@jnanam.net>
;; Keywords: color theme cybertron
;; Version: 0.9

;; Based on the cyberpunk theme by Nicholas M. Van Horn <vanhorn.nm@gmail.com>

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.
;;

;;; Commentary:

;; This theme is a port of the overtone/emacs-live theme of the same name
;; (https://github.com/overtone/emacs-live). The original theme was
;; designed for use with the color-theme package. This theme adopts the
;; new built-in theme support deftheme. Additionally, this
;; theme strives to offer as many mode-specific customizations as
;; possible, with further tweaks that suit my fancy.

(deftheme cybertron "The Cybertron colour theme")

(let ((class '((class color) (min-colors 89)))
      ;; Cybertron palette
      (cybertron-fg "#dcdccc")
      (cybertron-bg-1 "#2b2b2b")
      (cybertron-bg-05 "#383838")
      (cybertron-bg "#000000")
      (cybertron-bg+1 "#4f4f4f")
      (cybertron-bg+2 "#5f5f5f")
      (cybertron-bg+3 "#6f6f6f")
      (cybertron-red+1 "#dca3a3")
      (cybertron-red "#ff0000")
      (cybertron-red-1 "#DF740C")
      (cybertron-red-2 "#DF740C")
      (cybertron-red-3 "#9c6363")
      (cybertron-red-4 "#8c5353")
      (cybertron-red-5 "#7F073F")
      (cybertron-red-6 "#ff4040")
      (cybertron-pink "#ff69b4")
      (cybertron-pink-1 "#ff1493")
      (cybertron-pink-2 "#cd1076")
      (cybertron-orange-2 "#FF6400")
      (cybertron-orange-1 "#ff8c00") ;; DarkOrange
      (cybertron-orange "#ffa500")
      (cybertron-yellow "#ffff00")
      (cybertron-yellow-1 "#FBDE2D") ; recogniser yellow
      (cybertron-yellow-2 "#d0bf8f")
      (cybertron-yellow-3 "#D8FA3C")
      (cybertron-yellow-4 "#E9C062")
      (cybertron-yellow-5 "#FFE64D")
      (cybertron-gold-1 "#33331A")
      (cybertron-green-2 "#006400")
      (cybertron-green-1 "#2e8b57")
      (cybertron-green "#00ff00")
      (cybertron-green+1 "#61CE3C")
      (cybertron-green+2 "#9fc59f")
      (cybertron-green+3 "#afd8af")
      (cybertron-green+4 "#bfebbf")
      (cybertron-cyan "#93e0e3")
      (cybertron-blue+1 "#94bff3")
      (cybertron-blue "#3C65F9")    ;; blue
      (cybertron-blue-1 "#7b68ee")  ;; medium slate blue
      (cybertron-blue-2 "#6a5acd")  ;; slate blue
      (cybertron-blue-3 "#add8e6")  ;; light blue
      (cybertron-blue-4 "#b2dfee")  ;; LightBlue2
      (cybertron-blue-5 "#4c83ff")
      (cybertron-blue-6 "#96CBFE")
      (cybertron-blue-7 "#00ffff")
      (cybertron-magenta "#dc8cc3")
      (cybertron-black "#000000")
      (cybertron-black-2 "#0C1021")
      (cybertron-black-3 "#0A0A0A")
      (cybertron-grey "#d3d3d3")
      (cybertron-grey-2 "#8B8989")
      (cybertron-grey-3 "#919191")
      (cybertron-grey-4 "#999999")
      (cybertron-grey-5 "#333333")
      (cybertron-grey-6 "#1A1A1A")
      (cybertron-grey-7 "#4D4D4D")
      (cybertron-grey-8 "#262626")
      (cybertron-white "#ffffff")
      (cybertron-white-2 "#F8F8F8")
      (cybertron-white-3 "#fffafa")
      (cybertron-text "#9AD5E9"))

 (custom-theme-set-faces
  'cybertron
   '(button ((t (:underline t))))
   `(link ((,class (:foreground ,cybertron-yellow :underline t :weight bold))))
   `(link-visited ((,class (:foreground ,cybertron-yellow-2 :underline t :weight normal))))
   `(blue ((,class (:foreground ,cybertron-blue))))
   `(italic ((,class (:slant italic))))
   `(bold ((,class (:bold t))))
   `(bold-italic ((,class (:bold t))))
   `(border-glyph ((,class (nil))))
   `(buffers-tab ((,class (:background ,cybertron-black-2 :foreground ,cybertron-white-2))))

   ;;; basic coloring
 ;;  `(default ((,class (:foreground ,cybertron-grey :background ,cybertron-black))))
 ;;  `(cursor ((,class (:foreground ,cybertron-fg))))
 ;;  `(escape-glyph-face ((,class (:foreground ,cybertron-red))))

 ;;  `(header-line ((,class (:foreground ,cybertron-yellow
 ;;                                      :background ,cybertron-bg-1
 ;;                                      :box (:line-width -1 :style released-button)))))
 ;;  `(highlight ((,class (:background ,cybertron-grey-5))))
   '(bold ((t (:foreground "#FBDE2D" :weight bold))))
 '(bold-italic ((t (:inherit bold :slant italic))))
 '(cursor ((t (:background "#99CCFF"))))
 '(default ((t (:background "#000000" :foreground "#9AD5E9"))))
 '(fringe ((t (:background "#000000" :foreground "#9AD5E9"))))
 '(header-line ((t (:inherit mode-line))))
 '(linum ((t (:inherit default))))
 '(mouse ((t (:foreground "#e0c625"))))
; '(region ((t (:background "#e0c625" :foreground "#000000"))))


   ;;; compilation
   `(compilation-column-face ((,class (:foreground ,cybertron-yellow))))
   `(compilation-enter-directory-face ((,class (:foreground ,cybertron-green))))
   `(compilation-error-face ((,class (:foreground ,cybertron-red-1 :weight bold :underline t))))
   `(compilation-face ((,class (:foreground ,cybertron-fg))))
   `(compilation-info-face ((,class (:foreground ,cybertron-blue))))
   `(compilation-info ((,class (:foreground ,cybertron-green+4 :underline t))))
   `(compilation-leave-directory-face ((,class (:foreground ,cybertron-green))))
   `(compilation-line-face ((,class (:foreground ,cybertron-yellow))))
   `(compilation-line-number ((,class (:foreground ,cybertron-yellow))))
   `(compilation-message-face ((,class (:foreground ,cybertron-blue))))
   `(compilation-warning-face ((,class (:foreground ,cybertron-yellow-1 :weight bold :underline t))))

   ;;; grep
   `(grep-context-face ((,class (:foreground ,cybertron-black :background ,cybertron-pink-1))))
   `(grep-error-face ((,class (:foreground ,cybertron-red :weight bold :underline t))))
   `(grep-hit-face ((,class (:foreground ,cybertron-black :background ,cybertron-red))))
   `(grep-match-face ((,class (:foreground ,cybertron-black :background ,cybertron-pink-1))))
   `(match ((,class (:background ,cybertron-black :foreground ,cybertron-pink-1))))

   ;;; multiple-cursors
    `(mc/cursor-face ((,class (:inverse-video nil, :background ,cybertron-pink :foreground ,cybertron-black))))


   ;; faces used by isearch
   `(isearch ((,class (:foreground ,cybertron-black :background ,cybertron-yellow))))
   `(isearch-fail ((,class (:background ,cybertron-red-6))))

   `(lazy-highlight ((,class (:foreground ,cybertron-black :background ,cybertron-red-2))))
   `(query-replace ((,class (:background ,cybertron-grey-5))))
   `(Highline-face ((,class (:background ,cybertron-green-1))))
   `(italic ((,class (nil))))
   `(left-margin ((,class (nil))))
   `(toolbar ((,class (nil))))
   `(underline ((,class (:underline nil))))
   `(text-cursor ((,class (:background ,cybertron-yellow :foreground ,cybertron-black))))

   `(menu ((,class (:foreground ,cybertron-fg :background ,cybertron-bg))))
   `(minibuffer-prompt ((,class (:foreground ,cybertron-green+1 :background ,cybertron-black))))
   `(mode-line
     ((,class (:foreground ,cybertron-blue-5
                           :background ,cybertron-grey-5
                           :box (:line-width -1 :color ,cybertron-blue-5)))))
   ;; `(mode-line-buffer-id ((,class (:foreground ,cybertron-yellow :weight bold))))
   `(mode-line-inactive
     ((,class (:foreground ,cybertron-grey-7
                           :background ,cybertron-grey-6
                           :box (:line-width -1 :color ,cybertron-blue-5)))))
   `(region ((,class (:foreground ,cybertron-black :background ,cybertron-yellow-5))))
   `(secondary-selection ((,class (:background ,cybertron-bg+2))))
   `(trailing-whitespace ((,class (:background ,cybertron-red))))
   `(vertical-border ((,class (:foreground ,cybertron-grey-5 :background ,cybertron-black))))

   ;;; font lock
   `(font-lock-builtin-face ((,class (:foreground ,cybertron-orange-2))))
   `(font-lock-comment-face ((,class (:foreground ,cybertron-grey-2 :italic t))))
   ;; `(font-lock-comment-delimiter-face ((,class (:foreground ,cybertron-green))))
   `(font-lock-constant-face ((,class (:foreground ,cybertron-blue-5))))
   ;; `(font-lock-doc-face ((,class (:foreground ,cybertron-green+1))))
   `(font-lock-doc-string-face ((,class (:foreground ,cybertron-orange-1))))
   `(font-lock-function-name-face ((,class (:foreground ,cybertron-pink-1))))
   `(font-lock-keyword-face ((,class (:foreground ,cybertron-yellow-1))))
   ;; `(font-lock-negation-char-face ((,class (:foreground ,cybertron-fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,cybertron-grey-3))))
   `(font-lock-string-face ((,class (:foreground ,cybertron-green+1))))
   `(font-lock-type-face ((,class (:foreground ,cybertron-yellow-3))))
   `(font-lock-variable-name-face ((,class (:foreground ,cybertron-yellow-3))))
   `(font-lock-warning-face ((,class (:foreground ,cybertron-pink))))
   `(font-lock-reference-face ((,class (:foreground ,cybertron-grey))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,cybertron-yellow-4))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,cybertron-red))))


   `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

   `(gui-element ((,class (:background ,cybertron-grey-5 :foreground ,cybertron-blue-6))))



   ;;; newsticker
   ;; These are currently placeholders that probably look terrible.
   ;; Someone who uses newsticker is welcome to change these
   `(newsticker-date-face ((,class (:foreground ,cybertron-fg))))
   `(newsticker-default-face ((,class (:foreground ,cybertron-fg))))
   `(newsticker-enclosure-face ((,class (:foreground ,cybertron-green+3))))
   `(newsticker-extra-face ((,class (:foreground ,cybertron-bg+2 :height 0.8))))
   `(newsticker-feed-face ((,class (:foreground ,cybertron-fg))))
   `(newsticker-immortal-item-face ((,class (:foreground ,cybertron-green))))
   `(newsticker-new-item-face ((,class (:foreground ,cybertron-blue))))
   `(newsticker-obsolete-item-face ((,class (:foreground ,cybertron-red))))
   `(newsticker-old-item-face ((,class (:foreground ,cybertron-bg+3))))
   `(newsticker-statistics-face ((,class (:foreground ,cybertron-fg))))
   `(newsticker-treeview-face ((,class (:foreground ,cybertron-fg))))
   `(newsticker-treeview-immortal-face ((,class (:foreground ,cybertron-green))))
   `(newsticker-treeview-listwindow-face ((,class (:foreground ,cybertron-fg))))
   `(newsticker-treeview-new-face ((,class (:foreground ,cybertron-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((,class (:foreground ,cybertron-red))))
   `(newsticker-treeview-old-face ((,class (:foreground ,cybertron-bg+3))))
   `(newsticker-treeview-selection-face ((,class (:foreground ,cybertron-yellow))))

   ;;; external

   ;; full-ack
   `(ack-separator ((,class (:foreground ,cybertron-fg))))
   `(ack-file ((,class (:foreground ,cybertron-blue))))
   `(ack-line ((,class (:foreground ,cybertron-yellow))))
   `(ack-match ((,class (:foreground ,cybertron-orange :background ,cybertron-bg-1 :weigth bold))))

   ;; auctex
   `(font-latex-bold ((,class (:inherit bold))))
   `(font-latex-warning ((,class (:inherit font-lock-warning))))
   `(font-latex-sedate ((,class (:foreground ,cybertron-yellow :weight bold))))
   `(font-latex-string ((,class (:foreground ,cybertron-green))))
   `(font-latex-title-4 ((,class (:inherit variable-pitch :weight bold))))
   `(font-latex-sectioning-0 ((,class (:foreground ,cybertron-blue :background ,cybertron-black :scale 1.5))))
   `(font-latex-sectioning-1 ((,class (:foreground ,cybertron-blue :background ,cybertron-black :scale 1.5))))

   ;; auto-complete
   `(ac-completion-face ((,class (:background ,cybertron-grey-2 :underline t))))
   `(ac-candidate-face ((,class (:background ,cybertron-grey-4 :foreground ,cybertron-black))))
   `(ac-selection-face ((,class (:background ,cybertron-pink-1 :foreground ,cybertron-black))))
   `(popup-tip-face ((,class (:background ,cybertron-grey-5 :foreground ,cybertron-white))))
   `(popup-scroll-bar-foreground-face ((,class (:background ,cybertron-black-3))))
   `(popup-scroll-bar-background-face ((,class (:background ,cybertron-grey-5))))
   `(popup-isearch-match ((,class (:background ,cybertron-black :foreground ,cybertron-pink-1))))

   `(window-number-face ((,class (:background ,cybertron-grey-6 :foreground ,cybertron-blue-5))))

  ;; company-mode
   `(company-tooltip ((,class (:background ,cybertron-black :foreground ,cybertron-yellow))))
   `(company-tooltip-common ((,class (:inherit company-tooltip :foreground ,cybertron-blue-1))))
   `(company-tooltip-common-selection ((,class (:inherit company-tooltip-selection :foreground ,cybertron-black))))
   `(company-tooltip-selection ((,class (:foreground ,cybertron-red :background ,cybertron-yellow))))
   `(company-tooltip-annotation ((,class (:foreground ,cybertron-grey-3))))
   `(company-scrollbar-fg ((,class (:background ,cybertron-grey-5))))
   `(company-scrollbar-bg ((,class (:background ,cybertron-black-3))))
   `(company-preview ((,class (:foreground ,cybertron-grey :background ,cybertron-yellow))))

   ;; diff
   `(diff-added ((,class (:foreground ,cybertron-green))))
   `(diff-changed ((,class (:foreground ,cybertron-yellow))))
   `(diff-removed ((,class (:foreground ,cybertron-red))))
   `(diff-header ((,class (:background ,cybertron-bg+2))))
   `(diff-file-header ((,class (:background ,cybertron-bg+2 :foreground ,cybertron-fg :bold t))))

   ;; ert
   `(ert-test-result-expected ((,class (:foreground ,cybertron-green+4 :background ,cybertron-bg))))
   `(ert-test-result-unexpected ((,class (:foreground ,cybertron-red :background ,cybertron-bg))))

   ;; eshell
   `(eshell-prompt ((,class (:foreground ,cybertron-yellow :weight bold))))
   `(eshell-ls-archive ((,class (:foreground ,cybertron-red-1 :weight bold))))
   `(eshell-ls-backup ((,class (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((,class (:inherit font-lock-comment))))
   `(eshell-ls-directory ((,class (:foreground ,cybertron-blue+1 :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,cybertron-red+1 :weight bold))))
   `(eshell-ls-unreadable ((,class (:foreground ,cybertron-fg))))
   `(eshell-ls-missing ((,class (:inherit font-lock-warning))))
   `(eshell-ls-product ((,class (:inherit font-lock-doc))))
   `(eshell-ls-special ((,class (:foreground ,cybertron-yellow :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,cybertron-cyan :weight bold))))

   ;; flymake
   `(flymake-errline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,cybertron-red-1) :inherit unspecified
                   :foreground unspecified :background unspecified))
      (,class (:foreground ,cybertron-red-5 :background ,cybertron-pink :weight bold :underline t))))
   `(flymake-infoline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,cybertron-green-1) :inherit unspecified
                   :foreground unspecified :background unspecified))
      (,class (:foreground ,cybertron-green :background ,cybertron-green+4))))
   `(flymake-warnline
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,cybertron-yellow-1) :inherit unspecified
                   :foreground unspecified :background unspecified))
      (,class (:foreground ,cybertron-orange-1 :background ,cybertron-yellow-1 :weight bold :underline t))))

     ;; flycheck
     `(flycheck-error
       ((,(append '((supports :underline (:style wave))) class)
         (:underline (:style wave :color ,cybertron-red-1) :inherit unspecified))
        (,class (:foreground ,cybertron-red-5 :background ,cybertron-pink :weight bold :underline t))))
     `(flycheck-warning
       ((,(append '((supports :underline (:style wave))) class)
         (:underline (:style wave :color ,cybertron-yellow-1) :inherit unspecified))
        (,class (:foreground ,cybertron-orange-1 :background ,cybertron-yellow-1 :weight bold :underline t))))
     `(flycheck-fringe-error
       ((,class (:foreground ,cybertron-red-5 :background ,cybertron-pink :weight bold))))
     `(flycheck-fringe-warning
       ((,class (:foreground ,cybertron-orange-1 :background ,cybertron-yellow-1 :weight bold))))

   ;; flyspell
   `(flyspell-duplicate
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,cybertron-yellow-1)))
      (,class (:foreground ,cybertron-yellow-1 :weight bold :underline t))))
   `(flyspell-incorrect
     ((,(append '((supports :underline (:style wave))) class)
       (:underline (:style wave :color ,cybertron-orange-2)))
      (,class (:foreground ,cybertron-orange-2 :weight bold :underline t))))

   ;; erc
   `(erc-action-face ((,class (:inherit erc-default-face))))
   `(erc-bold-face ((,class (:weight bold))))
   `(erc-current-nick-face ((,class (:foreground ,cybertron-blue :weight bold))))
   `(erc-dangerous-host-face ((,class (:inherit font-lock-warning))))
   `(erc-default-face ((,class (:foreground ,cybertron-fg))))
   `(erc-direct-msg-face ((,class (:inherit erc-default))))
   `(erc-error-face ((,class (:inherit font-lock-warning))))
   `(erc-fool-face ((,class (:inherit erc-default))))
   `(erc-highlight-face ((,class (:inherit hover-highlight))))
   `(erc-input-face ((,class (:foreground ,cybertron-yellow))))
   `(erc-keyword-face ((,class (:foreground ,cybertron-blue :weight bold))))
   `(erc-nick-default-face ((,class (:foreground ,cybertron-yellow :weight bold))))
   `(erc-my-nick-face ((,class (:foreground ,cybertron-red :weigth bold))))
   `(erc-nick-msg-face ((,class (:inherit erc-default))))
   `(erc-notice-face ((,class (:foreground ,cybertron-green))))
   `(erc-pal-face ((,class (:foreground ,cybertron-orange :weight bold))))
   `(erc-prompt-face ((,class (:foreground ,cybertron-orange :background ,cybertron-bg :weight bold))))
   `(erc-timestamp-face ((,class (:foreground ,cybertron-green+1))))
   `(erc-underline-face ((t (:underline t))))

   ;; gnus
   `(gnus-group-mail-1 ((,class (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((,class (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((,class (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((,class (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((,class (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((,class (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((,class (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((,class (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((,class (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((,class (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((,class (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((,class (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((,class (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((,class (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((,class (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((,class (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((,class (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((,class (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((,class (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((,class (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((,class (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((,class (:inherit message-header-other))))
   `(gnus-header-from ((,class (:inherit message-header-from))))
   `(gnus-header-name ((,class (:inherit message-header-name))))
   `(gnus-header-newsgroups ((,class (:inherit message-header-other))))
   `(gnus-header-subject ((,class (:inherit message-header-subject))))
   `(gnus-summary-cancelled ((,class (:foreground ,cybertron-orange))))
   `(gnus-summary-high-ancient ((,class (:foreground ,cybertron-blue))))
   `(gnus-summary-high-read ((,class (:foreground ,cybertron-green :weight bold))))
   `(gnus-summary-high-ticked ((,class (:foreground ,cybertron-orange :weight bold))))
   `(gnus-summary-high-unread ((,class (:foreground ,cybertron-fg :weight bold))))
   `(gnus-summary-low-ancient ((,class (:foreground ,cybertron-blue))))
   `(gnus-summary-low-read ((t (:foreground ,cybertron-green))))
   `(gnus-summary-low-ticked ((,class (:foreground ,cybertron-orange :weight bold))))
   `(gnus-summary-low-unread ((,class (:foreground ,cybertron-fg))))
   `(gnus-summary-normal-ancient ((,class (:foreground ,cybertron-blue+1))))
   `(gnus-summary-normal-read ((,class (:foreground ,cybertron-green))))
   `(gnus-summary-normal-ticked ((,class (:foreground ,cybertron-orange :weight bold))))
   `(gnus-summary-normal-unread ((,class (:foreground ,cybertron-fg))))
   `(gnus-summary-selected ((,class (:foreground ,cybertron-yellow :weight bold))))
   `(gnus-cite-1 ((,class (:foreground ,cybertron-yellow-2))))
   `(gnus-cite-10 ((,class (:foreground ,cybertron-yellow-1))))
   `(gnus-cite-11 ((,class (:foreground ,cybertron-yellow))))
   `(gnus-cite-2 ((,class (:foreground ,cybertron-blue-1))))
   `(gnus-cite-3 ((,class (:foreground ,cybertron-blue-2))))
   `(gnus-cite-4 ((,class (:foreground ,cybertron-green+2))))
   `(gnus-cite-5 ((,class (:foreground ,cybertron-green+1))))
   `(gnus-cite-6 ((,class (:foreground ,cybertron-green))))
   `(gnus-cite-7 ((,class (:foreground ,cybertron-red))))
   `(gnus-cite-8 ((,class (:foreground ,cybertron-red-1))))
   `(gnus-cite-9 ((,class (:foreground ,cybertron-red-2))))
   `(gnus-group-news-1-empty ((,class (:foreground ,cybertron-yellow))))
   `(gnus-group-news-2-empty ((,class (:foreground ,cybertron-green+3))))
   `(gnus-group-news-3-empty ((,class (:foreground ,cybertron-green+1))))
   `(gnus-group-news-4-empty ((,class (:foreground ,cybertron-blue-2))))
   `(gnus-group-news-5-empty ((,class (:foreground ,cybertron-blue-3))))
   `(gnus-group-news-6-empty ((,class (:foreground ,cybertron-bg+2))))
   `(gnus-group-news-low-empty ((,class (:foreground ,cybertron-bg+2))))
   `(gnus-signature ((,class (:foreground ,cybertron-yellow))))
   `(gnus-x ((,class (:background ,cybertron-fg :foreground ,cybertron-bg))))

   ;; helm
   `(helm-header
     ((,class (:foreground ,cybertron-green
                           :background ,cybertron-bg
                           :underline nil
                           :box nil))))
   `(helm-source-header
     ((,class (:foreground ,cybertron-yellow
                           :background ,cybertron-bg-1
                           :underline nil
                           :weight bold
                           :box (:line-width -1 :style released-button)))))
   `(helm-selection ((,class (:background ,cybertron-bg+1 :underline nil))))
   `(helm-selection-line ((,class (:background ,cybertron-bg+1))))
   `(helm-visible-mark ((,class (:foreground ,cybertron-bg :background ,cybertron-yellow-2))))
   `(helm-candidate-number ((,class (:foreground ,cybertron-green+4 :background ,cybertron-bg-1))))

   ;; hl-line-mode
   `(hl-sexp-face ((,class (:background ,cybertron-grey-5))))
   `(hl-line-face ((,class (:background ,cybertron-grey-5))))

   ;; ido-mode
   `(ido-first-match ((,class (:foreground ,cybertron-pink-1 :background ,cybertron-black))))
   `(ido-only-match ((,class (:foreground ,cybertron-pink-1 :background ,cybertron-black))))
   `(ido-subdir ((,class (:foreground ,cybertron-grey-4 :backgroun ,cybertron-black))))
   `(ido-indicator ((,class (:foreground ,cybertron-black :background ,cybertron-pink-1))))

   ;; js2-mode
   `(js2-warning-face ((,class (:underline ,cybertron-orange))))
   `(js2-error-face ((,class (:foreground ,cybertron-red :weight bold))))
   `(js2-jsdoc-tag-face ((,class (:foreground ,cybertron-green-1))))
   `(js2-jsdoc-type-face ((,class (:foreground ,cybertron-green+2))))
   `(js2-jsdoc-value-face ((,class (:foreground ,cybertron-green+3))))
   `(js2-function-param-face ((,class (:foreground, cybertron-green+3))))
   `(js2-external-variable-face ((,class (:foreground ,cybertron-orange))))

   ;; jabber-mode
   `(jabber-roster-user-away ((,class (:foreground ,cybertron-green+2))))
   `(jabber-roster-user-online ((,class (:foreground ,cybertron-blue-1))))
   `(jabber-roster-user-dnd ((,class (:foreground ,cybertron-red+1))))
   `(jabber-rare-time-face ((,class (:foreground ,cybertron-green+1))))
   `(jabber-chat-prompt-local ((,class (:foreground ,cybertron-blue-1))))
   `(jabber-chat-prompt-foreign ((,class (:foreground ,cybertron-red+1))))
   `(jabber-activity-face((,class (:foreground ,cybertron-red+1))))
   `(jabber-activity-personal-face ((,class (:foreground ,cybertron-blue+1))))
   `(jabber-title-small ((,class (:height 1.1 :weight bold))))
   `(jabber-title-medium ((,class (:height 1.2 :weight bold))))
   `(jabber-title-large ((,class (:height 1.3 :weight bold))))

   ;; linum-mode
   `(linum ((,class (:foreground ,cybertron-green+2 :background ,cybertron-bg))))

   ;; magit
   `(magit-section-title ((,class (:foreground ,cybertron-pink-1))))
   `(magit-branch ((,class (:foreground ,cybertron-yellow-5))))
   `(magit-item-highlight ((,class (:background ,cybertron-grey-8))))
   `(magit-diff-add ((,class (:foreground ,cybertron-green))))
   `(magit-diff-del ((,class (:foreground ,cybertron-red))))
   `(magit-diff-hunk-header ((,class (:foreground ,cybertron-orange))))

   `(eval-sexp-fu-flash ((,class (:background ,cybertron-grey-8 :foreground ,cybertron-pink-2))))

   ;; message-mode
   `(message-cited-text ((,class (:inherit font-lock-comment))))
   `(message-header-name ((,class (:foreground ,cybertron-blue-5))))
   `(message-header-other ((,class (:foreground ,cybertron-green))))
   `(message-header-to ((,class (:foreground ,cybertron-pink-1 :weight bold))))
   `(message-header-from ((,class (:foreground ,cybertron-yellow :weight bold))))
   `(message-header-cc ((,class (:foreground ,cybertron-yellow :weight bold))))
   `(message-header-newsgroups ((,class (:foreground ,cybertron-yellow :weight bold))))
   `(message-header-subject ((,class (:foreground ,cybertron-orange :weight bold))))
   `(message-header-xheader ((,class (:foreground ,cybertron-green))))
   `(message-mml ((,class (:foreground ,cybertron-yellow :weight bold))))
   `(message-separator ((,class (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((,class (:foreground ,cybertron-orange))))
   `(mew-face-header-from ((,class (:foreground ,cybertron-yellow))))
   `(mew-face-header-date ((,class (:foreground ,cybertron-green))))
   `(mew-face-header-to ((,class (:foreground ,cybertron-red))))
   `(mew-face-header-key ((,class (:foreground ,cybertron-green))))
   `(mew-face-header-private ((,class (:foreground ,cybertron-green))))
   `(mew-face-header-important ((,class (:foreground ,cybertron-blue))))
   `(mew-face-header-marginal ((,class (:foreground ,cybertron-fg :weight bold))))
   `(mew-face-header-warning ((,class (:foreground ,cybertron-red))))
   `(mew-face-header-xmew ((,class (:foreground ,cybertron-green))))
   `(mew-face-header-xmew-bad ((,class (:foreground ,cybertron-red))))
   `(mew-face-body-url ((,class (:foreground ,cybertron-orange))))
   `(mew-face-body-comment ((,class (:foreground ,cybertron-fg :slant italic))))
   `(mew-face-body-cite1 ((,class (:foreground ,cybertron-green))))
   `(mew-face-body-cite2 ((,class (:foreground ,cybertron-blue))))
   `(mew-face-body-cite3 ((,class (:foreground ,cybertron-orange))))
   `(mew-face-body-cite4 ((,class (:foreground ,cybertron-yellow))))
   `(mew-face-body-cite5 ((,class (:foreground ,cybertron-red))))
   `(mew-face-mark-review ((,class (:foreground ,cybertron-blue))))
   `(mew-face-mark-escape ((,class (:foreground ,cybertron-green))))
   `(mew-face-mark-delete ((,class (:foreground ,cybertron-red))))
   `(mew-face-mark-unlink ((,class (:foreground ,cybertron-yellow))))
   `(mew-face-mark-refile ((,class (:foreground ,cybertron-green))))
   `(mew-face-mark-unread ((,class (:foreground ,cybertron-red-2))))
   `(mew-face-eof-message ((,class (:foreground ,cybertron-green))))
   `(mew-face-eof-part ((,class (:foreground ,cybertron-yellow))))

   ;; mic-paren
   `(paren-face-match ((,class (:foreground ,cybertron-cyan :background ,cybertron-bg :weight bold))))
   `(paren-face-mismatch ((,class (:foreground ,cybertron-bg :background ,cybertron-magenta :weight bold))))
   `(paren-face-no-match ((,class (:foreground ,cybertron-bg :background ,cybertron-red :weight bold))))

   ;; nav
   `(nav-face-heading ((,class (:foreground ,cybertron-yellow))))
   `(nav-face-button-num ((,class (:foreground ,cybertron-cyan))))
   `(nav-face-dir ((,class (:foreground ,cybertron-green))))
   `(nav-face-hdir ((,class (:foreground ,cybertron-red))))
   `(nav-face-file ((,class (:foreground ,cybertron-fg))))
   `(nav-face-hfile ((,class (:foreground ,cybertron-red-4))))

   ;; mumamo
   `(mumamo-background-chunk-major ((,class (:background ,cybertron-black))))
   `(mumamo-background-chunk-submode1 ((,class (:background ,cybertron-black))))
   `(mumamo-background-chunk-submode2 ((,class (:background ,cybertron-bg+2))))
   `(mumamo-background-chunk-submode3 ((,class (:background ,cybertron-bg+3))))
   `(mumamo-background-chunk-submode4 ((,class (:background ,cybertron-bg+1))))

   ;; org-mode
   `(org-document-title ((,class (:foreground ,cybertron-blue-3 :background ,cybertron-black :weight bold :height 1.5))))
   `(org-document-info ((,class (:foreground ,cybertron-blue-3 :background ,cybertron-black :weight bold))))
   `(org-document-info-keyword ((,class (:foreground ,cybertron-grey-2 :background ,cybertron-black))))
   `(org-agenda-date-today
     ((,class (:foreground ,cybertron-orange-2 :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((,class (:inherit font-lock-comment-face))))
   `(org-archived ((,class (:slant italic))))
   `(org-checkbox ((,class (:background ,cybertron-grey-2 :foreground ,cybertron-black
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((,class (:foreground ,cybertron-blue-7 :underline t))))
   `(org-done ((,class (:bold t :weight bold :foreground ,cybertron-green
                              :box (:line-width 1 :style none)))))
   `(org-todo ((,class (:bold t :foreground ,cybertron-orange :weight bold
                              :box (:line-width 1 :style none)))))
   `(org-level-1 ((,class (:foreground ,cybertron-pink-1 :height 1.3))))
   `(org-level-2 ((,class (:foreground ,cybertron-yellow :height 1.2))))
   `(org-level-3 ((,class (:foreground ,cybertron-blue-5 :height 1.1))))
   `(org-level-4 ((,class (:foreground ,cybertron-green))))
   `(org-level-5 ((,class (:foreground ,cybertron-orange))))
   `(org-level-6 ((,class (:foreground ,cybertron-pink))))
   `(org-level-7 ((,class (:foreground ,cybertron-green+3))))
   `(org-level-8 ((,class (:foreground ,cybertron-blue-1))))
   `(org-link ((,class (:foreground ,cybertron-blue-6 :underline t))))
   `(org-tag ((,class (:bold t :weight bold))))
   `(org-column ((,class (:background ,cybertron-gold-1 :foreground ,cybertron-black))))
   `(org-column-title ((,class (:background ,cybertron-bg-1 :underline t :weight bold))))
   `(org-block ((,class (:foreground ,cybertron-fg :background ,cybertron-bg-05))))
   `(org-block-begin-line
     ((,class (:foreground "#008ED1" :background ,cybertron-bg-1))))
   `(org-block-background ((,class (:background ,cybertron-bg-05))))
   `(org-block-end-line
     ((,class (:foreground "#008ED1" :background ,cybertron-bg-1))))

   ;; `(org-deadline-announce ((,class (:foreground ,cybertron-red-1))))
   ;; `(org-scheduled ((,class (:foreground ,cybertron-green+4))))
   ;; `(org-scheduled-previously ((,class (:foreground ,cybertron-red-4))))
   ;; `(org-scheduled-today ((,class (:foreground ,cybertron-blue+1))))
   ;; `(org-special-keyword ((,class (:foreground ,cybertron-yellow-1))))
   ;; `(org-table ((,class (:foreground ,cybertron-green+2))))
   ;; `(org-time-grid ((,class (:foreground ,cybertron-orange))))
   ;; `(org-upcoming-deadline ((,class (:inherit font-lock-keyword-face))))
   ;; `(org-warning ((,class (:bold t :foreground ,cybertron-red :weight bold :underline nil))))
   ;; `(org-formula ((,class (:foreground ,cybertron-yellow-2))))
   ;; `(org-headline-done ((,class (:foreground ,cybertron-green+3))))
   ;; `(org-hide ((,class (:foreground ,cybertron-bg-1))))

   ;; outline
   `(outline-8 ((,class (:inherit default))))
   `(outline-7 ((,class (:inherit outline-8 :height 1.0))))
   `(outline-6 ((,class (:inherit outline-7 :height 1.0))))
   `(outline-5 ((,class (:inherit outline-6 :height 1.0))))
   `(outline-4 ((,class (:inherit outline-5 :height 1.0))))
   `(outline-3 ((,class (:inherit outline-4 :height 1.0))))
   `(outline-2 ((,class (:inherit outline-3 :height 1.0))))
   `(outline-1 ((,class (:inherit outline-2 :height 1.0))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,cybertron-red-1))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,cybertron-green-2))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,cybertron-pink-1))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,cybertron-yellow))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,cybertron-green))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,cybertron-blue-3))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,cybertron-orange))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,cybertron-blue-2))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,cybertron-grey))))
   `(rainbow-delimiters-depth-10-face ((,class (:foreground ,cybertron-white))))
   `(rainbow-delimiters-depth-11-face ((,class (:foreground ,cybertron-blue+1))))
   `(rainbow-delimiters-depth-12-face ((,class (:foreground ,cybertron-red-4))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((,class (:foreground ,cybertron-green))))
   `(rpm-spec-doc-face ((,class (:foreground ,cybertron-green))))
   `(rpm-spec-ghost-face ((,class (:foreground ,cybertron-red))))
   `(rpm-spec-macro-face ((,class (:foreground ,cybertron-yellow))))
   `(rpm-spec-obsolete-tag-face ((,class (:foreground ,cybertron-red))))
   `(rpm-spec-package-face ((,class (:foreground ,cybertron-red))))
   `(rpm-spec-section-face ((,class (:foreground ,cybertron-yellow))))
   `(rpm-spec-tag-face ((,class (:foreground ,cybertron-blue))))
   `(rpm-spec-var-face ((,class (:foreground ,cybertron-red))))

   ;; rst-mode
   `(rst-level-1-face ((,class (:foreground ,cybertron-orange))))
   `(rst-level-2-face ((,class (:foreground ,cybertron-green+1))))
   `(rst-level-3-face ((,class (:foreground ,cybertron-blue-1))))
   `(rst-level-4-face ((,class (:foreground ,cybertron-yellow-2))))
   `(rst-level-5-face ((,class (:foreground ,cybertron-cyan))))
   `(rst-level-6-face ((,class (:foreground ,cybertron-green-1))))

   ;; show-paren
   `(show-paren-mismatch ((,class (:foreground ,cybertron-black :background ,cybertron-red-1))))
   `(show-paren-match ((,class (:foreground ,cybertron-black :background ,cybertron-yellow))))

   `(naeu-green-face ((,class (:foreground ,cybertron-green :background ,cybertron-black))))
   `(naeu-pink-face ((,class (:foreground ,cybertron-pink-1 :background ,cybertron-black))))
   `(naeu-blue-face ((,class (:foreground ,cybertron-blue-1 :background ,cybertron-black))))
   `(naeu-orange-face ((,class (:foreground ,cybertron-yellow-1 :background ,cybertron-black))))
   `(naeu-red-face ((,class (:foreground ,cybertron-orange :background ,cybertron-black))))
   `(naeu-grey-face ((,class (:foreground ,cybertron-grey-7 :background ,cybertron-black))))

   ;; SLIME
   `(slime-repl-inputed-output-face ((,class (:foreground ,cybertron-red))))

   ;; volatile-highlights
   `(vhl/default-face ((,class (:background ,cybertron-grey-5))))

   `(undo-tree-visualizer-active-branch-face ((,class (:foreground ,cybertron-pink-1 :background ,cybertron-black))))

   ;; whitespace-mode
   `(whitespace-space ((,class (:background ,cybertron-bg :foreground ,cybertron-bg+1))))
   `(whitespace-hspace ((,class (:background ,cybertron-bg :foreground ,cybertron-bg+1))))
   `(whitespace-tab ((,class (:background ,cybertron-bg :foreground ,cybertron-red))))
   `(whitespace-newline ((,class (:foreground ,cybertron-bg+1))))
   `(whitespace-trailing ((,class (:foreground ,cybertron-red :background ,cybertron-bg))))
   `(whitespace-line ((,class (:background ,cybertron-bg-05 :foreground ,cybertron-magenta))))
   `(whitespace-space-before-tab ((,class (:background ,cybertron-orange :foreground ,cybertron-orange))))
   `(whitespace-indentation ((,class (:background ,cybertron-yellow :foreground ,cybertron-red))))
   `(whitespace-empty ((,class (:background ,cybertron-yellow :foreground ,cybertron-red))))
   `(whitespace-space-after-tab ((,class (:background ,cybertron-yellow :foreground ,cybertron-red))))

   ;; wanderlust
   `(wl-highlight-folder-few-face ((,class (:foreground ,cybertron-red-2))))
   `(wl-highlight-folder-many-face ((,class (:foreground ,cybertron-red-1))))
   `(wl-highlight-folder-path-face ((,class (:foreground ,cybertron-orange))))
   `(wl-highlight-folder-unread-face ((,class (:foreground ,cybertron-blue))))
   `(wl-highlight-folder-zero-face ((,class (:foreground ,cybertron-fg))))
   `(wl-highlight-folder-unknown-face ((,class (:foreground ,cybertron-blue))))
   `(wl-highlight-message-citation-header ((,class (:foreground ,cybertron-red-1))))
   `(wl-highlight-message-cited-text-1 ((,class (:foreground ,cybertron-red))))
   `(wl-highlight-message-cited-text-2 ((,class (:foreground ,cybertron-green+2))))
   `(wl-highlight-message-cited-text-3 ((,class (:foreground ,cybertron-blue))))
   `(wl-highlight-message-cited-text-4 ((,class (:foreground ,cybertron-blue+1))))
   `(wl-highlight-message-header-contents-face ((,class (:foreground ,cybertron-green))))
   `(wl-highlight-message-headers-face ((,class (:foreground ,cybertron-red+1))))
   `(wl-highlight-message-important-header-contents ((,class (:foreground ,cybertron-green+2))))
   `(wl-highlight-message-header-contents ((,class (:foreground ,cybertron-green+1))))
   `(wl-highlight-message-important-header-contents2 ((,class (:foreground ,cybertron-green+2))))
   `(wl-highlight-message-signature ((,class (:foreground ,cybertron-green))))
   `(wl-highlight-message-unimportant-header-contents ((,class (:foreground ,cybertron-fg))))
   `(wl-highlight-summary-answered-face ((,class (:foreground ,cybertron-blue))))
   `(wl-highlight-summary-disposed-face ((,class (:foreground ,cybertron-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((,class (:foreground ,cybertron-blue))))
   `(wl-highlight-summary-normal-face ((,class (:foreground ,cybertron-fg))))
   `(wl-highlight-summary-thread-top-face ((,class (:foreground ,cybertron-yellow))))
   `(wl-highlight-thread-indent-face ((,class (:foreground ,cybertron-magenta))))
   `(wl-highlight-summary-refiled-face ((,class (:foreground ,cybertron-fg))))
   `(wl-highlight-summary-displaying-face ((,class (:underline t :weight bold))))

   ;; which-func-mode
   `(which-func ((,class (:foreground ,cybertron-green+4))))

   ;; yasnippet
   `(yas/field-highlight-face ((,class (:background ,cybertron-pink-1 :foreground ,cybertron-black))))

   ;; yascroll
   `(yascroll:thumb-text-area ((,class (:background ,cybertron-bg-1))))
   `(yascroll:thumb-fringe ((,class (:background ,cybertron-bg-1 :foreground ,cybertron-bg-1))))
   )

 ;; misc
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.1))))
 '(mu4e-flagged-face ((t (:inherit font-lock-function-name-face :foreground "#ff7552" :weight bold))))
 '(mu4e-replied-face ((t (:inherit font-lock-builtin-face :foreground "cornflower blue" :weight normal))))
 '(mu4e-unread-face ((t (:inherit font-lock-constant-face :foreground "green" :weight bold))))
 '(outline-4 ((t nil)))




;;;; NOT WORKING FOR SOME REASON
  ;;; custom theme variables
  (custom-theme-set-variables
   'cybertron
   `(ansi-color-names-vector [,cybertron-bg ,cybertron-red ,cybertron-green ,cybertron-yellow
                                          ,cybertron-blue ,cybertron-magenta ,cybertron-cyan ,cybertron-fg])

   ;; fill-column-indicator
   `(fci-rule-color ,cybertron-bg-05))

  ;;; colors for the ansi-term
  (eval-after-load 'term
    `(setq ansi-term-color-vector
         [term ,cybertron-bg ,cybertron-red ,cybertron-green ,cybertron-yellow
               ,cybertron-blue ,cybertron-magenta ,cybertron-cyan ,cybertron-fg])))




;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'cybertron)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; cybertron-theme.el ends here.
