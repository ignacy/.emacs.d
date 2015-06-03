;;; orpheus-theme.el

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

;;; Commentary and Credits:

;; A dark color theme for 256 color terminals.
;; The file structure is based on hc-zenburn by
;; Nantas Nardelli <nantas.nardelli@gmail.com>,
;; which in turn was created by Bozhidar Batsov <bozhidar@batsov.com>

;;; Code:

(deftheme orpheus)

;;; Color Palette

(defvar orpheus-colors-alist
  '(("orpheus-fg+2"     . "#ffffff")
    ("orpheus-fg+1"     . "#d3d3d3")
    ("orpheus-fg"       . "#c6c6c6")
    ("orpheus-fg-1"     . "#b2b2b2")
    ("orpheus-bg-2"     . "#000000")
    ("orpheus-bg-1"     . "#202020")
    ;; ("orpheus-bg-05"    . "#a8a8a8")
    ("orpheus-bg"       . "#303030")
    ("orpheus-bg+05"    . "#3a3a3a")
    ("orpheus-bg+1"     . "#4e4e4e")
    ("orpheus-bg+2"     . "#6c6c6c")
    ("orpheus-bg+3"     . "#a8a8a8")
    ("orpheus-red+1"    . "#ef2929")
    ("orpheus-red"      . "#dd0000")
    ("orpheus-red-1"    . "#a40000")
    ("orpheus-red-2"    . "#5f0000")
    ("orpheus-red-4"    . "#996060")
    ("orpheus-orange"   . "#ff8700")
    ("orpheus-yellow-1" . "#ffad00")
    ("orpheus-yellow"   . "#ffd700")
    ("orpheus-green-1"  . "#8abd00")
    ("orpheus-green"    . "#9cd700")
    ("orpheus-green+1"  . "#9cd700")
    ("orpheus-green+2"  . "#afff00")
    ("orpheus-green+3"  . "#bdf800")
    ("orpheus-green+4"  . "#bdff0b")
    ("orpheus-cyan"     . "#87d7af")
    ("orpheus-blue+1"   . "#9CC7FB")
    ("orpheus-blue"     . "#5fafd7")
    ("orpheus-blue-1"   . "#89C5C8")
    ("orpheus-blue-2"   . "#79ADB0")
    ("orpheus-blue-3"   . "#699598")
    ("orpheus-blue-4"   . "#597D80")
    ("orpheus-blue-5"   . "#436D6D")
    ("orpheus-magenta"  . "#c61b6e"))
  "List of Orpheus colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defmacro orpheus-with-color-variables (&rest body)
  "`let' bind all colors defined in `orpheus-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   orpheus-colors-alist))
     ,@body))

