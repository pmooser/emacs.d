;; make sure things in my bin directory can be found:
(defconst bin-dir (concat (getenv "HOME") "/bin"))
(setenv "PATH" (concat (getenv "PATH") ":" bin-dir))
(setq exec-path (append exec-path (list bin-dir)))

;; load my elisp directories:
(defconst elisp-dir (locate-user-emacs-file "elisp"))
(defconst personal-dir (locate-user-emacs-file "personal"))

(load (concat elisp-dir "/subdirectories.el"))

(setq load-path
     (append (list elisp-dir personal-dir)
             (subdirectories elisp-dir)
             (subdirectories personal-dir)
             load-path))

;; This is intended for machine-local changes, and thus won't
;; actually be checked into the repo.
(defconst local-settings (locate-user-emacs-file "local.el"))
(if (file-exists-p local-settings)
    (load local-settings))

;; start a server so we can open files in an emacs instance from the cmd line
(server-start)

;;;;
;; general appearance and behavior
;;;;

;; goto-line key
(global-set-key (kbd "M-g") 'goto-line)

;; UNBINDINGS:
;; Bind C-z to ANYTHING other than the annoying minimize
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "M-t") nil)

(setq ns-command-modifier 'meta)
;;(setq ns-option-modifier 'super)

(tool-bar-mode 0)
(blink-cursor-mode 0)
(setq default-truncate-lines t)
(setq inhibit-startup-message t)

(transient-mark-mode 1)

;; always ask y/n instead of yes/noq
(fset 'yes-or-no-p 'y-or-n-p)

;; spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Visual characteristics:
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)

;; bs
(require 'bs)
(global-set-key (kbd "C-x C-b") 'bs-show)

;;;;
;; backups and auto-saves
;;;;

(defvar backup-dir "~/.emacs-backup/")

(make-directory backup-dir t)

(setq version-control     t     ; numbered backups
      backup-by-copying   t     ; copy, don't clobber symlinks
      ;kept-new-versions   6
      ;kept-old-versions   2
      delete-old-versions t
      ;; put auto-save files in the backup dir
      auto-save-file-name-transforms `(("\\(?:[^/]*/\\)*\\(.*\\)" ,(concat backup-dir "\\1") t))
      backup-directory-alist `(("." . ,backup-dir)))

;;;;
;; package management
;;;;

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)

(defun pin-packages (&rest pairs)
  (dolist (p pairs)
    (add-to-list 'package-pinned-packages p t)))

(pin-packages '(cider . "melpa-stable"))

(defun ensure-packages-installed (&rest packages)
  (dolist (p packages)
    (unless (package-installed-p p)
      (package-install p))))

;; refresh the contents if the elpa directory is missing
(unless (file-exists-p "~/.emacs.d/elpa")
  (package-refresh-contents))

(ensure-packages-installed
 'ac-cider
 'cider
 'clojure-mode
 'company
 'expand-region
 'idle-highlight-mode
 'magit 
 'multiple-cursors
 'rainbow-delimiters
 'paredit
 'undo-tree)

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; ido mode
(require 'ido)
(ido-mode t)

;; undo tree
(require 'undo-tree)
(global-undo-tree-mode)

;; multiple-cursors
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; loading my personal customizations
(require 'paul-clojure)
(require 'paul-advice)
(require 'paul-utils)

(global-set-key (kbd "C-;") 'toggle-comment-region-or-line)

;; default frame characteristics
(setq default-frame-alist
      '((font . "Menlo-13")
        (top    . 50)
        (left   . 80)
        (width  . 120)
        (height . 60)
        (cursor-color . "grey40")
        (cursor-type . box)
        (foreground-color . "white")
        (background-color . "black")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-stacktrace-face ((t (:inherit default :foreground "SkyBlue1"))))
 '(diff-added ((t (:inherit diff-changed :background "LightGreen" :foreground "black"))))
 '(diff-indicator-added ((t (:inherit diff-added :background "black" :foreground "LightGreen"))))
 '(diff-indicator-removed ((t (:inherit diff-removed :background "black" :foreground "LightPink"))))
 '(diff-removed ((t (:inherit diff-changed :background "pink" :foreground "black"))))
 '(idle-highlight ((t (:inherit region :background "grey25"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#FFAAAA"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#FFAA55"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#FFFFAA"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#55FF55"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#AAAAFF"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#C3AAD5"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#DAAAFF"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#FFAAFF"))))
 '(rainbow-delimiters-unmatched-face ((t (:background "grey" :foreground "red")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-enable-flex-matching t)
 '(ns-antialias-text nil))
