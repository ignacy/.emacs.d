;;; oscuro-theme.el --- an Emacs 24 theme based on Oscuro (tmTheme)
;;
;;; Author: Auto Converted to Emacs 24 by tmtheme-to-deftheme (tm2deftheme)
;;; Version: 1406715459
;;; Original author: 
;;; Url: https://github.com/emacsfodder/tmtheme-to-deftheme
;;; Package-Requires: ((emacs "24.0"))
;;
;;; Commentary:
;;  This theme was automatically generated by tmtheme-to-deftheme (tm2deftheme),
;;  from Oscuro (tmTheme) by 
;;
;;; Code:

(deftheme oscuro
  "oscuro-theme - Created by tmtheme-to-deftheme - 2014-07-30 12:17:39 +0200")

(custom-theme-set-variables
 'oscuro
)

(custom-theme-set-faces
 'oscuro
 ;; basic theming.

 '(default ((t (:foreground "#F1F1F1" :background "#344545" ))))
 '(region  ((t (:background "#2D3C3D"))))
 '(cursor  ((t (:background "#E87E88"))))

 ;; Temporary defaults
 '(linum                               ((t (:foreground "#5a6767"  :background "#475656" ))))
 '(fringe                              ((t (                       :background "#475656" ))))

 '(minibuffer-prompt                   ((t (:foreground "#1278A8"  :background nil       :weight bold                                  ))))
 '(escape-glyph                        ((t (:foreground "orange"   :background nil                                                     ))))
 '(highlight                           ((t (:foreground "orange"   :background nil                                                     ))))
 '(shadow                              ((t (:foreground "#777777"  :background nil                                                     ))))

 '(trailing-whitespace                 ((t (:foreground "#FFFFFF"  :background "#C74000"                                               ))))
 '(link                                ((t (:foreground "#00b7f0"  :background nil       :underline t                                  ))))
 '(link-visited                        ((t (:foreground "#4488cc"                        :underline t :inherit (link)                  ))))
 '(button                              ((t (:foreground "#FFFFFF"  :background "#444444" :underline t :inherit (link)                  ))))
 '(next-error                          ((t (                                             :inherit (region)                             ))))
 '(query-replace                       ((t (                                             :inherit (isearch)                            ))))
 '(header-line                         ((t (:foreground "#EEEEEE"  :background "#444444" :box nil :inherit (mode-line)                 ))))

 '(mode-line-highlight                 ((t (                                             :box nil                                      ))))
 '(mode-line-emphasis                  ((t (                                             :weight bold                                  ))))
 '(mode-line-buffer-id                 ((t (                                             :box nil :weight bold                         ))))

 '(mode-line-inactive                  ((t (:foreground "#c1c1c1"  :background "#475656" :box nil :weight light :inherit (mode-line)   ))))
 '(mode-line                           ((t (:foreground "#f1f1f1"  :background "#475656" :box nil ))))

 '(isearch                             ((t (:foreground "#99ccee"  :background "#444444"                                               ))))
 '(isearch-fail                        ((t (                       :background "#ffaaaa"                                               ))))
 '(lazy-highlight                      ((t (                       :background "#77bbdd"                                               ))))
 '(match                               ((t (                       :background "#3388cc"                                               ))))

 '(tooltip                             ((t (:foreground "black"    :background "LightYellow" :inherit (variable-pitch)                 ))))

 '(js3-function-param-face             ((t (:foreground "#BFC3A9"                                                                      ))))
 '(js3-external-variable-face          ((t (:foreground "#F0B090"  :bold t                                                             ))))

 '(secondary-selection                 ((t (                       :background "#342858"                                               ))))
 '(cua-rectangle                       ((t (:foreground "#E0E4CC"  :background "#342858" ))))

 ;; Magit hightlight
 '(magit-item-highlight                ((t (:foreground "white" :background "#1278A8" :inherit nil ))))

 ;; flyspell-mode
 '(flyspell-incorrect                  ((t (:underline "#AA0000" :background nil :inherit nil ))))
 '(flyspell-duplicate                  ((t (:underline "#009945" :background nil :inherit nil ))))

 ;; flymake-mode
 '(flymake-errline                     ((t (:underline "#AA0000" :background nil :inherit nil ))))
 '(flymake-warnline                    ((t (:underline "#009945" :background nil :inherit nil ))))

 ;;git-gutter
 '(git-gutter:added                    ((t (:foreground "#609f60" :bold t))))
 '(git-gutter:modified                 ((t (:foreground "#3388cc" :bold t))))
 '(git-gutter:deleted                  ((t (:foreground "#cc3333" :bold t))))

 '(diff-added                          ((t (:background "#305030"))))
 '(diff-removed                        ((t (:background "#903010"))))
 '(diff-file-header                    ((t (:background "#362145"))))
 '(diff-context                        ((t (:foreground "#E0E4CC"))))
 '(diff-changed                        ((t (:foreground "#3388cc"))))
 '(diff-hunk-header                    ((t (:background "#242130"))))


 '(font-lock-string-face ((t (:foreground "#E0E4CC"  ))))
 '(font-lock-comment-face ((t (:foreground "#999999"  ))))
 '(font-lock-builtin-face ((t (:foreground "#45B099"  ))))
 '(font-lock-variable-name-face ((t (  ))))
 '(font-lock-keyword-face ((t (:foreground "#45B099"  ))))
 '(font-lock-type-face ((t (:foreground "#EADC96"  ))))
 '(font-lock-function-name-face ((t (:foreground "#EADC96"  ))))
 '(js3-function-param-face ((t (:foreground "#999999"  ))))
 '(js2-function-param ((t (:foreground "#999999"  ))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#999999"  ))))

;; Rainbow delimiters
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#317c6b"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#368876"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#3b9581"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#40a18c"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#44ad96"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#4bb8a0"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#58bda7"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#64c2ad"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#70c7b4"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#FF0000"))))
) ;; End face definitions

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'oscuro)

;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; oscuro-theme.el ends here