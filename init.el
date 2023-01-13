;;   -*- lexical-binding: t; -*-
;;;;

;;;;
;; new config experiments
;;;;

(tool-bar-mode 0)

;; start a server so we can open files in an emacs instance from the cmd line
(server-start)

;; SVG widget images don't work well with black backgrounds:
(setq widget-image-enable nil)

(defun load-config (config-file-name)
  "Load a configuration file from ./config/"
  (load (concat
         (concat (locate-user-emacs-file "config/")) config-file-name)))

(load-config "package-management.el")
(load-config "path.el")
(load-config "basic.el")
(load-config "company.el")
(load-config "paul-advice.el")
(load-config "lisps.el")
(load-config "clojure.el")
(load-config "modeline.el")
(load-config "utils.el")
(load-config "vc.el")
(load-config "lsp.el")

;;;;
;; END new config experiments
;;;;

;; add some directories to emacs' paths:
;; (defconst bin-dir (concat (getenv "HOME") "/bin"))
;; (setenv "PATH" (concat (getenv "PATH") ":" bin-dir ":/opt/homebrew/bin"))
;; (setq exec-path (append exec-path (list bin-dir "/usr/local/bin" "/opt/homebrew/bin")))

;; load my elisp directories:
;; (defconst elisp-dir (locate-user-emacs-file "elisp"))
;; (defconst personal-dir (locate-user-emacs-file "personal"))
;; (setq load-path (append (list personal-dir) load-path))

;; (defconst bqn-dir (locate-user-emacs-file "BQN"))

;; (load (concat elisp-dir "/subdirectories.el"))

;; (setq load-path
;;      (append (list elisp-dir personal-dir bqn-dir)
;;              (subdirectories elisp-dir)
;;              (subdirectories personal-dir)
;;              load-path))

;; ;; BQN
;; (require 'bqn-mode)

;; This is intended for machine-local changes, and thus won't"))
;; actually be checked into the repo.

;; (defconst local-settings (locate-user-emacs-file "local.el"))
;; (if (file-exists-p local-settings)
;;     (load local-settings))

;;;;
;; general appearance and behavior
;;;;

;; mode-line customizationclojure

;; (setq-default mode-line-format
;;               '("%e"
;;                 mode-line-front-space
;;                 ;; mode-line-mule-info
;;                 mode-line-client
;;                 mode-line-modified
;;                 ;; mode-line-remote
;;                 ;; mode-line-frame-identification
;;                 mode-line-buffer-identification
;;                 "   "
;;                 mode-line-position
;;                 ;; (vc-mode vc-mode)
;;                 "  "
;;                 mode-line-modes
;;                 mode-line-misc-info
;;                 mode-line-end-spaces))

