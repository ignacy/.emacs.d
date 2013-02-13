(require 'erc)

(require 'erc-match)
(setq erc-keywords '("ignacy"))
(erc-match-mode)

(require 'erc-track)
(erc-track-mode t) ; was (erc-track-modified-channels-mode t)
                                        ; Note: erc-track-modified-channels-mode changed
                                        ; to erc-track-mode as of erc-track.el
                                        ; CVS revision 1.23 (November 2002)
(add-hook 'erc-mode-hook
          '(lambda ()
             (require 'erc-pcomplete)
             (pcomplete-erc-setup)
             (erc-completion-mode 1)))


(require 'erc-fill)
(erc-fill-mode t)

(require 'erc-ring)
(erc-ring-mode t)

(require 'erc-netsplit)
(erc-netsplit-mode t)

(erc-timestamp-mode t)
(setq erc-timestamp-format "[%R-%m/%d]")

(erc-button-mode nil) ;slow

(setq erc-user-full-name "Ignacy Moryc")
(setq erc-email-userid "imoryc@gmail.com")

;; logging:
(setq erc-log-insert-log-on-open nil)
(setq erc-log-channels t)
(setq erc-log-channels-directory "~/.irclogs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps nil)

(defadvice save-buffers-kill-emacs (before save-logs (arg) activate)
  (save-some-buffers t (lambda () (when (and (eq major-mode 'erc-mode)
                                        (not (null buffer-file-name)))))))

(add-hook 'erc-insert-post-hook 'erc-save-buffer-in-logs)
(add-hook 'erc-mode-hook '(lambda () (when (not (featurep 'xemacs))
                                  (set (make-variable-buffer-local
                                        'coding-system-for-write)
                                       'emacs-mule))))
;; end logging

;; Truncate buffers so they don't hog core.
(setq erc-max-buffer-size 20000)
(defvar erc-insert-post-hook)
(add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
(setq erc-truncate-buffer-on-save t)

;;; Finally, connect to the networks.
(defun irc-maybe ()
  "Connect to IRC."
  (interactive)
  (when (y-or-n-p "IRC? ")
    (erc :server "127.0.0.1" :port 6667
         :nick "Ignacy" :password "eleostechnologies:f1ac4713c56a7ab0c8a13104fdc9d1aba8b26cb1" :full-name "Ignacy Moryc")))


(provide 'init-erc)
