;; basic config  -*- lexical-binding: t; -*-
;;
;; global key bindings and default frame configs and such

(use-package dash
  :ensure t)

(setq-local potential-fonts '("Menlo-13" "Ubuntu Mono-16"))

(let* ((alist '((top    . 50)
                (left   . 80)
                (width  . 120)
                (height . 60)
                (cursor-color . "mediumslateblue")
                (cursor-type . box)
                (foreground-color . "white")
                (background-color . "black")))
       ;; look for a default font to use, and set it if found:
       (available-font (some (lambda (f) (when (x-list-fonts f) f)) potential-fonts))
       (alist (if available-font
                  (append `((font . ,available-font)) alist)
                alist)))
  (setq default-frame-alist alist))

;; always do a top/bottom split:
(setq
 split-width-threshold nil
 split-height-threshold 0)

;; install ivy and counsel:
(use-package counsel
  :ensure t)

(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "))

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

(use-package rect
  :ensure nil)

