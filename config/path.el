;; packages and code involving paths  -*- lexical-binding: t -*-

(use-package exec-path-from-shell
  :config
  (dolist (envvar '("PATH"))
    (add-to-list 'exec-path-from-shell-variables envvar))
  (exec-path-from-shell-initialize))

