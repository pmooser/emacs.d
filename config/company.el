;; company mode configuration -*- lexical-binding: t -*-

(use-package company
  :hook (emacs-startup . pm/setup-company-mode)
  :preface
  (defun pm/setup-company-mode ()
    (setq
     ;; Use grouped backends, both LSP-mode (capf, completion at point function) and YASnippet
     company-backends '((:separate company-yasnippet company-capf))
     
     ;; UI config
     company-minimum-prefix-length     1
     company-idle-delay                0.2 ; default is 0.2
     company-tooltip-align-annotations t)
    (global-company-mode)))

