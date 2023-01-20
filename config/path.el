;; packages and code involving paths  -*- lexical-binding: t -*-

(defconst elisp-dir (locate-user-emacs-file "elisp"))

(setq load-path (append (list elisp-dir) load-path))

(use-package exec-path-from-shell
  :config
  (dolist (envvar '("PATH"))
    (add-to-list 'exec-path-from-shell-variables envvar))
  (exec-path-from-shell-initialize))