;;; Theme Faces
(orpheus-with-color-variables
  (custom-theme-set-faces
   'orpheus
;;;; Built-in
;;;;; basic coloring
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,orpheus-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,orpheus-yellow-1 :underline t :weight normal))))
   `(default ((t (:foreground ,orpheus-fg :background ,orpheus-bg))))
   `(cursor ((t (:foreground ,orpheus-fg :background ,orpheus-fg+1))))
   `(escape-glyph ((t (:foreground ,orpheus-yellow :bold t))))
   `(fringe ((t (:foreground ,orpheus-fg :background ,orpheus-bg+1))))
   `(header-line ((t (:foreground ,orpheus-yellow
                                  :background ,orpheus-bg-1
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background ,orpheus-bg+2))))
   `(success ((t (:foreground ,orpheus-green :weight bold))))
   `(warning ((t (:foreground ,orpheus-orange :weight bold))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,orpheus-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,orpheus-green))))
   `(compilation-error-face ((t (:foreground ,orpheus-red-1 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,orpheus-fg))))
   `(compilation-info-face ((t (:foreground ,orpheus-blue))))
   `(compilation-info ((t (:foreground ,orpheus-green+4 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,orpheus-green))))
   `(compilation-line-face ((t (:foreground ,orpheus-yellow))))
   `(compilation-line-number ((t (:foreground ,orpheus-yellow))))
   `(compilation-message-face ((t (:foreground ,orpheus-blue))))
   `(compilation-warning-face ((t (:foreground ,orpheus-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,orpheus-green+2 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,orpheus-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,orpheus-yellow :weight bold))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,orpheus-fg))))
   `(grep-error-face ((t (:foreground ,orpheus-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,orpheus-blue))))
   `(grep-match-face ((t (:foreground ,orpheus-orange :weight bold))))
   `(match ((t (:background ,orpheus-bg-1 :foreground ,orpheus-orange :weight bold))))
;;;;; isearch
   `(isearch ((t (:foreground ,orpheus-yellow-1 :weight bold :background ,orpheus-bg+2))))
   `(isearch-fail ((t (:foreground ,orpheus-fg :background ,orpheus-red-2))))
   `(lazy-highlight ((t (:foreground ,orpheus-yellow-1 :weight bold :background ,orpheus-bg+2))))

   `(menu ((t (:foreground ,orpheus-fg :background ,orpheus-bg))))
   `(minibuffer-prompt ((t (:foreground ,orpheus-blue))))
   `(mode-line
     ((,class (:foreground ,orpheus-bg-1
                           :background ,orpheus-bg+2))))
                           ;; :box (:line-width -1 :style released-button)))
      ;; (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,orpheus-green+1 :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,orpheus-fg+2
                      :background ,orpheus-bg+1
                      :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,orpheus-bg+2))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,orpheus-bg+2))))
   `(trailing-whitespace ((t (:background ,orpheus-red))))
   `(vertical-border ((t (:foreground ,orpheus-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,orpheus-blue))))
   `(font-lock-comment-face ((t (:foreground ,orpheus-bg+3))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,orpheus-bg+3))))
   `(font-lock-constant-face ((t (:foreground ,orpheus-cyan))))
   `(font-lock-doc-face ((t (:foreground ,orpheus-bg+3))))
   `(font-lock-function-name-face ((t (:foreground ,orpheus-cyan))))
   `(font-lock-keyword-face ((t (:foreground ,orpheus-blue :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,orpheus-orange :weight bold))))
   ;; `(font-lock-preprocessor-face ((t (:foreground ,orpheus-blue+1))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,orpheus-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,orpheus-yellow :weight bold))))
   `(font-lock-string-face ((t (:foreground ,orpheus-green-1))))
   `(font-lock-type-face ((t (:foreground ,orpheus-blue-1))))
   `(font-lock-variable-name-face ((t (:foreground ,orpheus-fg))))
   `(font-lock-warning-face ((t (:foreground ,orpheus-yellow-1 :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,orpheus-bg+3 :foreground ,orpheus-bg-2))))
   `(ac-selection-face ((t (:background ,orpheus-blue-4 :foreground ,orpheus-fg))))
   `(popup-tip-face ((t (:background ,orpheus-yellow-1 :foreground ,orpheus-bg-2))))
   `(popup-scroll-bar-foreground-face ((t (:background ,orpheus-blue-5))))
   `(popup-scroll-bar-background-face ((t (:background ,orpheus-bg-1))))
   `(popup-isearch-match ((t (:background ,orpheus-bg :foreground ,orpheus-fg))))
;;;;; company-mode
   `(company-tooltip ((t (:foreground ,orpheus-fg :background ,orpheus-bg+1))))
   `(company-tooltip-selection ((t (:foreground ,orpheus-fg :background ,orpheus-bg-1))))
   `(company-tooltip-mouse ((t (:background ,orpheus-bg-1))))
   `(company-tooltip-common ((t (:foreground ,orpheus-green+2))))
   `(company-tooltip-common-selection ((t (:foreground ,orpheus-green+2))))
   `(company-scrollbar-fg ((t (:background ,orpheus-green+1))))
   `(company-scrollbar-bg ((t (:background ,orpheus-bg-1))))
   `(company-preview ((t (:background ,orpheus-green+1))))
   `(company-preview-common ((t (:background ,orpheus-bg-1))))
;;;;; diff
   `(diff-added ((,class (:foreground ,orpheus-green+4 :background nil))
                 (t (:foreground ,orpheus-green-1 :background nil))))
   `(diff-changed ((t (:foreground ,orpheus-yellow))))
   `(diff-removed ((,class (:foreground ,orpheus-red :background nil))
                   (t (:foreground ,orpheus-red-2 :background nil))))
   `(diff-refine-added ((t (:inherit diff-added :weight bold))))
   `(diff-refine-change ((t (:inherit diff-changed :weight bold))))
   `(diff-refine-removed ((t (:inherit diff-removed :weight bold))))
   `(diff-header ((,class (:background ,orpheus-bg+2))
                  (t (:background ,orpheus-fg :foreground ,orpheus-bg))))
   `(diff-file-header
     ((,class (:background ,orpheus-bg+2 :foreground ,orpheus-fg :bold t))
      (t (:background ,orpheus-fg :foreground ,orpheus-bg :bold t))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,orpheus-blue-2 :background ,orpheus-bg+2))))
   `(diff-hl-delete ((,class (:foreground ,orpheus-red+1 :background ,orpheus-bg+2))))
   `(diff-hl-insert ((,class (:foreground ,orpheus-green+1 :background ,orpheus-bg+2))))
   `(diff-hl-unknown ((,class (:foreground ,orpheus-yellow :background ,orpheus-bg+2))))
