;; bqn support  -*- lexical-binding: t -*-

;; add support for BQN (in ~/.emacs.d/BQN):
(defconst bqn-dir (locate-user-emacs-file "packages/BQN"))

(setq load-path (append (list bqn-dir) load-path))

(use-package bqn-mode
  :ensure nil)
