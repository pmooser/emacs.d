;; lsp   -*- lexical-binding: t; -*-

;; (setq lsp-clojure-custom-server-command '("bash" "-c" "/opt/homebrew/bin/clojure-lsp"))

(use-package lsp-mode
  :hook ((clojure-mode . lsp)
         (cloure-script-mode . lsp)
         (clojurec-mode .lsp))
  :config
  (setq gc-cons-threshold (* 100 1024 1024)
        read-process-output-max (* 1024 1024)
        treemacs-space-between-root-nodes nil
        ;; turn off the path breadcrumb at the top:
        lsp-headerline-breadcrumb-enable nil)
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package flycheck)

;; (use-package treemacs
;;   :config
;;   (setq treemacs-display-in-side-window nil))

;; (use-package lsp-treemacs
;;   :after treemacs
;;   :commands lsp-treemacs-errors-list)