;;;;; dim-autoload
   `(dim-autoload-cookie-line ((t :foreground ,orpheus-bg+1)))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,orpheus-blue))))
   `(diredp-compressed-file-suffix ((t (:foreground ,orpheus-orange))))
   `(diredp-date-time ((t (:foreground ,orpheus-magenta))))
   `(diredp-deletion ((t (:foreground ,orpheus-yellow))))
   `(diredp-deletion-file-name ((t (:foreground ,orpheus-red))))
   `(diredp-dir-heading ((t (:foreground ,orpheus-blue :background ,orpheus-bg-1))))
   `(diredp-dir-priv ((t (:foreground ,orpheus-cyan))))
   `(diredp-exec-priv ((t (:foreground ,orpheus-red))))
   `(diredp-executable-tag ((t (:foreground ,orpheus-green+1))))
   `(diredp-file-name ((t (:foreground ,orpheus-blue))))
   `(diredp-file-suffix ((t (:foreground ,orpheus-green))))
   `(diredp-flag-mark ((t (:foreground ,orpheus-yellow))))
   `(diredp-flag-mark-line ((t (:foreground ,orpheus-orange))))
   `(diredp-ignored-file-name ((t (:foreground ,orpheus-red))))
   `(diredp-link-priv ((t (:foreground ,orpheus-yellow))))
   `(diredp-mode-line-flagged ((t (:foreground ,orpheus-yellow))))
   `(diredp-mode-line-marked ((t (:foreground ,orpheus-orange))))
   `(diredp-no-priv ((t (:foreground ,orpheus-fg))))
   `(diredp-number ((t (:foreground ,orpheus-green+1))))
   `(diredp-other-priv ((t (:foreground ,orpheus-yellow-1))))
   `(diredp-rare-priv ((t (:foreground ,orpheus-red-1))))
   `(diredp-read-priv ((t (:foreground ,orpheus-green-1))))
   `(diredp-symlink ((t (:foreground ,orpheus-yellow))))
   `(diredp-write-priv ((t (:foreground ,orpheus-magenta))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,orpheus-fg :background ,orpheus-red-2))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,orpheus-fg :background ,orpheus-red-2))))
   `(ediff-current-diff-B ((t (:foreground ,orpheus-fg :background ,orpheus-green-1))))
   `(ediff-current-diff-C ((t (:foreground ,orpheus-fg :background ,orpheus-blue-5))))
   `(ediff-even-diff-A ((t (:background ,orpheus-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,orpheus-bg+1))))
   `(ediff-even-diff-B ((t (:background ,orpheus-bg+1))))
   `(ediff-even-diff-C ((t (:background ,orpheus-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,orpheus-fg :background ,orpheus-red-2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,orpheus-fg :background ,orpheus-red-2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,orpheus-fg :background ,orpheus-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,orpheus-fg :background ,orpheus-blue-3 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,orpheus-bg+2))))
   `(ediff-odd-diff-Ancestor ((t (:background ,orpheus-bg+2))))
   `(ediff-odd-diff-B ((t (:background ,orpheus-bg+2))))
   `(ediff-odd-diff-C ((t (:background ,orpheus-bg+2))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,orpheus-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,orpheus-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,orpheus-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,orpheus-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,orpheus-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,orpheus-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,orpheus-cyan :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,orpheus-red-1) :inherit unspecified))
      (t (:foreground ,orpheus-red-1 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,orpheus-yellow) :inherit unspecified))
      (t (:foreground ,orpheus-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,orpheus-cyan) :inherit unspecified))
      (t (:foreground ,orpheus-cyan :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,orpheus-red-1 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,orpheus-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,orpheus-cyan :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,orpheus-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,orpheus-red-1 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,orpheus-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,orpheus-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,orpheus-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,orpheus-green-1 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,orpheus-orange) :inherit unspecified))
      (t (:foreground ,orpheus-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,orpheus-red) :inherit unspecified))
      (t (:foreground ,orpheus-red-1 :weight bold :underline t))))
