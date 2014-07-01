;;; mejelly-theme.el --- Mejelly theme for GNU Emacs 24 (deftheme)

;; Author: Aldric Giacomoni <trevoke@gmail.com>
;; Original color-theme author: Mark Tran <mark.tran@gmail.com>
;; URL: http://github.com/trevoke/color-theme-mejelly
;; Version: 1.0.40

;; Inspired by jellybeans: http://www.vim.org/scripts/script.php?script_id=2555.
(deftheme mejelly "The mejelly color theme")

(let (
      (class '((class color) (min-colors 89)))
      (mejelly-fg "#e8e8d3")
      (mejelly-bg "#151515")

      (mejelly-orange-0 "#fdb86b")

      (mejelly-yellow-0 "#f9cf80")
      (mejelly-yellow-1 "#ffff00")
      (mejelly-yellow-2 "#d8ad4c") ; new color?

      (mejelly-blue-0 "#597bc5")
      (mejelly-blue-1 "#71b9f8")
      (mejelly-blue-2 "#91bfdb")
      (mejelly-blue-3 "#7d93b6")

      (mejelly-green-0 "#556536")
      (mejelly-green-1 "#99ad6a")

      (mejelly-grey-0 "#adadad")
      (mejelly-grey-1 "#7f7f7f")
      (mejelly-grey-2 "#1c1c1c")
      (mejelly-grey-3 "#3b3b3b")

      (mejelly-purple-0 "#c6b8fc")
      (mejelly-purple-1 "#c74e90")
      (mejelly-purple-2 "#cd00cd")
      (mejelly-purple-3 "#540063")
      (mejelly-purple-4 "#a037b0")

      (mejelly-red-0 "#cf6a4c")
      (mejelly-red-1 "#dd0093")
      (mejelly-red-2 "#de5577")
      (mejelly-red-3 "#ff73fd"))

  (custom-theme-set-faces
   'mejelly
   `(default                         ((,class (:foreground ,mejelly-fg
                                                           :background ,mejelly-bg))))

   `(font-lock-builtin-face          ((,class (:foreground ,mejelly-blue-0))))
   `(font-lock-comment-face          ((,class (:slant italic
                                                      :foreground ,mejelly-grey-0))))
   `(font-lock-constant-face         ((,class (:foreground ,mejelly-blue-1))))
   `(font-lock-doc-face              ((,class (:foreground ,mejelly-green-0))))
   `(font-lock-function-name-face    ((,class (:foreground ,mejelly-yellow-0))))
   `(font-lock-keyword-face          ((,class (:foreground ,mejelly-blue-0))))
   `(font-lock-preprocessor-face     ((,class (:foreground ,mejelly-fg))))
   `(font-lock-string-face           ((,class (:foreground ,mejelly-green-1))))
   `(font-lock-type-face             ((,class (:foreground ,mejelly-orange-0))))
   `(font-lock-variable-name-face    ((,class (:foreground ,mejelly-purple-0))))
   `(font-lock-warning-face          ((,class (:foreground ,mejelly-red-1))))


   `(compilation-error               ((,class (:foreground ,mejelly-red-0))))
   `(compilation-info                ((,class (:foreground ,mejelly-yellow-0))))
   `(compilation-line-number         ((,class (:foreground ,mejelly-grey-0))))
   `(compilation-mode-line-exit      ((,class (:foreground ,mejelly-green-0))))
   `(compilation-mode-line-fail      ((,class (:foreground ,mejelly-red-0))))
   `(compilation-mode-line-run       ((,class (:foreground ,mejelly-yellow-0))))

   `(cursor                          ((,class (:background ,mejelly-blue-2))))

   `(diredp-date-time                ((,class (:foreground ,mejelly-fg))))
   `(diredp-deletion                 ((,class (:foreground ,mejelly-red-0))))
   `(diredp-dir-heading              ((,class (:foreground ,mejelly-yellow-0
                                                           :background ,mejelly-bg))))
   `(diredp-dir-priv                 ((,class (:foreground ,mejelly-green-1
                                                           :background ,mejelly-bg))))
   `(diredp-exec-priv                ((,class (:foreground ,mejelly-fg
                                                           :background ,mejelly-bg))))
   `(diredp-file-name                ((,class (:foreground ,mejelly-fg))))
   `(diredp-file-suffix              ((,class (:foreground ,mejelly-fg))))
   `(diredp-link-priv                ((,class (:foreground ,mejelly-fg))))
   `(diredp-number                   ((,class (:foreground ,mejelly-fg))))
   `(diredp-no-priv                  ((,class (:foreground ,mejelly-fg
                                                           :background ,mejelly-bg))))
   `(diredp-rare-priv                ((,class (:foreground ,mejelly-red-0
                                                           :background ,mejelly-bg))))
   `(diredp-read-priv                ((,class (:foreground ,mejelly-fg
                                                           :background ,mejelly-bg))))
   `(diredp-symlink                  ((,class (:foreground ,mejelly-red-3))))
   `(diredp-write-priv               ((,class (:foreground ,mejelly-fg
                                                           :background ,mejelly-bg))))

   `(emmet-preview-output            ((,class (:background ,mejelly-purple-1))))

   `(enh-ruby-heredoc-delimiter-face ((,class (:foreground ,mejelly-green-0))))
   `(enh-ruby-op-face                ((,class (:foreground ,mejelly-fg))))
   `(enh-ruby-regexp-delimiter-face  ((,class (:foreground ,mejelly-purple-3))))
   `(enh-ruby-string-delimiter-face  ((,class (:foreground ,mejelly-green-0))))

   `(erc-notice-face                 ((,class (:foreground ,mejelly-yellow-0))))
   `(erc-prompt-face                 ((,class (:foreground ,mejelly-fg))))
   `(erc-timestamp-face              ((,class (:foreground ,mejelly-purple-0))))

   `(eshell-prompt                   ((,class (:foreground ,mejelly-red-0))))
   `(eshell-ls-directory             ((,class (:weight normal
                                                       :foreground ,mejelly-green-1))))
   `(eshell-ls-executable            ((,class (:foreground ,mejelly-red-0))))
   `(eshell-ls-product               ((,class (:foreground ,mejelly-fg))))
   `(eshell-ls-symlink               ((,class (:foreground ,mejelly-purple-2))))

   `(fringe                          ((,class (:foreground ,mejelly-fg
                                                           :background ,mejelly-grey-2))))

   `(git-commit-comment-file-face    ((,class (:foreground ,mejelly-fg))))
   `(git-commit-comment-heading-face ((,class (:foreground ,mejelly-yellow-0))))
   `(git-commit-summary-face         ((,class (:foreground ,mejelly-fg))))

   `(header-line                     ((,class (:foreground ,mejelly-fg))))

   `(helm-buffer-size                ((,class (:foreground ,mejelly-fg))))
   `(helm-candidate-number           ((,class (:foreground ,mejelly-fg
                                                           :background ,mejelly-bg))))
   `(helm-ff-directory               ((,class (:background ,mejelly-bg))))
   `(helm-ff-file                    ((,class (:foreground ,mejelly-fg))))
   `(helm-match                      ((,class (:foreground ,mejelly-yellow-0
                                                           :background ,mejelly-bg))))
   `(helm-selection                  ((,class (:background ,mejelly-purple-1))))
   `(helm-source-header              ((,class (:foreground ,mejelly-red-1
                                                           :background ,mejelly-grey-3))))

   `(hl-line                         ((,class (:background ,mejelly-grey-3))))

   `(isearch                         ((,class (:foreground ,mejelly-fg
                                                           :background ,mejelly-red-1))))
   `(isearch-fail                    ((,class (:background ,mejelly-red-1))))

   `(ido-first-match                 ((,class (:foreground ,mejelly-yellow-0))))
   `(ido-only-match                  ((,class (:foreground ,mejelly-green-0))))
   `(ido-subdir                      ((,class (:foreground ,mejelly-fg))))
   `(ido-virtual                     ((,class (:foreground ,mejelly-purple-0))))

   `(lazy-highlight                  ((,class (:foreground ,mejelly-red-1
                                                           :background nil))))

   `(linum                           ((,class (:inherit nil
                                                        :slant normal
                                                        :foreground ,mejelly-grey-0
                                                        :background ,mejelly-grey-2))))

   `(magit-branch                    ((,class (:foreground ,mejelly-red-0
                                                           :background ,mejelly-bg))))
   `(magit-diff-add                  ((,class (:foreground ,mejelly-green-0
                                                           :background ,mejelly-bg))))
   `(magit-diff-del                  ((,class (:foreground ,mejelly-red-0
                                                           :background ,mejelly-bg))))
   `(magit-diff-file-header          ((,class (:inherit nil
                                                        :foreground ,mejelly-red-2
                                                        :background ,mejelly-bg))))
   `(magit-diff-hunk-header          ((,class (:inherit nil
                                                        :foreground ,mejelly-yellow-0
                                                        :background ,mejelly-bg))))
   `(magit-item-highlight            ((,class (:weight normal
                                                       :background ,mejelly-bg))))
   `(magit-log-author                ((,class (:foreground ,mejelly-fg))))
   `(magit-log-sha1                  ((,class (:foreground ,mejelly-red-0
                                                           :background ,mejelly-bg))))
   `(magit-log-head-label-local      ((,class (:foreground ,mejelly-fg))))
   `(magit-section-title             ((,class (:foreground ,mejelly-fg
                                                           :background ,mejelly-bg))))
   `(magit-whitespace-warning-face   ((,class (:background ,mejelly-red-1))))

   `(minibuffer-prompt               ((,class (:foreground ,mejelly-fg
                                                           :background ,mejelly-bg))))

   `(mode-line                       ((,class (:foreground ,mejelly-fg
                                                           :background nil))))
   `(mode-line-inactive              ((,class (:foreground ,mejelly-grey-3
                                                           :background nil))))

   `(org-checkbox                    ((,class (:foreground ,mejelly-green-0))))
   `(org-date                        ((,class (:foreground ,mejelly-purple-0))))
   `(org-done                        ((,class (:foreground ,mejelly-green-0))))
   `(org-level-1                     ((,class (:foreground ,mejelly-red-2))))
   `(org-level-2                     ((,class (:foreground ,mejelly-red-0))))
   `(org-level-3                     ((,class (:foreground ,mejelly-red-0))))
   `(org-special-keyword             ((,class (:foreground ,mejelly-purple-0))))
   `(org-todo                        ((,class (:foreground ,mejelly-yellow-0))))

   `(region                          ((,class (:background ,mejelly-purple-1))))

   `(smerge-markers                  ((,class (:foreground ,mejelly-yellow-0
                                                           :background ,mejelly-bg))))
   `(smerge-refined-change           ((,class (:foreground ,mejelly-green-0))))

   `(trailing-whitespace             ((,class (:background ,mejelly-red-1))))

   `(web-mode-builtin-face           ((,class (:foreground ,mejelly-blue-0))))
   `(web-mode-html-attr-name-face    ((,class (:foreground ,mejelly-purple-0))))
   `(web-mode-html-tag-face          ((,class (:foreground ,mejelly-fg))))
   `(web-mode-symbol-face            ((,class (:foreground ,mejelly-blue-1))))

   `(trailing-whitespace             ((,class (:background ,mejelly-red-1))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'mejelly)

;;; mejelly-theme.el ends here
