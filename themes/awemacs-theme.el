;;; awemacs-theme.el - an Emacs color theme by Aaron Weiss

;; Copyright (c) 2017 Aaron Weiss

;; Author: Aaron Weiss <awe@pdgn.co>
;;
;; URL: https://github.com/aatxe/dotfiles
;; Version: 1.0.0

;; Package-Requires: ((autothemer "0.2"))

;;; Code:
(eval-when-compile
  (require 'cl-lib))

(require 'autothemer)

;; assumed based on gruvbox
(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))
;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))
(autothemer-deftheme
 awemacs
 "An Emacs color theme by Aaron Weiss"

 ;; Color Palette:
 ((((class color) (min-colors #xFFFFFF))
   ((class color) (min-colors #xFF)))

  (awemacs-dark "#212121" nil)
  (awemacs-hl "#282828" nil)
  (awemacs-off-dark "#424242" nil)
  (awemacs-light "#9E9E9E" nil)
  (awemacs-white "#F5F5F5" nil)
  (awemacs-grey "#616161" nil)

  (awemacs-bright-red "#EC407A" nil)
  (awemacs-bright-green "#66BB6A" nil)
  (awemacs-bright-yellow "#FFEE58" nil)
  (awemacs-bright-blue "#5C6BC0" nil)
  (awemacs-bright-purple "#AB47BC" nil)
  (awemacs-bright-cyan "#26A69A" nil)
  (awemacs-bright-orange "#FFA726" nil)

  (awemacs-red "#F06292" nil)
  (awemacs-green "#81C784" nil)
  (awemacs-yellow "#FFF176" nil)
  (awemacs-blue "#7986CB" nil)
  (awemacs-purple "#BA68C8" nil)
  (awemacs-cyan "#4DB6AC" nil)
  (awemacs-orange "#FFB74D" nil)

  (awemacs-delimiter-one "#F06292" nil)
  (awemacs-delimiter-two "#7986CB" nil)
  (awemacs-delimiter-three "#E57373" nil)
  (awemacs-delimiter-four "#AED581" nil))

 ;; Specifications:
 ((default (:background awemacs-dark :foreground awemacs-light))
  (cursor (:background awemacs-off-dark))
  (mode-line (:background awemacs-dark :foreground awemacs-light :box nil))
  (mode-line-inactive (:background awemacs-dark :foreground awemacs-light :box nil))
  (fringe (:background awemacs-dark))
  (hl-line (:background awemacs-hl))
  (region (:background awemacs-off-dark))
  (secondary-selection (:background awemacs-off-dark))
  (minibuffer-prompt (:background awemacs-dark :foreground awemacs-red :bold t))
  (vertical-border (:foreground awemacs-dark))
  (window-divider (:foreground awemacs-dark))
  (link (:foreground awemacs-blue :underline t))
  (shadow (:foreground awemacs-grey))

  ;; Built-in Syntax
  (font-lock-builtin-face (:foreground awemacs-orange))
  (font-lock-constant-face (:foreground awemacs-purple))
  (font-lock-string-face (:foreground awemacs-green))
  (font-lock-comment-face (:foreground awemacs-grey))
  (font-lock-function-name-face (:foreground awemacs-orange))
  (font-lock-variable-name-face (:foreground awemacs-blue))
  (font-lock-keyword-face (:foreground awemacs-red))
  (font-lock-type-face (:foreground awemacs-purple))
  (font-lock-warning-face (:foreground awemacs-bright-red :bold t))

  ;; Basic Faces
  (error (:foreground awemacs-bright-red :bold t))
  (success (:foreground awemacs-bright-green :bold t))
  (warning (:foreground awemacs-bright-yellow :bold t))
  (trailing-whitespace (:background awemacs-light))
  (escape-glyph (:foreground awemacs-cyan))
  (header-line (:background awemacs-dark :foreground awemacs-light :box nil :inherit nil))
  (highlight (:background awemacs-dark :foreground awemacs-light))
  (homoglyph (:foreground awemacs-bright-yellow))
  (match (:background awemacs-off-dark))

  ;; evil ex
  (evil-ex-commands (:foreground awemacs-light))
  (evil-ex-info (:foreground awemacs-bright-red))
  (evil-ex-lazy-highlight (:background awemacs-off-dark))
  (evil-ex-search (:background awemacs-off-dark))
  (evil-ex-substitute-matches (:background awemacs-dark))
  (evil-ex-substitute-replacement (:foreground awemacs-red :italic t))

  ;; rainbow delimiters
  (rainbow-delimiters-depth-1-face           (:foreground awemacs-delimiter-one))
  (rainbow-delimiters-depth-2-face           (:foreground awemacs-delimiter-two))
  (rainbow-delimiters-depth-3-face           (:foreground awemacs-delimiter-three))
  (rainbow-delimiters-depth-4-face           (:foreground awemacs-delimiter-four))
  (rainbow-delimiters-depth-5-face           (:foreground awemacs-delimiter-one))
  (rainbow-delimiters-depth-6-face           (:foreground awemacs-delimiter-two))
  (rainbow-delimiters-depth-7-face           (:foreground awemacs-delimiter-three))
  (rainbow-delimiters-depth-8-face           (:foreground awemacs-delimiter-four))
  (rainbow-delimiters-depth-9-face           (:foreground awemacs-delimiter-one))
  (rainbow-delimiters-depth-10-face          (:foreground awemacs-delimiter-two))
  (rainbow-delimiters-depth-11-face          (:foreground awemacs-delimiter-three))
  (rainbow-delimiters-depth-12-face          (:foreground awemacs-delimiter-four))
  (rainbow-delimiters-unmatched-face         (:background nil :foreground awemacs-light))

  ;; line numbers
  (line-number (:foreground awemacs-off-dark :background awemacs-dark))
  (line-number-current-line (:foreground awemacs-light :background awemacs-dark))
  (linum (:foreground awemacs-off-dark :background awemacs-dark))
  (linum-highlight-face (:foreground awemacs-light :background awemacs-dark))
  (linum-relative-current-face (:foreground awemacs-light :background awemacs-dark))

  ;; spaceline (evil mode colors)
  (spaceline-evil-emacs (:background awemacs-blue))
  (spaceline-evil-insert (:background awemacs-green))
  (spaceline-evil-motion (:background awemacs-purple))
  (spaceline-evil-normal (:background awemacs-orange))
  (spaceline-evil-replace (:background awemacs-bright-orange))
  (spaceline-evil-visual (:background awemacs-grey))

  ;; highlight indentation
  (highlight-indentation-current-column-face (:background awemacs-grey))
  (highlight-indentation-face (:background awemacs-off-dark))

  ;; smartparens
  (sp-pair-overlay-face (:background awemacs-grey))
  (sp-show-pair-match-face (:background awemacs-off-dark))
  (sp-show-pair-mismatch-face (:background awemacs-light))

  ;; diff
  (diff-changed (:background nil :foreground awemacs-light))
  (diff-added (:background nil :foreground awemacs-bright-green))
  (diff-removed (:background nil :foreground awemacs-bright-red))
  (diff-indicator-changed (:inherit 'diff-changed))
  (diff-indicator-added (:inherit 'diff-added))
  (diff-indicator-removed (:inherit 'diff-removed))

  ;; ediff
  (ediff-current-diff-A (:background awemacs-orange :foreground awemacs-white))
  (ediff-current-diff-Ancestor (:background awemacs-red :foreground awemacs-white))
  (ediff-current-diff-B (:background awemacs-green :foreground awemacs-white))
  (ediff-current-diff-C (:background awemacs-yellow :foreground awemacs-white))
  (ediff-even-diff-A (:background awemacs-orange :foreground awemacs-white))
  (ediff-even-diff-Ancestor (:background awemacs-red :foreground awemacs-white))
  (ediff-even-diff-B (:background awemacs-green :foreground awemacs-white))
  (ediff-even-diff-C (:background awemacs-yellow :foreground awemacs-white))
  (ediff-fine-diff-A (:background awemacs-orange :foreground awemacs-white))
  (ediff-fine-diff-Ancestor (:background awemacs-red :foreground awemacs-white))
  (ediff-fine-diff-B (:background awemacs-green :foreground awemacs-white))
  (ediff-fine-diff-C (:background awemacs-yellow :foreground awemacs-white))
  (ediff-odd-diff-A (:background awemacs-orange :foreground awemacs-white))
  (ediff-odd-diff-Ancestor (:background awemacs-red :foreground awemacs-white))
  (ediff-odd-diff-B (:background awemacs-green :foreground awemacs-white))
  (ediff-odd-diff-C (:background awemacs-yellow :foreground awemacs-white))

  ;; company-mode
  (company-scrollbar-bg (:background awemacs-dark))
  (company-scrollbar-fg (:background awemacs-hl))
  (company-tooltip (:background awemacs-hl))
  (company-tooltip-annotation (:background awemacs-green))
  (company-tooltip-annotation-selection (:inherit 'company-tooltip-annotation))
  (company-tooltip-selection (:foreground awemacs-red :background awemacs-dark))
  (company-tooltip-common (:foreground awemacs-red))
  (company-tooltip-common-selection (:foreground awemacs-red :bold t))
  (company-preview-common (:foreground awemacs-light))
  (company-preview (:background awemacs-blue))
  (company-preview-search (:background awemacs-blue))

  ;; ivy
  (ivy-current-match (:foreground awemacs-red :bold t :background awemacs-hl))
  (ivy-minibuffer-match-face-1 (:foreground awemacs-bright-orange))
  (ivy-minibuffer-match-face-2 (:foreground awemacs-bright-yellow))
  (ivy-minibuffer-match-face-3 (:foreground awemacs-orange))
  (ivy-minibuffer-match-face-4 (:foreground awemacs-yellow)))

 ;; Evaluated Forms:
 (custom-theme-set-variables 'awemacs
                             `(ansi-color-names-vector
                               [,awemacs-dark
                                ,awemacs-red
                                ,awemacs-green
                                ,awemacs-yellow
                                ,awemacs-blue
                                ,awemacs-purple
                                ,awemacs-cyan
                                ,awemacs-light])))

(provide-theme 'awemacs)
(provide 'awemacs)