;;;;; git-rebase-mode
   `(git-rebase-hash ((t (:foreground, orpheus-orange))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,orpheus-green
                      :background ,orpheus-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:foreground ,orpheus-yellow
                      :background ,orpheus-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)))))
   `(helm-selection ((t (:background ,orpheus-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,orpheus-bg+1))))
   `(helm-visible-mark ((t (:foreground ,orpheus-bg :background ,orpheus-yellow-1))))
   `(helm-candidate-number ((t (:foreground ,orpheus-green+4 :background ,orpheus-bg-1))))
   `(helm-separator ((t (:foreground ,orpheus-red :background ,orpheus-bg))))
   `(helm-time-zone-current ((t (:foreground ,orpheus-green+2 :background ,orpheus-bg))))
   `(helm-time-zone-home ((t (:foreground ,orpheus-red :background ,orpheus-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,orpheus-orange :background ,orpheus-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,orpheus-magenta :background ,orpheus-bg))))
   `(helm-bookmark-info ((t (:foreground ,orpheus-green+2 :background ,orpheus-bg))))
   `(helm-bookmark-man ((t (:foreground ,orpheus-yellow :background ,orpheus-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,orpheus-magenta :background ,orpheus-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,orpheus-red :background ,orpheus-bg))))
   `(helm-buffer-process ((t (:foreground ,orpheus-cyan :background ,orpheus-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,orpheus-fg :background ,orpheus-bg))))
   `(helm-buffer-size ((t (:foreground ,orpheus-fg-1 :background ,orpheus-bg))))
   `(helm-ff-directory ((t (:foreground ,orpheus-cyan :background ,orpheus-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,orpheus-fg :background ,orpheus-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,orpheus-green+2 :background ,orpheus-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,orpheus-red :background ,orpheus-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,orpheus-yellow :background ,orpheus-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,orpheus-bg :background ,orpheus-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,orpheus-cyan :background ,orpheus-bg))))
   `(helm-grep-file ((t (:foreground ,orpheus-fg :background ,orpheus-bg))))
   `(helm-grep-finish ((t (:foreground ,orpheus-green+2 :background ,orpheus-bg))))
   `(helm-grep-lineno ((t (:foreground ,orpheus-fg-1 :background ,orpheus-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,orpheus-red :background ,orpheus-bg))))
   `(helm-moccur-buffer ((t (:foreground ,orpheus-cyan :background ,orpheus-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,orpheus-fg-1 :background ,orpheus-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,orpheus-fg :background ,orpheus-bg))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,orpheus-bg+2))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,orpheus-bg+2)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,orpheus-bg+1))
                   (t :weight bold)))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,orpheus-orange))))
   `(js2-error ((t (:foreground ,orpheus-red :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,orpheus-green-1))))
   `(js2-jsdoc-type ((t (:foreground ,orpheus-green+2))))
   `(js2-jsdoc-value ((t (:foreground ,orpheus-green+3))))
   `(js2-function-param ((t (:foreground, orpheus-green+3))))
   `(js2-external-variable ((t (:foreground ,orpheus-orange))))
;;;;; linum-mode
   `(linum ((t (:foreground ,orpheus-green+2 :background ,orpheus-bg))))
