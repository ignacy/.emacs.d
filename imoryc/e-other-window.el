;;; e-other-window.el --- flash windows when you change to them.

;; $Id: e-other-window.el,v 1.10 2003/01/10 05:57:59 burton Exp $

;; Copyright (C) 2000-2003 Free Software Foundation, Inc.
;; Copyright (C) 2000-2003 Kevin A. Burton (burton@openprivacy.org)

;; Author: Kevin A. Burton (burton@openprivacy.org)
;; Maintainer: Kevin A. Burton (burton@openprivacy.org)
;; Location: http://relativity.yi.org
;; Keywords:
;; Version: 1.0.3

;; This file is [not yet] part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation; either version 2 of the License, or any later version.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
;; details.
;;
;; You should have received a copy of the GNU General Public License along with
;; this program; if not, write to the Free Software Foundation, Inc., 59 Temple
;; Place - Suite 330, Boston, MA 02111-1307, USA.

;;; Commentary:

;; The e-other-window package places an overlay across the current buffer after
;; you use `other-window'.  This keeps the user from being confused as to where
;; the current (point) is.
;;
;; The overlay is removed after `e-other-window-interval' seconds.  This is what
;; provides the flash effect.
;;
;; The major advantage is that instead of trying to find one small cursor in
;; your large emacs frame you can now just look for the 'flash'.  

;;; History:

;; - Mon Nov 12 2001 09:09 AM (burton@openprivacy.org): we are now using a
;; different face.  The original face suggested that a visible-bell was
;; signalled.

;; - Sun Nov 11 2001 10:27 PM (burton@openprivacy.org): RMS pointed out that I
;; didn't have a description.

;; - Sat Nov 10 2001 10:03 PM (burton@openprivacy.org): BUG: We have a BAD
;; timing (race condition) issue here I think.  I think that it MIGHT be
;; possible to blink a window TOO fast or not at all.  We run the timer but we
;; don't clear it when we go to another window, we just clear it globally.
;;

;; Sat Nov 10 2001 04:51 PM (burton@openprivacy.org): we not blink all the text
;; in the window-start -> window-end.
;;
;;   - Sat Nov 10 2001 04:55 PM (burton@openprivacy.org): we also blink a little
;;     faster

;;; TODO:
;;

;; - don't blink on window resize

;; - large windows blink slower... why is this?  Is there any way to make the
;; overlay happen faster?!

;; - 

;;; Code:
(defvar e-other-window-overlay (make-overlay 0 0) "Overlay used to blink this window.")

(defface e-other-window-overlay-face nil
  "Face used to blink the background")
(copy-face 'secondary-selection 'e-other-window-overlay-face)

(defvar e-other-window-interval .25 "Interval to sleep `e-other-window' for.")

(defvar e-other-window-timer nil "Timer used to erase clear the overlay.")

(defvar e-other-window-current-window nil "Temp variable to keep track of the current window.")

(defvar e-other-window-current-buffer nil "Temp variable to keep track of the current buffer.")

(defun e-other-window-blink()
  "Blink the currently selected window so that it is obvious what is going on."
  (interactive)

  (when e-other-window-timer
    (cancel-timer e-other-window-timer)
    (setq e-other-window-timer nil))
  
  (e-other-window-deactivate)
  
  (save-excursion
    (let(begin end)

      ;;for buffers with a size of 0... insert one line so that we can blink it.
      (if (equal (buffer-size) 0)
          (let((inhibit-read-only t))
            (insert "\n")))
      
      (setq begin (window-start))

      (goto-char (window-end))

      (goto-char (point-at-eol))
      
      (setq end (1+ (point)))

      (move-overlay e-other-window-overlay begin end (current-buffer))
      
      ;;sleep for an interval.. (should this be a timer?)
      
      (overlay-put e-other-window-overlay 'face 'e-other-window-overlay-face)
      
      (overlay-put e-other-window-overlay 'window (selected-window))

      (overlay-put e-other-window-overlay 'priority 1)

      ;;deactivate sometime in the future
      (setq e-other-window-timer (run-with-timer e-other-window-interval
                                                 nil
                                                 'e-other-window-deactivate)))))

(defun e-other-window-deactivate()
  "Deactive the current overlay"

  (delete-overlay e-other-window-overlay))

(defun e-other-window(arg)
  "Go to the other window and blink it."
  (interactive
   (list 1))

  (other-window arg)

  (e-other-window-blink))

;;FIXME: can you advise a native function.

(defadvice other-window(after e-other-window-ad(arg &optional all-frames))
  "FIXME: ..."
  
  ;;(e-other-window-blink)

  )
(ad-deactivate 'other-window)

;;FIXME: don't blink a window that is a NEW window (IE bs...)  how do we find
;;this out?

;; FIXME: also don't flash on window resizing...

(defadvice select-window(before e-other-window-select-window-before(window))
  "FIXME: ..."

  (setq e-other-window-current-buffer (current-buffer))
  
  (setq e-other-window-current-window (selected-window)))

(defadvice select-window(after e-other-window-select-window-after(window))
  "FIXME: ..."

  (add-hook 'post-command-hook 'e-other-window-blink-post-command t))

(ad-deactivate 'select-window)

(defun e-other-window-blink-post-command()
  "Function to run as a post command hook to determine if we should blink."

  ;;FIXME: don't blink if I have create a frame or if I have deleted a frame!!!
  
  (when (and e-other-window-current-window
             (not (equal e-other-window-current-window
                         (selected-window)))
             (not (equal e-other-window-current-buffer
                         (current-buffer))))

    (e-other-window-blink))

  (setq e-other-window-current-window nil)
  (setq e-other-window-current-buffer nil)
  
  (remove-hook 'post-command-hook 'e-other-window-blink-post-command))
  
;; (defadvice select-window(after e-select-window-ad(arg &optional ))
;;   "FIXME: ..."
;;
;;   (e-other-window-blink))
;;
;; (ad-deactivate 'select-window)
;;m
;; FIXME: this won't work.  Only flash when the current window is different than
;; the previous window.

(provide 'e-other-window)

;;; e-other-window.el ends here
