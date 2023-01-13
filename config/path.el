;; packages and code involving paths  -*- lexical-binding: t -*-

(use-package exec-path-from-shell
  :config
  (dolist (envvar '("PATH"))
    (add-to-list 'exec-path-from-shell-variables envvar))
  (exec-path-from-shell-initialize))

;; add support for BQN (in ~/.emacs.d/BQN):
(defconst bqn-dir (locate-user-emacs-file "BQN"))

(setq load-path (append (list  bqn-dir) load-path))

(use-package bqn-mode
  :ensure nil)