;;;;; macrostep
   `(macrostep-gensym-1
     ((t (:foreground ,orpheus-green+2 :background ,orpheus-bg-1))))
   `(macrostep-gensym-2
     ((t (:foreground ,orpheus-red+1 :background ,orpheus-bg-1))))
   `(macrostep-gensym-3
     ((t (:foreground ,orpheus-blue+1 :background ,orpheus-bg-1))))
   `(macrostep-gensym-4
     ((t (:foreground ,orpheus-magenta :background ,orpheus-bg-1))))
   `(macrostep-gensym-5
     ((t (:foreground ,orpheus-yellow :background ,orpheus-bg-1))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
   `(magit-item-highlight ((t (:background ,orpheus-bg+05))))
   `(magit-section-title ((t (:foreground ,orpheus-yellow :weight bold))))
   `(magit-process-ok ((t (:foreground ,orpheus-green :weight bold))))
   `(magit-process-ng ((t (:foreground ,orpheus-red :weight bold))))
   `(magit-branch ((t (:foreground ,orpheus-blue :weight bold))))
   `(magit-log-author ((t (:foreground ,orpheus-orange))))
   `(magit-log-sha1 ((t (:foreground, orpheus-orange))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,orpheus-green+1))))
   `(message-header-other ((t (:foreground ,orpheus-green))))
   `(message-header-to ((t (:foreground ,orpheus-yellow :weight bold))))
   `(message-header-from ((t (:foreground ,orpheus-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,orpheus-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,orpheus-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,orpheus-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,orpheus-green))))
   `(message-mml ((t (:foreground ,orpheus-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,orpheus-cyan :background ,orpheus-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,orpheus-bg :background ,orpheus-magenta :weight bold))))
   `(paren-face-no-match ((t (:foreground ,orpheus-bg :background ,orpheus-red :weight bold))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,orpheus-yellow))))
   `(nav-face-button-num ((t (:foreground ,orpheus-cyan))))
   `(nav-face-dir ((t (:foreground ,orpheus-green))))
   `(nav-face-hdir ((t (:foreground ,orpheus-red))))
   `(nav-face-file ((t (:foreground ,orpheus-fg))))
   `(nav-face-hfile ((t (:foreground ,orpheus-red-2))))
;;;;; outline
   `(outline-1 ((t (:foreground ,orpheus-orange))))
   `(outline-2 ((t (:foreground ,orpheus-green+4))))
   `(outline-3 ((t (:foreground ,orpheus-blue-1))))
   `(outline-4 ((t (:foreground ,orpheus-yellow-1))))
   `(outline-5 ((t (:foreground ,orpheus-cyan))))
   `(outline-6 ((t (:foreground ,orpheus-green+2))))
   `(outline-7 ((t (:foreground ,orpheus-red-2))))
   `(outline-8 ((t (:foreground ,orpheus-blue-4))))
;;;;; powerline
   `(powerline-active1 ((t (:background ,orpheus-fg-1 :inherit mode-line))))
   `(powerline-active2 ((t (:background ,orpheus-fg-1 :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,orpheus-bg+1 :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,orpheus-bg+2 :inherit mode-line-inactive))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,orpheus-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,orpheus-green+4))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,orpheus-yellow-1))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,orpheus-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,orpheus-green+2))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,orpheus-blue+1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,orpheus-yellow-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,orpheus-green+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,orpheus-blue-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,orpheus-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,orpheus-green))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,orpheus-blue-5))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,orpheus-yellow :bold t))))
   `(sh-quoted-exec ((t (:foreground ,orpheus-red))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,orpheus-red+1 :background ,orpheus-bg+3 :weight bold))))
   `(show-paren-match ((t (:background ,orpheus-bg+3 :weight bold))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,orpheus-red+1 :background ,orpheus-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,orpheus-bg+3 :weight bold))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,orpheus-green+2))))
   `(speedbar-directory-face ((t (:foreground ,orpheus-cyan))))
   `(speedbar-file-face ((t (:foreground ,orpheus-fg))))
   `(speedbar-highlight-face ((t (:foreground ,orpheus-bg :background ,orpheus-green+2))))
   `(speedbar-selected-face ((t (:foreground ,orpheus-red))))
   `(speedbar-separator-face ((t (:foreground ,orpheus-bg :background ,orpheus-blue-1))))
   `(speedbar-tag-face ((t (:foreground ,orpheus-yellow))))