;; ;; goto-line key
;; (global-set-key (kbd "M-g") 'goto-line)

;; ;; UNBINDINGS:
;; ;; Bind C-z to ANYTHING other than the annoying minimize
;; (global-set-key (kbd "C-z") nil)
;; (global-set-key (kbd "M-t") nil)
;; (global-set-key (kbd "M-`") 'ns-next-frame)

;; (setq ns-command-modifier 'meta)

;;(setq ns-option-modifier 'super)

;; (tool-bar-mode 0)
;; (blink-cursor-mode 0)
;; (setq default-truncate-lines t)

;; (transient-mark-mode 1)

;; ;; always ask y/n instead of yes/noq
;; (fset 'yes-or-no-p 'y-or-n-p)

;; spaces instead of tabs
;; (setq-default indent-tabs-mode nil)

;; Visual characteristics:
;; (require 'font-lock)
;; (setq font-lock-maximum-decoration t)
;; (global-font-lock-mode t)

;; bs
;; (require 'bs)
;; (global-set-key (kbd "C-x C-b") 'bs-show)

;;;;
;; backups and auto-saves
;;;;

;; (defvar backup-dir "~/.emacs-backup/")

;; (make-directory backup-dir t)

;; (setq version-control     t     ; numbered backups
;;       backup-by-copying   t     ; copy, don't clobber symlinks
;;       ;kept-new-versions   6
;;       ;kept-old-versions   2
;;       delete-old-versions t
;;       ;; put auto-save files in the backup dir
;;       auto-save-file-name-transforms `(("\\(?:[^/]*/\\)*\\(.*\\)" ,(concat backup-dir "\\1") t))
;;       backup-directory-alist `(("." . ,backup-dir)))

;;;;
;; package management
;;;;

;; (require 'package)

;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; (setq package-archives
;;      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
;;        ("MELPA Stable" . "https://stable.melpa.org/packages/")
;;        ("MELPA"        . "https://melpa.org/packages/"))
;;      package-archive-priorities
;;      '(("MELPA Stable" . 10)
;;        ("GNU ELPA"     . 5)
;;        ("MELPA"        . 0)))

;; (package-initialize)

;; (defun pin-packages (&rest pairs)
;;   (dolist (p pairs)
;;     (add-to-list 'package-pinned-packages p t)))

;; (pin-packages '(cider . "melpa"))
;; (pin-packages '(cider . "MELPA Stable"))

;; (defun ensure-packages-installed (&rest packages)
;;   (dolist (p packages)
;;     (unless (package-installed-p p)
;;       (package-install p))))

;; refresh the contents if the elpa directory is missing
;; (unless (file-exists-p "~/.emacs.d/elpa")
;;   (package-refresh-contents))

;; (ensure-packages-installed
;;  ;; 'ac-cider
;;  'cider
;;  'clojure-mode
;;  'lsp-mode
;;  'lsp-treemacs
;;  'flycheck
;;  'company
;;  'expand-region
;;  'idle-highlight-mode
;;  'magit 
;;  'multiple-cursors
;;  'rainbow-delimiters
;;  'paredit
;;  'undo-tree
;;  'ws-butler
;;  ;; mode line minor mode menu:
;;  'minions
;;  'doom-modeline
;;  'all-the-icons)

;; version control
;; (require 'vc)

;; expand region
;; (require 'expand-region)
;; (global-set-key (kbd "C-=") 'er/expand-region)

;; ido mode
;; (require 'ido)
;; (ido-mode t)

;; undo tree
;; (require 'undo-tree)
;; (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
;; (global-undo-tree-mode)

;; multiple-cursors
;; (require 'multiple-cursors)

;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; loading my personal customizations
;; (require 'paul-clojure)
;; (require 'paul-advice)
;; (require 'paul-utils)

;; (global-set-key (kbd "C-;") 'toggle-comment-region-or-line)

;; cleanup whitespace of changed lines:
;; (require 'ws-butler)
;; (add-hook 'clojure-mode-hook #'ws-butler-mode)
;; (add-hook 'css-mode-hook #'ws-butler-mode)

;; default frame characteristics
;; (setq default-frame-alist
;;       '((font . "Menlo-13")
;;         (top    . 50)
;;         (left   . 80)
;;         (width  . 120)
;;         (height . 60)
;;         (cursor-color . "mediumslateblue")
;;         (cursor-type . box)
;;         (foreground-color . "white")
;;         (background-color . "black")))

;; all-the-icons
;; (require 'all-the-icons)

;; enable minions mode
;; (minions-mode 1)

;; doom modeline
;; (doom-modeline-mode 1)
;;(setq doom-modeline-buffer-file-name-style 'auto)
;; (setq doom-modeline-icon t)
;; (setq doom-modeline-major-mode-icon t)
;; (setq doom-modeline-major-mode-color-icon t)
;; (setq doom-modeline-minor-modes t)
;; (setq doom-modeline-buffer-encoding nil)

;; (set-face-background 'modeline "blue")

;; (set-face-attribute 'mode-line nil
;;                     :background "#353644"
;;                     :foreground "white"
;;                     :box '(:line-width 1 :color "#353644")
;;                     :overline nil
;;                     :underline nil)

;;;;
;; CIDER
;;;;

;; (setq cider-default-cljs-repl 'shadow)

;; always do a top/bottom split:
;; (setq
;;  split-width-threshold nil
;;  split-height-threshold 0)

;; (defun get-string-from-file (filePath)
;;   "Return filePath's file content."
;;   (with-temp-buffer
;;     (insert-file-contents filePath)
;;     (buffer-string)))

;; NOTE - cider gets confused sometimes, so we might have to occasionally explicitly call:
;;   cider-set-repl-type

;; (defun clj-connect (project-name)
;;   "Connect to nREPL for `project-name`."
;;   (interactive "sProject name: ")
;;   (let ((project-dir (concat "/Users/pmooser/work/projects/" project-name)))
;;     (when (not (file-directory-p project-dir))
;;       (error "No such project directory: %s" project-dir))
;;     (let* ((nrepl-port (string-to-number (get-string-from-file (concat project-dir "/.nrepl-port"))))
;;            (params (list :host "localhost" :port nrepl-port :project-dir project-dir)))
;;       (cider-connect-clj params))))

;; (defun shadow-connect (project-name)
;;   "Connect to shadow-cljs nREPL for `project-name`. Assumes we already have another nREPL connection."
;;   (interactive "sProject name: ")
;;   (let ((project-dir (concat "/Users/pmooser/work/projects/" project-name)))
;;     (when (not (file-directory-p project-dir))
;;       (error "No such project directory: %s" project-dir))
;;     (let* ((nrepl-port (string-to-number (get-string-from-file (concat project-dir "/.shadow-cljs/nrepl.port"))))
;;            (params (list :host "localhost" :port nrepl-port :cljs-repl-type 'shadow)))
;;       (if (null (cider-repls))
;;         (cider-connect-cljs params)
;;         (cider-connect-sibling-cljs params)))))

;;;;
;; LSP
;;;;

;; (add-hook 'clojure-mode-hook 'lsp)
;; (add-hook 'clojurescript-mode-hook 'lsp)
;; (add-hook 'clojurec-mode-hook 'lsp)

;; (setq gc-cons-threshold (* 100 1024 1024)
;;       read-process-output-max (* 1024 1024)
;;       treemacs-space-between-root-nodes nil
;;       company-minimum-prefix-length 1
;;       ;; header at top of buffer:
;;       lsp-headerline-breadcrumb-enable nil
;;       lsp-lens-enable nil
;;       lsp-signature-auto-activate nil
;;       ;; lsp-enable-indentation nil ;; uncomment to use cider indentation instead of lsp
;;       ;; lsp-enable-completion-at-point nil ;; uncomment to use cider completion instead of lsp
;;       )

;;;;
;; faces
;;;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-result-overlay-face ((t (:background "dark cyan" :box (:line-width (2 . -1) :color "MediumPurple3")))))
 '(cider-stacktrace-face ((t (:inherit default :foreground "SkyBlue1"))))
 '(company-echo-common ((t (:foreground "SpringGreen2"))))
 '(company-scrollbar-bg ((t (:background "gray15"))))
 '(company-tooltip ((t (:background "grey50" :foreground "white"))))
 '(company-tooltip-common ((t (:foreground "SpringGreen2"))))
 '(company-tooltip-common-selection ((t (:foreground "dark green" :inherit company-tooltip-common))))
 '(company-tooltip-selection ((t (:background "DarkSlateGray1" :foreground "black"))))
 '(diff-added ((t (:inherit diff-changed :background "LightGreen" :foreground "black"))))
 '(diff-indicator-added ((t (:inherit diff-added :background "black" :foreground "LightGreen"))))
 '(diff-indicator-removed ((t (:inherit diff-removed :background "black" :foreground "LightPink"))))
 '(diff-removed ((t (:inherit diff-changed :background "pink" :foreground "black"))))
 '(doom-modeline-bar ((t (:inherit doom-modeline-highlight :background "DeepSkyBlue1"))))
 '(doom-modeline-buffer-minor-mode ((t (:inherit font-lock-doc-face :foreground "grey" :slant normal))))
 '(doom-modeline-buffer-modified ((t (:inherit (error bold) :foreground "orange"))))
 '(doom-modeline-project-dir ((t (:inherit (font-lock-string-face bold) :foreground "LightSkyBlue"))))
 '(idle-highlight ((t (:inherit region :background "grey25"))))
 '(mode-line ((t (:background "gray26" :foreground "gray90" :box (:line-width (1 . -1) :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "grey30" :foreground "gray70" :box (:line-width -1 :color "grey40") :weight light))))
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
 '(ns-antialias-text t)
 '(package-selected-packages
   '(flycheck lsp-treemacs lsp-mode magit doom-modeline minions all-the-icons cider expand-region idle-highlight-mode paredit rainbow-delimiters company ws-butler undo-tree multiple-cursors exec-path-from-shell use-package)))

;; scroll left/right using trackpad gestures
;; (setq mouse-wheel-tilt-scroll t)
;; (setq mouse-wheel-flip-direction t)
