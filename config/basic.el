;; basic config  -*- lexical-binding: t; -*-
;;
;; global key bindings and default frame configs and such

(setq default-frame-alist
      '((font . "Menlo-13")
        (top    . 50)
        (left   . 80)
        (width  . 120)
        (height . 60)
        (cursor-color . "mediumslateblue")
        (cursor-type . box)
        (foreground-color . "white")
        (background-color . "black")))

;; always do a top/bottom split:
(setq
 split-width-threshold nil
 split-height-threshold 0)

(use-package ido
  :ensure nil
  :config
  (ido-mode t))

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)))

(use-package undo-tree
  :init
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  :config
  (global-undo-tree-mode))

(use-package ws-butler
  :hook (clojure-mode clojurescript-mode css-mode))

;; visual characteristics:
(use-package font-lock
  :ensure nil
  :config
  (setq font-lock-maximum-decoration t)
  (global-font-lock-mode t))

;; goto-line key
(global-set-key (kbd "M-g") 'goto-line)

;; UNBINDINGS:
;; Bind C-z to ANYTHING other than the annoying minimize
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "M-t") nil)
(global-set-key (kbd "M-`") 'ns-next-frame)

(setq ns-command-modifier 'meta)

(setq default-truncate-lines t)

(transient-mark-mode 1)

;; always ask y/n instead of yes/noq
(fset 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil)

(use-package bs
  :ensure nil
  :bind (("C-x C-b" . bs-show)))