;;;;; tabbar
   `(tabbar-button ((t (:foreground ,orpheus-fg
                                    :background ,orpheus-bg))))
   `(tabbar-selected ((t (:foreground ,orpheus-fg
                                      :background ,orpheus-bg
                                      :box (:line-width -1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,orpheus-fg
                                        :background ,orpheus-bg+1
                                        :box (:line-width -1 :style released-button)))))
;;;;; term
   `(term-color-black ((t (:foreground ,orpheus-bg
                                       :background ,orpheus-bg-1))))
   `(term-color-red ((t (:foreground ,orpheus-red-2
                                       :background ,orpheus-red-2))))
   `(term-color-green ((t (:foreground ,orpheus-green
                                       :background ,orpheus-green+2))))
   `(term-color-yellow ((t (:foreground ,orpheus-orange
                                       :background ,orpheus-yellow))))
   `(term-color-blue ((t (:foreground ,orpheus-blue-1
                                      :background ,orpheus-blue-4))))
   `(term-color-magenta ((t (:foreground ,orpheus-magenta
                                         :background ,orpheus-red))))
   `(term-color-cyan ((t (:foreground ,orpheus-cyan
                                       :background ,orpheus-blue))))
   `(term-color-white ((t (:foreground ,orpheus-fg
                                       :background ,orpheus-fg-1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,orpheus-fg+1 :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,orpheus-red-1 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,orpheus-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,orpheus-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,orpheus-cyan))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,orpheus-bg+1 :foreground ,orpheus-bg+1))))
   `(whitespace-hspace ((t (:background ,orpheus-bg+1 :foreground ,orpheus-bg+1))))
   `(whitespace-tab ((t (:background ,orpheus-red-1))))
   `(whitespace-newline ((t (:foreground ,orpheus-bg+1))))
   `(whitespace-trailing ((t (:background ,orpheus-red))))
   `(whitespace-line ((t (:background ,orpheus-bg :foreground ,orpheus-magenta))))
   `(whitespace-space-before-tab ((t (:background ,orpheus-orange :foreground ,orpheus-orange))))
   `(whitespace-indentation ((t (:background ,orpheus-yellow :foreground ,orpheus-red))))
   `(whitespace-empty ((t (:background ,orpheus-yellow))))
   `(whitespace-space-after-tab ((t (:background ,orpheus-yellow :foreground ,orpheus-red))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,orpheus-green+4))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,orpheus-bg-1))))
   `(yascroll:thumb-fringe ((t (:background ,orpheus-bg-1 :foreground ,orpheus-bg-1))))
   ))

;;; Theme Variables
(orpheus-with-color-variables
  (custom-theme-set-variables
   'orpheus
;;;;; ansi-color
   `(ansi-color-names-vector [,orpheus-bg ,orpheus-red ,orpheus-green ,orpheus-yellow
                                          ,orpheus-blue ,orpheus-magenta ,orpheus-cyan ,orpheus-fg])
;;;;; fill-column-indicator
   `(fci-rule-color ,orpheus-bg+2)
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,orpheus-red-1)
       ( 40. . ,orpheus-red)
       ( 60. . ,orpheus-orange)
       ( 80. . ,orpheus-yellow-1)
       (100. . ,orpheus-yellow-1)
       (120. . ,orpheus-yellow)
       (140. . ,orpheus-green-1)
       (160. . ,orpheus-green)
       (180. . ,orpheus-green+1)
       (200. . ,orpheus-green+2)
       (220. . ,orpheus-green+3)
       (240. . ,orpheus-green+4)
       (260. . ,orpheus-cyan)
       (280. . ,orpheus-blue-2)
       (300. . ,orpheus-blue-1)
       (320. . ,orpheus-blue)
       (340. . ,orpheus-blue+1)
       (360. . ,orpheus-magenta)))
   `(vc-annotate-very-old-color ,orpheus-magenta)
   `(vc-annotate-background ,orpheus-bg-1)
   ))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar orpheus-add-font-lock-keywords nil
  "Whether to add font-lock keywords for orpheus color names.
In buffers visiting library `orpheus-theme.el' the orpheus
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar orpheus-colors-font-lock-keywords nil)

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'orpheus)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; orpheus-theme.el ends here
