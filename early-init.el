;;; early-init.el                                     -*- lexical-binding: t -*-
;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Borrowing liberally from: https://gitlab.com/manueljlin/emacs-config/-/blob/main/early-init.el

(defvar backup-dir "~/.emacs-backup/")
(make-directory backup-dir t)

(setq
 ;; Lockfiles, autosave and backups:
 create-lockfiles nil ; Stop Emacs from creating .#foo.txt if editing foo.txt

 backup-by-copying t ; don't clobber symlinks
 
 backup-directory-alist         `((".*" . ,backup-dir)) ; Save backups to backup-dir
 auto-save-file-name-transforms `((".*"   ,backup-dir t)) ; Save autosaves to backup-dir

 delete-old-versions t ; automatically delete old backup files
 version-control t ; use versioned backups
 
 ;; Don't load the startup screen:
 inhibit-startup-screen t)

