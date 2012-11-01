;;; ruby-comint.el --- run a ruby process in a compilation buffer
;;
;; Copyright (C) 2011 Jose Pablo Barrantes
;;
;; Author: Jose Pablo Barrantes <xjpablobrx@gmail.com>
;; Version: 0.1
;; This file is not currently part of GNU Emacs.
;;
;; License:
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.
;;
;; Commentary:
;; Allow for execution of ruby processes dumping the results into a
;; compilation buffer.  Useful for executing tests.
;;
;; Functions:
;;
;;     M-x ruby-compile-file
;;     M-x ruby-compile-region
;;
;; Installation:
;;
;; In your shell:
;;
;;     $ cd ~/.emacs.d/vendor
;;     $ git clone git://github.com/jpablobr/ruby-comint.git
;;
;; In your emacs config:
;;
;;     (add-to-list 'load-path "~/.emacs.d/vendor/ruby-comint")
;;     (require 'ruby-comint)
;;
;; You might also like to add some keybings:
;;
;;     C-C r -- ruby commands
;;     (global-set-key (kbd "C-C r f") 'ruby-compile-file)
;;     (global-set-key (kbd "C-C r r") 'ruby-compile-region)
;;
;; Thanks

;;; Code:

(defcustom ruby-comint-buffer-name "*Ruby-Execution*"
  "The name of the scratch buffer used when compiling Ruby."
  :type 'string
  :group 'ruby)

(defcustom ruby-comint-cursor t
"Send the current region to the inferior Ruby process,
and switch to the process buffer."
  :type 'boolean
  :group 'ruby)

(defun ruby-compile-file ()
  "Run the current buffer in a ruby subprocess."
  (interactive)
  (compilation-start
   (concat "/usr/bin/env ruby " (buffer-name (current-buffer)) " result:\n")
   nil
   (lambda (x) ruby-comint-buffer-name)) )

(defun ruby-compile-region (start end)
  "Run the current buffer in a ruby subprocess."
  (interactive "r")
  (let ((buffer (get-buffer ruby-comint-buffer-name)))
    (when buffer
      (kill-buffer buffer)))
  (call-process-region start end "ruby" nil
                       (get-buffer-create ruby-comint-buffer-name)
                       nil
                       "-w")
  (switch-to-ruby-compile ruby-comint-cursor)
  (funcall 'ruby-mode)
  (goto-char (point-min)))

(defun switch-to-ruby-compile (eob-p)
  "Switch to the *Ruby-Execution* buffer.
With argument, positions cursor at end of buffer."
  (interactive "P")
  (if eob-p ( pop-to-buffer ruby-comint-buffer-name)
    push-mark
    (goto-char (point-max))))

;; minor mode
(defvar ruby-comint-minor-mode-map
  (let ((map (make-sparse-keymap)))
    map)
  "Key map for Ruby Comint minor mode.")

(define-minor-mode ruby-comint-minor-mode
  "Enable Ruby Comint minor mode providing some key-bindings
  for navigating ruby compilation buffers."
  nil
  " Ruby:Comint"
  ruby-comint-minor-mode-map)

(provide 'ruby-comint)
;;; ruby-comint.el ends here
