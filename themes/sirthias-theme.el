;;; sirthias-theme.el --- Emacs 24 theme with a dark background.

;; Copyright (C) 2014 , Alexander Ivanov <4lex1v@gmail.com>

;; Author: Alexander Ivanov <4lex1v@gmail.com>
;; Version: 0.1.3

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:
;;; Theme inspired by Spray.io slides
;;; Special thanks to:
;;;    Mathias Doenitz @sirthias
;;;   Johannes Rudolph @virtualvoid

(deftheme sirthias "Sirthias color theme for Emacs")

(let ((class '((class color) (min-colors 89)))
      (fg1     "#eee8d5") ;; Eee8d5 or F7E6D1
      (fg2     "#d9d3c2")
      (fg3     "#c4bfaf")
      (fg4     "#afab9d")

      (bg1     "#002b36")
      (bg2     "#183944")
      (bg3     "#2b4852")
      (bg4     "#3e5861")

      (red "#dc322f")
      (blue "#8cd0d3")
      (alt-blue "#469AD3")
      (green "#859901")
      (dark-yellow "#b58903")
      (light-yellow "#efef8f")
      (yellow "#E2DA47")
      (space-gray "#93a1a1")

      (key2    "#e6d3b4")
      (key3    "#c7b597")
      (builtin "#8cd0d3")
      (keyword "#e3ceab")
      (const   "#efef8f")
      (comment "#93a1a1")
      (func    "#277082")
      (str     "#859901")
      (type    "#efef8f")
      (var     "#277082")
      (warning "#b58903"))

  (custom-theme-set-faces
   'sirthias

   ;; General
   `(default        ((,class (:foreground ,fg1 :background ,bg1))))
   `(region         ((,class (:foreground ,bg1 :background ,fg1))))
   `(cursor         ((,class (:background ,fg1))))
   `(highlight      ((,class (:foreground ,fg3 :background ,bg3))))
   `(lazy-highlight ((,class (:foreground ,bg3 :background ,dark-yellow :weight normal))))
   `(fringe         ((,class (:background ,bg1))))
   `(hl-line        ((,class (:background ,bg2))))
   `(link           ((,class (:foreground ,blue :underline t :weight bold))))
   `(link-visited   ((,class (:foreground ,blue :underline t :weight normal))))

   ;; States
   `(success ((,class (:foreground ,green ))))
   `(warning ((,class (:foreground ,yellow))))
   `(error   ((,class (:foreground ,dark-yellow))))

   ;; Mode line
   `(mode-line           ((,class (:foreground ,bg1 :background ,fg1 :box nil))))
   `(mode-line-buffer-id ((,class (:foreground ,bg1 :weight      bold))))
   `(mode-line-inactive  ((,class (:foreground ,bg1 :background ,fg1))))
   `(mode-line-highlight ((,class (:foreground ,bg1 :background ,bg4))))

   ;; Other UI general faces
   `(menu                  ((,class (:foreground ,fg1 :background ,bg1))))
   `(minibuffer-prompt     ((,class (:foreground ,red :bold t))))
   `(linum                 ((,class (:foreground ,fg1 :background ,bg2))))
   `(show-paren-match-face ((,class (:foreground ,bg1 :background ,fg4))))

   ;; ISearch
   `(isearch      ((,class (:foreground ,light-yellow :background ,bg3))))
   `(isearch-fail ((,class (:foreground ,dark-yellow :background ,bg3 :bold t))))

   ;; Font-lock old
   `(font-lock-type-face                  ((,class (:foreground ,light-yellow))))
   `(font-lock-variable-name-face         ((,class (:foreground ,blue))))
   `(font-lock-function-name-face         ((,class (:foreground ,blue))))
   `(font-lock-string-face                ((,class (:foreground ,green))))
   `(font-latex-match-reference-keywords  ((,class (:foreground ,yellow))))
   `(font-lock-negation-char-face         ((,class (:foreground ,yellow))))
   `(font-lock-constant-face              ((,class (:foreground ,light-yellow))))
   `(font-lock-warning-face               ((,class (:foreground ,dark-yellow :background ,bg2))))
   `(font-lock-builtin-face               ((,class (:foreground ,red))))
   `(font-lock-keyword-face               ((,class (:foreground ,red))))
   `(font-lock-comment-face               ((,class (:foreground ,space-gray))))
   `(font-lock-doc-face                   ((,class (:foreground ,space-gray))))
   `(font-latex-bold-face                 ((,class (:bold   t))))
   `(font-latex-italic-face               ((,class (:italic t))))

   ;; Org-mode
   `(org-code                             ((,class (:foreground ,fg2))))
   `(org-hide                             ((,class (:foreground ,fg4))))
   `(org-level-1                          ((,class (:bold t :foreground ,fg2 :height 1.1))))
   `(org-level-2                          ((,class (:bold nil :foreground ,fg3))))
   `(org-level-3                          ((,class (:bold t :foreground ,fg4))))
   `(org-level-4                          ((,class (:bold nil :foreground ,bg4))))
   `(org-date                             ((,class (:underline t :foreground ,var) )))
   `(org-footnote                         ((,class (:underline t :foreground ,fg4))))
   `(org-link                             ((,class (:underline t :foreground ,type ))))
   `(org-special-keyword                  ((,class (:foreground ,func))))
   `(org-verbatim                         ((,class (:foreground ,bg3 :underline t :slant italic))))
   `(org-block                            ((,class (:foreground ,fg3))))
   `(org-quote                            ((,class (:inherit org-block :slant italic))))
   `(org-verse                            ((,class (:inherit org-block :slant italic))))
   `(org-todo                             ((,class :foreground ,keyword :bold t)))
   `(org-done                             ((,class (:bold t :foreground ,bg4))))
   `(org-warning                          ((,class (:underline t :foreground ,warning))))
   `(org-agenda-structure                 ((,class (:weight bold :foreground ,fg3 :box (:color ,fg4) :background ,bg3))))
   `(org-agenda-date                      ((,class (:foreground ,var :height 1.1 ))))
   `(org-agenda-date-weekend              ((,class (:weight normal :foreground ,fg4))))
   `(org-agenda-date-today                ((,class (:weight bold :foreground ,keyword :height 1.4))))
   `(org-scheduled                        ((,class (:foreground ,type))))
   `(org-ellipsis                         ((,class (:foreground ,builtin))))
   `(org-verbatim                         ((,class (:foreground ,fg4))))
   `(org-document-info-keyword            ((,class (:foreground ,func))))
   `(org-sexp-date                        ((,class (:foreground ,fg4))))

   ;; Helm
   `(helm-header                          ((,class (:foreground ,bg1 :background ,fg1 :bold t))))
   `(helm-source-header                   ((,class (:foreground ,bg1 :background ,fg4 :underline nil :bold t))))
   `(helm-selection                       ((,class (:background ,bg3))))
   `(helm-selection-line                  ((,class (:background ,bg2))))
   `(helm-visible-mark                    ((,class (:foreground ,dark-yellow :background ,bg2))))
   `(helm-candidate-number                ((,class (:foreground ,bg1 :background ,fg1))))
   `(helm-separator                       ((,class (:foreground ,type :background ,bg1))))
   `(helm-time-zone-current               ((,class (:foreground ,builtin :background ,bg1))))
   `(helm-time-zone-home                  ((,class (:foreground ,type :background ,bg1))))
   `(helm-buffer-not-saved                ((,class (:foreground ,type :background ,bg1))))
   `(helm-buffer-process                  ((,class (:foreground ,builtin :background ,bg1))))
   `(helm-buffer-saved-out                ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-buffer-size                     ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-ff-directory                    ((,class (:foreground ,green :background ,bg1 :weight bold))))
   `(helm-ff-file                         ((,class (:foreground ,fg1 :background ,bg1 :weight normal))))
   `(helm-ff-executable                   ((,class (:foreground ,key2 :background ,bg1 :weight normal))))
   `(helm-ff-invalid-symlink              ((,class (:foreground ,key3 :background ,bg1 :weight bold))))
   `(helm-ff-symlink                      ((,class (:foreground ,keyword :background ,bg1 :weight bold))))
   `(helm-ff-prefix                       ((,class (:foreground ,bg1 :background ,keyword :weight normal))))
   `(helm-grep-cmd-line                   ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-file                       ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-finish                     ((,class (:foreground ,fg2 :background ,bg1))))
   `(helm-grep-lineno                     ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-match                      ((,class (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running                    ((,class (:foreground ,func :background ,bg1))))
   `(helm-moccur-buffer                   ((,class (:foreground ,func :background ,bg1))))

   ;; Others
   `(ac-completion-face                   ((,class (:underline t :foreground ,keyword))))
   `(icompletep-determined                ((,class :foreground ,builtin)))
   `(slime-repl-inputed-output-face       ((,class (:foreground ,type))))
   `(trailing-whitespace                  ((,class :foreground nil :background ,warning)))
   `(info-quoted-name                     ((,class (:foreground ,builtin))))
   `(info-string                          ((,class (:foreground ,str))))
   `(ffap                                 ((,class (:foreground ,fg4))))
   `(lazy-highlight                       ((,class (:foreground ,fg2 :background ,bg3))))

   ;; Magit
   `(magit-process-ok                     ((,class :foreground ,type)))
   `(magit-item-highlight                 ((,class :background ,bg3)))
   `(magit-section-heading                ((,class (:foreground ,keyword :weight bold))))
   `(magit-hunk-heading                   ((,class (:background ,bg3))))
   `(magit-section-highlight              ((,class (:background ,bg2))))
   `(magit-hunk-heading-highlight         ((,class (:background ,bg3))))
   `(magit-diff-context-highlight         ((,class (:background ,bg3 :foreground ,fg3))))
   `(magit-diffstat-added                 ((,class (:foreground ,type))))
   `(magit-diffstat-removed               ((,class (:foreground ,var))))
   `(magit-process-ok                     ((,class (:foreground ,func :weight bold))))
   `(magit-process-ng                     ((,class (:foreground ,warning :weight bold))))
   `(magit-branch                         ((,class (:foreground ,const :weight bold))))
   `(magit-log-author                     ((,class (:foreground ,fg3))))
   `(magit-hash                           ((,class (:foreground ,fg2))))
   `(magit-diff-file-header               ((,class (:foreground ,fg2 :background ,bg3))))

   ;; Web-Mode
   `(web-mode-builtin-face                ((,class (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face                ((,class (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face               ((,class (:inherit ,font-lock-constant-face))))
   `(web-mode-keyword-face                ((,class (:foreground ,keyword))))
   `(web-mode-doctype-face                ((,class (:inherit ,font-lock-comment-face))))
   `(web-mode-function-name-face          ((,class (:inherit ,font-lock-function-name-face))))
   `(web-mode-string-face                 ((,class (:foreground ,str))))
   `(web-mode-type-face                   ((,class (:inherit ,font-lock-type-face))))
   `(web-mode-html-attr-name-face         ((,class (:foreground ,yellow))))
   `(web-mode-html-attr-value-face        ((,class (:foreground ,green))))
   `(web-mode-html-tag-face               ((,class (:foreground ,blue)))))
   `(web-mode-warning-face                ((,class (:inherit ,font-lock-warning-face)))))



;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'sirthias)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; sirthias-theme.el ends here
