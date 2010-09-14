(setq dotfiles-dir "~/.emacs.d")
(setq imoryc-dir (concat dotfiles-dir "/imoryc"))

(set-scroll-bar-mode 'right)
(tool-bar-mode -1)
(menu-bar-mode -1)
(ido-mode t)
(setq backup-inhibited t)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.backup_for_emacs"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups
