;;; mejelly-light-theme.el --- Mejelly-Light theme for GNU Emacs 24 (deftheme)

;; Author: Aldric Giacomoni <trevoke@gmail.com>
;; URL: http://github.com/trevoke/color-theme-mejelly-light
;; Version: 1.0.40

;; Inspired by jellybeans: http://www.vim.org/scripts/script.php?script_id=2555.
(deftheme mejelly-light "The mejelly-light color theme")

(let (
      (class '((class color) (min-colors 89)))
      (mejelly-light-fg "#323211")
      (mejelly-light-bg "##FFF5D6")

      (mejelly-light-orange-0 "#f2650d")
      (mejelly-light-orange-1 "#ff6333")
      (mejelly-light-yellow-0 "#7f5406")
      (mejelly-light-yellow-1 "#808080")
      (mejelly-light-yellow-2 "#d8ad4c")

      (mejelly-light-blue-0 "#3a5ca6")
      (mejelly-light-blue-1 "#074e8d")
      (mejelly-light-blue-2 "#245370")
      (mejelly-light-blue-3 "#495f83")

      (mejelly-light-green-0 "#809451")
      (mejelly-light-green-1 "#58a329")

      (mejelly-light-grey-0 "#525252")
      (mejelly-light-grey-1 "#7f7f7f")
      (mejelly-light-grey-2 "#e3e3e3")
      (mejelly-light-grey-3 "#c4c4c4")

      (mejelly-light-purple-0 "#110349")
      (mejelly-light-purple-1 "#b2387b")
      (mejelly-light-purple-2 "#f3f")
      (mejelly-light-purple-3 "#f09eff")
      (mejelly-light-purple-4 "#b851c8")

      (mejelly-light-red-0 "#b54f30")
      (mejelly-light-red-1 "#ff24b6")
      (mejelly-light-red-2 "#a24")
      (mejelly-light-red-3 "#8a0087"))

  (custom-theme-set-faces
   'mejelly-light
   `(default                                 ((,class ( :foreground ,mejelly-light-fg
                                                        :background ,mejelly-light-bg))))

   `(font-lock-builtin-face                  ((,class ( :foreground ,mejelly-light-blue-0))))
   `(font-lock-comment-face                  ((,class ( :slant italic
                                                        :foreground ,mejelly-light-grey-0))))
   `(font-lock-constant-face                 ((,class ( :foreground ,mejelly-light-blue-1))))
   `(font-lock-doc-face                      ((,class ( :foreground ,mejelly-light-green-0))))
   `(font-lock-function-name-face            ((,class ( :foreground ,mejelly-light-orange-0))))
   `(font-lock-keyword-face                  ((,class ( :foreground ,mejelly-light-blue-0))))
   `(font-lock-preprocessor-face             ((,class ( :foreground ,mejelly-light-fg))))
   `(font-lock-string-face                   ((,class ( :foreground ,mejelly-light-green-1))))
   `(font-lock-type-face                     ((,class ( :foreground ,mejelly-light-red-0))))
   `(font-lock-variable-name-face            ((,class ( :foreground ,mejelly-light-purple-0))))
   `(font-lock-warning-face                  ((,class ( :foreground ,mejelly-light-red-1))))


   `(compilation-error                       ((,class ( :foreground ,mejelly-light-red-0))))
   `(compilation-info                        ((,class ( :foreground ,mejelly-light-yellow-0))))
   `(compilation-line-number                 ((,class ( :foreground ,mejelly-light-grey-0))))
   `(compilation-mode-line-exit              ((,class ( :foreground ,mejelly-light-green-0))))
   `(compilation-mode-line-fail              ((,class ( :foreground ,mejelly-light-red-0))))
   `(compilation-mode-line-run               ((,class ( :foreground ,mejelly-light-yellow-0))))

   `(cursor                                  ((,class ( :background ,mejelly-light-blue-2))))

   `(diredp-date-time                        ((,class ( :foreground ,mejelly-light-fg))))
   `(diredp-deletion                         ((,class ( :foreground ,mejelly-light-red-0))))
   `(diredp-dir-heading                      ((,class ( :foreground ,mejelly-light-yellow-0
                                                        :background ,mejelly-light-bg))))
   `(diredp-dir-priv                         ((,class ( :foreground ,mejelly-light-green-1
                                                        :background ,mejelly-light-bg))))
   `(diredp-exec-priv                        ((,class ( :foreground ,mejelly-light-fg
                                                        :background ,mejelly-light-bg))))
   `(diredp-file-name                        ((,class ( :foreground ,mejelly-light-fg))))
   `(diredp-file-suffix                      ((,class ( :foreground ,mejelly-light-fg))))
   `(diredp-link-priv                        ((,class ( :foreground ,mejelly-light-fg))))
   `(diredp-number                           ((,class ( :foreground ,mejelly-light-fg))))
   `(diredp-no-priv                          ((,class ( :foreground ,mejelly-light-fg
                                                        :background ,mejelly-light-bg))))
   `(diredp-rare-priv                        ((,class ( :foreground ,mejelly-light-red-0
                                                        :background ,mejelly-light-bg))))
   `(diredp-read-priv                        ((,class ( :foreground ,mejelly-light-fg
                                                        :background ,mejelly-light-bg))))
   `(diredp-symlink                          ((,class ( :foreground ,mejelly-light-red-3))))
   `(diredp-write-priv                       ((,class ( :foreground ,mejelly-light-fg
                                                        :background ,mejelly-light-bg))))

   `(emmet-preview-output                    ((,class ( :background ,mejelly-light-purple-1))))

   `(enh-ruby-heredoc-delimiter-face         ((,class ( :foreground ,mejelly-light-green-0))))
   `(enh-ruby-op-face                        ((,class ( :foreground ,mejelly-light-fg))))
   `(enh-ruby-regexp-delimiter-face          ((,class ( :foreground ,mejelly-light-purple-3))))
   `(enh-ruby-regexp-face                    ((,class ( :foreground ,mejelly-light-red-1))))
   `(enh-ruby-string-delimiter-face          ((,class ( :foreground ,mejelly-light-green-0))))

   `(erc-notice-face                         ((,class ( :foreground ,mejelly-light-yellow-0))))
   `(erc-prompt-face                         ((,class ( :foreground ,mejelly-light-fg))))
   `(erc-timestamp-face                      ((,class ( :foreground ,mejelly-light-purple-0))))

   `(eshell-prompt                           ((,class ( :foreground ,mejelly-light-red-0))))
   `(eshell-ls-directory                     ((,class ( :weight normal
                                                        :foreground ,mejelly-light-green-1))))
   `(eshell-ls-executable                    ((,class ( :foreground ,mejelly-light-red-0))))
   `(eshell-ls-product                       ((,class ( :foreground ,mejelly-light-fg))))
   `(eshell-ls-symlink                       ((,class ( :foreground ,mejelly-light-purple-2))))

   `(fringe                                  ((,class ( :foreground ,mejelly-light-fg
                                                        :background ,mejelly-light-grey-2))))

   `(git-commit-comment-file-face            ((,class ( :foreground ,mejelly-light-fg))))
   `(git-commit-comment-heading-face         ((,class ( :foreground ,mejelly-light-yellow-0))))
   `(git-commit-summary-face                 ((,class ( :foreground ,mejelly-light-fg))))

   `(header-line                             ((,class ( :foreground ,mejelly-light-fg))))

   `(helm-buffer-size                        ((,class ( :foreground ,mejelly-light-fg))))
   `(helm-candidate-number                   ((,class ( :foreground ,mejelly-light-fg
                                                        :background ,mejelly-light-bg))))
   `(helm-ff-directory                       ((,class ( :background ,mejelly-light-bg))))
   `(helm-ff-file                            ((,class ( :foreground ,mejelly-light-fg))))
   `(helm-match                              ((,class ( :foreground ,mejelly-light-yellow-0
                                                        :background ,mejelly-light-bg))))
   `(helm-selection                          ((,class ( :background ,mejelly-light-purple-1))))
   `(helm-source-header                      ((,class ( :foreground ,mejelly-light-red-1
                                                        :background ,mejelly-light-grey-3))))

   `(hl-line                                 ((,class ( :background ,mejelly-light-grey-3))))

   `(isearch                                 ((,class ( :foreground ,mejelly-light-fg
                                                        :background ,mejelly-light-red-1))))
   `(isearch-fail                            ((,class ( :background ,mejelly-light-red-1))))

   `(ido-first-match                         ((,class ( :foreground ,mejelly-light-yellow-0))))
   `(ido-only-match                          ((,class ( :foreground ,mejelly-light-green-0))))
   `(ido-subdir                              ((,class ( :foreground ,mejelly-light-fg))))
   `(ido-virtual                             ((,class ( :foreground ,mejelly-light-purple-0))))

   `(lazy-highlight                          ((,class ( :foreground ,mejelly-light-red-1
                                                        :background nil))))

   `(linum                                   ((,class ( :inherit nil
                                                        :slant normal
                                                        :foreground ,mejelly-light-grey-0
                                                        :background ,mejelly-light-grey-2))))

   `(magit-branch                            ((,class ( :foreground ,mejelly-light-red-0
                                                        :background ,mejelly-light-bg))))
   `(magit-diff-add                          ((,class ( :foreground ,mejelly-light-green-0
                                                        :background ,mejelly-light-bg))))
   `(magit-diff-del                          ((,class ( :foreground ,mejelly-light-red-0
                                                        :background ,mejelly-light-bg))))
   `(magit-diff-file-header                  ((,class ( :inherit nil
                                                        :foreground ,mejelly-light-red-2
                                                        :background ,mejelly-light-bg))))
   `(magit-diff-hunk-header                  ((,class ( :inherit nil
                                                        :foreground ,mejelly-light-yellow-0
                                                        :background ,mejelly-light-bg))))
   `(magit-item-highlight                    ((,class ( :weight normal
                                                        :background ,mejelly-light-bg))))
   `(magit-log-author                        ((,class ( :foreground ,mejelly-light-fg))))
   `(magit-log-sha1                          ((,class ( :foreground ,mejelly-light-red-0
                                                        :background ,mejelly-light-bg))))
   `(magit-log-head-label-local              ((,class ( :foreground ,mejelly-light-fg))))
   `(magit-section-title                     ((,class ( :foreground ,mejelly-light-fg
                                                        :background ,mejelly-light-bg))))
   `(magit-whitespace-warning-face           ((,class ( :background ,mejelly-light-red-1))))

   `(minibuffer-prompt                       ((,class ( :foreground ,mejelly-light-fg
                                                        :background ,mejelly-light-bg))))

   `(mode-line                               ((,class ( :foreground ,mejelly-light-fg
                                                        :background nil))))
   `(mode-line-inactive                      ((,class ( :foreground ,mejelly-light-grey-3
                                                        :background nil))))

   `(org-checkbox                            ((,class ( :foreground ,mejelly-light-green-0))))
   `(org-date                                ((,class ( :foreground ,mejelly-light-purple-0))))
   `(org-done                                ((,class ( :foreground ,mejelly-light-green-0))))
   `(org-level-1                             ((,class ( :foreground ,mejelly-light-red-2))))
   `(org-level-2                             ((,class ( :foreground ,mejelly-light-red-0))))
   `(org-level-3                             ((,class ( :foreground ,mejelly-light-red-0))))
   `(org-special-keyword                     ((,class ( :foreground ,mejelly-light-purple-0))))
   `(org-todo                                ((,class ( :foreground ,mejelly-light-yellow-0))))

   `(region                                  ((,class ( :background ,mejelly-light-purple-1))))

   `(smerge-markers                          ((,class ( :foreground ,mejelly-light-yellow-0
                                                        :background ,mejelly-light-bg))))
   `(smerge-refined-change                   ((,class ( :foreground ,mejelly-light-green-0))))

   `(sml/modes                               ((,class ( :foreground ,mejelly-light-yellow-2))))

   `(trailing-whitespace                     ((,class ( :background ,mejelly-light-red-1))))

   `(web-mode-builtin-face                   ((,class ( :foreground ,mejelly-light-blue-0))))
   `(web-mode-current-element-highlight-face ((,class ( :foreground ,mejelly-light-red-1
                                                        :background nil))))

   `(web-mode-html-attr-name-face            ((,class ( :foreground ,mejelly-light-purple-0))))
   `(web-mode-html-tag-face                  ((,class ( :foreground ,mejelly-light-fg))))
   `(web-mode-symbol-face                    ((,class ( :foreground ,mejelly-light-blue-1))))

   `(trailing-whitespace                     ((,class ( :background ,mejelly-light-red-1))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'mejelly-light)

;;; mejelly-light-theme.el ends here
