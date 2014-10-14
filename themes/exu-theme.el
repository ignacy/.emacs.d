;;; ex.el

;; Fork of Zenburn theme with
;; Maintainer Jacek Wysocki <jacek.wysocki@gmail.com>


;; Original copyright of Zenburn theme below:

;; Copyright (C) 2011 Bozhidar Batsov

;; Author: Bozhidar Batsov <bozhidar.batsov@gmail.com>
;; URL: http://github.com/bbatsov/zenburn-emacs
;; Version: 1.7

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A port of the popular Vim theme Zenburn for Emacs 24, built on top
;; of the new built-in theme support in Emacs 24. There exists one
;; other version of the theme by Daniel Brockman. My version was
;; originally based on it, but it was in such a disarray, that I
;; decided to rewrite it from scratch in a more maintainable manner
;; (hopefully).
;;
;;; Installation:
;;
;; Drop the theme in a folder that is on `custom-theme-load-path' and
;; enjoy!
;;
;; Don't forget that the theme requires Emacs 24.
;;
;;; Bugs:
;;
;; None that I'm aware of.
;;
;;; Credits:
;;
;; Jani Nurminen created the original theme for vim on such this port
;; is based.

;;; Code:
(deftheme exu "Exu Zenburn Fork")

(let ((class '((class color) (min-colors 89)))
      ;; Exu palette
      ;; colors with +x are lighter, colors with -x are darker
      (exu-fg+2 "#efefef")
      (exu-fg+1 "#dfdfdf")
      (exu-fg "#cfcfcf")
      (exu-fg-1 "#b5b5b5")
      (exu-fg-2 "#a5a5a5")
      (exu-fg-3 "#9a9a9a")
      (exu-fg-4 "#7a7a7a")
      (exu-fg-5 "#5a5a5a")
      (exu-bg-1 "#0b0b0b")
      (exu-bg-05 "#181818")
      (exu-bg "#101010")
      (exu-bg+1 "#2f2f2f")
      (exu-bg+2 "#3f3f3f")
      (exu-bg+3 "#4f4f4f")
      (exu-red+1 "#dca3a3")
      (exu-red "#cc9393")
      (exu-red-1 "#bc8383")
      (exu-red-2 "#ac7373")
      (exu-red-3 "#9c6363")
      (exu-red-4 "#8c5353")
      (exu-red-5 "#7c3333")
      (exu-orange "#dfaf8f")
      (exu-yellow "#f0dfaf")
      (exu-yellow-1 "#e0cf9f")
      (exu-yellow-2 "#d0bf8f")
      (exu-green-2 "#3f5f3f")
      (exu-green-1 "#5f7f5f")
      (exu-green "#7f9f7f")
      (exu-green+1 "#8fb28f")
      (exu-green+2 "#9fc59f")
      (exu-green+3 "#afd8af")
      (exu-green+4 "#bfebbf")
      (exu-grayblue "#75c6c7")
      (exu-cyan "#93e0e3")
      (exu-blue+1 "#b0deff")
      (exu-blue "#a2d7fb")
      (exu-blue-1 "#9dd7ff")
      (exu-blue-2 "#5fbdff")
      (exu-blue-3 "#48b4ff")
      (exu-blue-4 "#259df1")
      (exu-blue-5 "#1383d2")
      (exu-purple-1 "#e2b1f4")
      (exu-purple-2 "#c382ff")
      (exu-purple-3 "#a84bff")
      (exu-magenta "#dc8cc3"))
  (custom-theme-set-faces
   'exu
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,exu-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,exu-yellow-2 :underline t :weight normal))))

   ;;; basic coloring
   `(default ((t (:foreground ,exu-fg :background ,exu-bg))))
   `(cursor ((t (:foreground ,exu-fg :background "white"))))
   `(escape-glyph-face ((t (:foreground ,exu-red))))
   `(fringe ((t (:foreground ,exu-fg-3 :background ,exu-bg))))
   `(header-line ((t (:foreground ,exu-yellow
                                  :background ,exu-bg-1
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background ,exu-bg-05))))

   ;;; compilation
   `(compilation-column-face ((t (:foreground ,exu-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,exu-green))))
   `(compilation-error-face ((t (:foreground ,exu-red-1 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,exu-fg))))
   `(compilation-info-face ((t (:foreground ,exu-blue))))
   `(compilation-info ((t (:foreground ,exu-green+4 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,exu-green))))
   `(compilation-line-face ((t (:foreground ,exu-yellow))))
   `(compilation-line-number ((t (:foreground ,exu-yellow))))
   `(compilation-message-face ((t (:foreground ,exu-blue))))
   `(compilation-warning-face ((t (:foreground ,exu-orange :weight bold :underline t))))

   ;;; grep
   `(grep-context-face ((t (:foreground ,exu-fg))))
   `(grep-error-face ((t (:foreground ,exu-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,exu-blue))))
   `(grep-match-face ((t (:foreground ,exu-orange :weight bold))))
   `(match ((t (:background ,exu-bg-1 :foreground ,exu-orange :weight bold))))

   ;; faces used by isearch
   `(isearch ((t (:foreground ,exu-yellow :background ,exu-bg-1))))
   `(isearch-fail ((t (:foreground ,exu-fg :background ,exu-red-4))))
   `(lazy-highlight ((t (:foreground ,exu-yellow :background ,exu-bg+2))))

   `(menu ((t (:foreground ,exu-fg :background ,exu-bg))))
   `(minibuffer-prompt ((t (:foreground ,exu-yellow))))
   `(mode-line
     ((,class (:foreground ,exu-purple-2
                           :background ,exu-bg-1
                           :box (:line-width -1 :style released-button)))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,exu-yellow :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,exu-fg-3
                      :background ,exu-bg-05
                      :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,exu-bg+3))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,exu-bg+3))))
   `(trailing-whitespace ((t (:background ,exu-red))))
   `(vertical-border ((t (:foreground ,exu-fg-5))))

   ;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,exu-cyan))))
   `(font-lock-comment-face ((t (:foreground ,exu-green-1))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,exu-green-1))))
   `(font-lock-constant-face ((t (:foreground ,exu-blue+1))))
   `(font-lock-doc-face ((t (:foreground ,exu-green+1))))
   `(font-lock-doc-string-face ((t (:foreground ,exu-blue-2))))
   `(font-lock-function-name-face ((t (:foreground ,exu-blue))))
   `(font-lock-keyword-face ((t (:foreground ,exu-yellow :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,exu-fg))))
   `(font-lock-preprocessor-face ((t (:foreground ,exu-blue+1))))
   `(font-lock-string-face ((t (:foreground ,exu-fg-2))))
   `(font-lock-type-face ((t (:foreground ,exu-blue-1))))
   `(font-lock-variable-name-face ((t (:foreground ,exu-purple-1))))
   `(font-lock-warning-face ((t (:foreground ,exu-yellow-2 :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))

   ;;; newsticker
   `(newsticker-date-face ((t (:foreground ,exu-fg))))
   `(newsticker-default-face ((t (:foreground ,exu-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,exu-green+3))))
   `(newsticker-extra-face ((t (:foreground ,exu-bg+2 :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,exu-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,exu-green))))
   `(newsticker-new-item-face ((t (:foreground ,exu-blue))))
   `(newsticker-obsolete-item-face ((t (:foreground ,exu-red))))
   `(newsticker-old-item-face ((t (:foreground ,exu-bg+3))))
   `(newsticker-statistics-face ((t (:foreground ,exu-fg))))
   `(newsticker-treeview-face ((t (:foreground ,exu-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,exu-green))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,exu-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,exu-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,exu-red))))
   `(newsticker-treeview-old-face ((t (:foreground ,exu-bg+3))))
   `(newsticker-treeview-selection-face ((t (:foreground ,exu-yellow))))

   ;;; external

   ;; full-ack
   `(ack-separator ((t (:foreground ,exu-fg))))
   `(ack-file ((t (:foreground ,exu-blue))))
   `(ack-line ((t (:foreground ,exu-yellow))))
   `(ack-match ((t (:foreground ,exu-orange :background ,exu-bg-1 :weight bold))))

   ;; auctex
   `(font-latex-bold ((t (:inherit bold))))
   `(font-latex-warning ((t (:inherit font-lock-warning))))
   `(font-latex-sedate ((t (:foreground ,exu-yellow :weight bold ))))
   `(font-latex-title-4 ((t (:inherit variable-pitch :weight bold))))

   ;; auto-complete
   `(ac-candidate-face ((t (:background ,exu-bg+3 :foreground "black"))))
   `(ac-selection-face ((t (:background ,exu-blue-4 :foreground ,exu-fg))))
   `(popup-tip-face ((t (:background ,exu-yellow-2 :foreground "black"))))
   `(popup-scroll-bar-foreground-face ((t (:background ,exu-blue-5))))
   `(popup-scroll-bar-background-face ((t (:background ,exu-bg-1))))
   `(popup-isearch-match ((t (:background ,exu-bg :foreground ,exu-fg))))

   ;; clojure-test-mode
   `(clojure-test-failure-face ((t (:foreground ,exu-orange :weight bold :underline t))))
   `(clojure-test-error-face ((t (:foreground ,exu-red :weight bold :underline t))))
   `(clojure-test-success-face ((t (:foreground ,exu-green+1 :weight bold :underline t))))

   ;; diff
   `(diff-added ((,class (:foreground ,exu-green+4))
                 (t (:foreground ,exu-green-1))))
   `(diff-changed ((t (:foreground ,exu-yellow))))
   `(diff-removed ((,class (:foreground ,exu-red))
                   (t (:foreground ,exu-red-3))))
   `(diff-header ((,class (:background ,exu-bg+2))
                  (t (:background ,exu-fg :foreground ,exu-bg))))
   `(diff-file-header
     ((,class (:background ,exu-bg+2 :foreground ,exu-fg :bold t))
      (t (:background ,exu-fg :foreground ,exu-bg :bold t))))

   ;; ert
   `(ert-test-result-expected ((t (:foreground ,exu-green+4 :background ,exu-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,exu-red :background ,exu-bg))))

   ;; eshell
   `(eshell-prompt ((t (:foreground ,exu-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,exu-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment))))
   `(eshell-ls-directory ((t (:foreground ,exu-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,exu-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,exu-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning))))
   `(eshell-ls-product ((t (:inherit font-lock-doc))))
   `(eshell-ls-special ((t (:foreground ,exu-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,exu-cyan :weight bold))))

   ;; flycheck
   `(flycheck-error-face ((t (:foreground ,exu-red-1 :weight bold :underline t))))
   `(flycheck-warning-face ((t (:foreground ,exu-orange :weight bold :underline t))))

   ;; flymake
   `(flymake-errline ((t (:foreground ,exu-red-1 :weight bold :underline t))))
   `(flymake-warnline ((t (:foreground ,exu-orange :weight bold :underline t))))

   ;; flyspell
   `(flyspell-duplicate ((t (:foreground ,exu-orange :weight bold :underline t))))
   `(flyspell-incorrect ((t (:foreground ,exu-red-1 :weight bold :underline t))))

   ;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,exu-blue :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning))))
   `(erc-default-face ((t (:foreground ,exu-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default))))
   `(erc-error-face ((t (:inherit font-lock-warning))))
   `(erc-fool-face ((t (:inherit erc-default))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,exu-yellow))))
   `(erc-keyword-face ((t (:foreground ,exu-blue :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,exu-yellow :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,exu-red :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default))))
   `(erc-notice-face ((t (:foreground ,exu-green))))
   `(erc-pal-face ((t (:foreground ,exu-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,exu-orange :background ,exu-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,exu-green+1))))
   `(erc-underline-face ((t (:underline t))))

   ;; gnus
   `(gnus-group-mail-1 ((t (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((t (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((t (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((t (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((t (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((t (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((t (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((t (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((t (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((t (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((t (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((t (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((t (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((t (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-from ((t (:inherit message-header-from))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-summary-cancelled ((t (:foreground ,exu-orange))))
   `(gnus-summary-high-ancient ((t (:foreground ,exu-blue))))
   `(gnus-summary-high-read ((t (:foreground ,exu-green :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,exu-orange :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,exu-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,exu-blue))))
   `(gnus-summary-low-read ((t (:foreground ,exu-green))))
   `(gnus-summary-low-ticked ((t (:foreground ,exu-orange :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,exu-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,exu-blue))))
   `(gnus-summary-normal-read ((t (:foreground ,exu-green))))
   `(gnus-summary-normal-ticked ((t (:foreground ,exu-orange :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,exu-fg))))
   `(gnus-summary-selected ((t (:foreground ,exu-yellow :weight bold))))
   `(gnus-cite-1 ((t (:foreground ,exu-blue))))
   `(gnus-cite-10 ((t (:foreground ,exu-yellow-1))))
   `(gnus-cite-11 ((t (:foreground ,exu-yellow))))
   `(gnus-cite-2 ((t (:foreground ,exu-blue-1))))
   `(gnus-cite-3 ((t (:foreground ,exu-blue-2))))
   `(gnus-cite-4 ((t (:foreground ,exu-green+2))))
   `(gnus-cite-5 ((t (:foreground ,exu-green+1))))
   `(gnus-cite-6 ((t (:foreground ,exu-green))))
   `(gnus-cite-7 ((t (:foreground ,exu-red))))
   `(gnus-cite-8 ((t (:foreground ,exu-red-1))))
   `(gnus-cite-9 ((t (:foreground ,exu-red-2))))
   `(gnus-group-news-1-empty ((t (:foreground ,exu-yellow))))
   `(gnus-group-news-2-empty ((t (:foreground ,exu-green+3))))
   `(gnus-group-news-3-empty ((t (:foreground ,exu-green+1))))
   `(gnus-group-news-4-empty ((t (:foreground ,exu-blue-2))))
   `(gnus-group-news-5-empty ((t (:foreground ,exu-blue-3))))
   `(gnus-group-news-6-empty ((t (:foreground ,exu-bg+2))))
   `(gnus-group-news-low-empty ((t (:foreground ,exu-bg+2))))
   `(gnus-signature ((t (:foreground ,exu-yellow))))
   `(gnus-x ((t (:background ,exu-fg :foreground ,exu-bg))))

   ;; helm
   `(helm-header
     ((t (:foreground ,exu-green
                      :background ,exu-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:foreground ,exu-yellow
                      :background ,exu-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)))))
   `(helm-selection ((t (:background ,exu-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,exu-bg+1))))
   `(helm-visible-mark ((t (:foreground ,exu-bg :background ,exu-yellow-2))))
   `(helm-candidate-number ((t (:foreground ,exu-green+4 :background ,exu-bg-1))))

   ;; hl-line-mode
   `(hl-line-face ((,class (:background ,exu-bg-05))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,exu-bg-05)) ; old emacsen
              (t :weight bold)))

   ;; hl-sexp
   `(hl-sexp-face ((,class (:background ,exu-bg+1))
                   (t :weight bold)))

   ;; ido-mode
   `(ido-first-match ((t (:foreground ,exu-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,exu-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,exu-yellow))))

   ;; js2-mode
   `(js2-warning-face ((t (:underline ,exu-orange))))
   `(js2-error-face ((t (:foreground ,exu-red :weight bold))))
   `(js2-jsdoc-tag-face ((t (:foreground ,exu-green-1))))
   `(js2-jsdoc-type-face ((t (:foreground ,exu-green+2))))
   `(js2-jsdoc-value-face ((t (:foreground ,exu-green+3))))
   `(js2-function-param-face ((t (:foreground, exu-green+3))))
   `(js2-external-variable-face ((t (:foreground ,exu-purple-1))))

   ;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,exu-green+2))))
   `(jabber-roster-user-online ((t (:foreground ,exu-blue-1))))
   `(jabber-roster-user-dnd ((t (:foreground ,exu-red+1))))
   `(jabber-rare-time-face ((t (:foreground ,exu-green+1))))
   `(jabber-chat-prompt-local ((t (:foreground ,exu-blue-1))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,exu-red+1))))
   `(jabber-activity-face((t (:foreground ,exu-red+1))))
   `(jabber-activity-personal-face ((t (:foreground ,exu-blue+1))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))

   ;; linum-mode
   `(linum ((t (:foreground ,exu-fg-4 :background ,exu-bg-05))))

   ;; magit
   `(magit-section-title ((t (:foreground ,exu-yellow :weight bold))))
   `(magit-branch ((t (:foreground ,exu-orange :weight bold))))
   `(magit-item-highlight ((t (:background ,exu-bg+1))))

   ;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment))))
   `(message-header-name ((t (:foreground ,exu-green+1))))
   `(message-header-other ((t (:foreground ,exu-green))))
   `(message-header-to ((t (:foreground ,exu-yellow :weight bold))))
   `(message-header-from ((t (:foreground ,exu-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,exu-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,exu-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,exu-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,exu-green))))
   `(message-mml ((t (:foreground ,exu-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((t (:foreground ,exu-orange))))
   `(mew-face-header-from ((t (:foreground ,exu-yellow))))
   `(mew-face-header-date ((t (:foreground ,exu-green))))
   `(mew-face-header-to ((t (:foreground ,exu-red))))
   `(mew-face-header-key ((t (:foreground ,exu-green))))
   `(mew-face-header-private ((t (:foreground ,exu-green))))
   `(mew-face-header-important ((t (:foreground ,exu-blue))))
   `(mew-face-header-marginal ((t (:foreground ,exu-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,exu-red))))
   `(mew-face-header-xmew ((t (:foreground ,exu-green))))
   `(mew-face-header-xmew-bad ((t (:foreground ,exu-red))))
   `(mew-face-body-url ((t (:foreground ,exu-orange))))
   `(mew-face-body-comment ((t (:foreground ,exu-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,exu-green))))
   `(mew-face-body-cite2 ((t (:foreground ,exu-blue))))
   `(mew-face-body-cite3 ((t (:foreground ,exu-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,exu-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,exu-red))))
   `(mew-face-mark-review ((t (:foreground ,exu-blue))))
   `(mew-face-mark-escape ((t (:foreground ,exu-green))))
   `(mew-face-mark-delete ((t (:foreground ,exu-red))))
   `(mew-face-mark-unlink ((t (:foreground ,exu-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,exu-green))))
   `(mew-face-mark-unread ((t (:foreground ,exu-red-2))))
   `(mew-face-eof-message ((t (:foreground ,exu-green))))
   `(mew-face-eof-part ((t (:foreground ,exu-yellow))))

   ;; mic-paren
   `(paren-face-match ((t (:foreground ,exu-cyan :background ,exu-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,exu-bg :background ,exu-magenta :weight bold))))
   `(paren-face-no-match ((t (:foreground ,exu-bg :background ,exu-red :weight bold))))

   ;; nav
   `(nav-face-heading ((t (:foreground ,exu-yellow))))
   `(nav-face-button-num ((t (:foreground ,exu-cyan))))
   `(nav-face-dir ((t (:foreground ,exu-green))))
   `(nav-face-hdir ((t (:foreground ,exu-red))))
   `(nav-face-file ((t (:foreground ,exu-fg))))
   `(nav-face-hfile ((t (:foreground ,exu-red-4))))

   ;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,exu-blue    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,exu-green+2 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,exu-blue-2  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,exu-green   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,exu-blue-4  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,exu-green-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,exu-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,exu-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,exu-bg+3 :strike-through t))))

   ;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,exu-bg-1))))
   `(mumamo-background-chunk-submode2 ((t (:background ,exu-bg+2))))
   `(mumamo-background-chunk-submode3 ((t (:background ,exu-bg+3))))
   `(mumamo-background-chunk-submode4 ((t (:background ,exu-bg+1))))

   ;; org-mode
   `(org-agenda-date-today
     ((t (:foreground "white" :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,exu-fg :weight bold))))
   `(org-checkbox ((t (:background ,exu-bg+2 :foreground "white"
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,exu-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,exu-red-1))))
   `(org-done ((t (:bold t :weight bold :foreground ,exu-green+3))))
   `(org-formula ((t (:foreground ,exu-yellow-2))))
   `(org-headline-done ((t (:foreground ,exu-green+3))))
   `(org-hide ((t (:foreground ,exu-bg-1))))
   `(org-level-1 ((t (:foreground ,exu-orange))))
   `(org-level-2 ((t (:foreground ,exu-green+1))))
   `(org-level-3 ((t (:foreground ,exu-blue-1))))
   `(org-level-4 ((t (:foreground ,exu-yellow-2))))
   `(org-level-5 ((t (:foreground ,exu-cyan))))
   `(org-level-6 ((t (:foreground ,exu-green-1))))
   `(org-level-7 ((t (:foreground ,exu-red-4))))
   `(org-level-8 ((t (:foreground ,exu-blue-4))))
   `(org-link ((t (:foreground ,exu-yellow-2 :underline t))))
   `(org-scheduled ((t (:foreground ,exu-green+4))))
   `(org-scheduled-previously ((t (:foreground ,exu-red-4))))
   `(org-scheduled-today ((t (:foreground ,exu-blue+1))))
   `(org-special-keyword ((t (:foreground ,exu-fg-1 :weight normal))))
   `(org-table ((t (:foreground ,exu-green+2))))
   `(org-tag ((t (:bold t :weight bold))))
   `(org-time-grid ((t (:foreground ,exu-orange))))
   `(org-todo ((t (:bold t :foreground ,exu-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:bold t :foreground ,exu-red :weight bold :underline nil))))
   `(org-column ((t (:background ,exu-bg-1))))
   `(org-column-title ((t (:background ,exu-bg-1 :underline t :weight bold))))

   `(quote ((t (:background ,exu-bg-1))))

   ;; outline
   `(outline-8 ((t (:inherit default))))
   `(outline-7 ((t (:inherit outline-8 :height 1.0))))
   `(outline-6 ((t (:inherit outline-7 :height 1.0))))
   `(outline-5 ((t (:inherit outline-6 :height 1.0))))
   `(outline-4 ((t (:inherit outline-5 :height 1.0))))
   `(outline-3 ((t (:inherit outline-4 :height 1.0))))
   `(outline-2 ((t (:inherit outline-3 :height 1.0))))
   `(outline-1 ((t (:inherit outline-2 :height 1.0))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,exu-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,exu-green+2))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,exu-yellow-2))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,exu-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,exu-green-1))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,exu-blue+1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,exu-yellow-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,exu-green+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,exu-blue-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,exu-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,exu-green))))
   `( rainbow-delimiters-depth-12-face ((t (:foreground ,exu-blue-5))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,exu-green))))
   `(rpm-spec-doc-face ((t (:foreground ,exu-green))))
   `(rpm-spec-ghost-face ((t (:foreground ,exu-red))))
   `(rpm-spec-macro-face ((t (:foreground ,exu-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,exu-red))))
   `(rpm-spec-package-face ((t (:foreground ,exu-red))))
   `(rpm-spec-section-face ((t (:foreground ,exu-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,exu-blue))))
   `(rpm-spec-var-face ((t (:foreground ,exu-red))))

   ;; rst-mode
   `(rst-level-1-face ((t (:foreground ,exu-orange))))
   `(rst-level-2-face ((t (:foreground ,exu-green+1))))
   `(rst-level-3-face ((t (:foreground ,exu-blue-1))))
   `(rst-level-4-face ((t (:foreground ,exu-yellow-2))))
   `(rst-level-5-face ((t (:foreground ,exu-cyan))))
   `(rst-level-6-face ((t (:foreground ,exu-green-1))))

   ;; show-paren
   `(show-paren-mismatch ((t (:foreground ,exu-red-3 :background ,exu-bg :weight bold))))
   `(show-paren-match ((t (:foreground ,exu-blue-1 :background ,exu-bg :weight bold))))

   ;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))

   ;; SLIME
   `(slime-repl-inputed-output-face ((t (:foreground ,exu-red))))

   ;; tabbar
   `(tabbar-button ((t (:foreground ,exu-fg
                                    :background ,exu-bg))))
   `(tabbar-selected ((t (:foreground ,exu-fg
                                      :background ,exu-bg
                                      :box (:line-width -1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,exu-fg
                                        :background ,exu-bg+1
                                        :box (:line-width -1 :style released-button)))))

   ;; volatile-highlights
   `(vhl/default-face ((t (:background ,exu-bg+1))))

   ;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,exu-yellow :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,exu-yellow-2
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,exu-red-1 :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,exu-yellow
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,exu-green+2 :background ,exu-bg))))
   `(w3m-lnum-match ((t (:background ,exu-bg-1
                                     :foreground ,exu-orange
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,exu-yellow))))

   ;; whitespace-mode
   `(whitespace-space ((t (:background ,exu-bg+1))))
   `(whitespace-hspace ((t (:background ,exu-bg+1))))
   `(whitespace-tab ((t (:foreground ,exu-red-5))))
   `(whitespace-newline ((t (:foreground ,exu-bg+1))))
   `(whitespace-trailing ((t (:background ,exu-red))))
   `(whitespace-line ((t (:background ,exu-bg :foreground ,exu-magenta))))
   `(whitespace-space-before-tab ((t (:background ,exu-orange :foreground ,exu-orange))))
   `(whitespace-indentation ((t (:background ,exu-yellow :foreground ,exu-red))))
   `(whitespace-empty ((t (:background ,exu-yellow))))
   `(whitespace-space-after-tab ((t (:background ,exu-yellow :foreground ,exu-red))))

   ;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,exu-red-2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,exu-red-1))))
   `(wl-highlight-folder-path-face ((t (:foreground ,exu-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,exu-blue))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,exu-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,exu-blue))))
   `(wl-highlight-message-citation-header ((t (:foreground ,exu-red-1))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,exu-red))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,exu-green+2))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,exu-blue))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,exu-blue+1))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,exu-green))))
   `(wl-highlight-message-headers-face ((t (:foreground ,exu-red+1))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,exu-green+2))))
   `(wl-highlight-message-header-contents ((t (:foreground ,exu-green+1))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,exu-green+2))))
   `(wl-highlight-message-signature ((t (:foreground ,exu-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,exu-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,exu-blue))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,exu-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,exu-blue))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,exu-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,exu-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,exu-magenta))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,exu-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))

   ;; which-func-mode
   `(which-func ((t (:foreground ,exu-green+4))))

   ;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,exu-bg-1))))
   `(yascroll:thumb-fringe ((t (:background ,exu-bg-1 :foreground ,exu-bg-1))))
   )

  ;;; custom theme variables
  (custom-theme-set-variables
   'exu
   `(ansi-color-names-vector [,exu-bg ,exu-red ,exu-green ,exu-yellow
                                      ,exu-blue ,exu-magenta ,exu-cyan ,exu-fg])
   `(ansi-term-color-vector [,exu-bg ,exu-red ,exu-green ,exu-yellow
                                     ,exu-blue ,exu-magenta ,exu-cyan ,exu-fg])

   ;; fill-column-indicator
   `(fci-rule-color ,exu-bg-05)))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'exu)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; exu.el ends here.
