;; lsp   -*- lexical-binding: t; -*-

;; (setq lsp-clojure-custom-server-command '("bash" "-c" "/opt/homebrew/bin/clojure-lsp"))

(use-package lsp-mode
  :hook ((clojure-mode . lsp)
         (cloure-script-mode . lsp)
         (clojurec-mode .lsp))
  :config
  (setq gc-cons-threshold (* 100 1024 1024)
        read-process-output-max (* 1024 1024)
        ;; log:
        ;; lsp-log-io t
        ;; try to avoid pause on pasting text:
        ;; lsp-enable-on-type-formatting nil
        lsp-enable-indentation nil
        ;; treemacs-space-between-root-nodes nil
        ;; turn off count of warnings/errors/etc in modeline:
        ;;   (since lsp-treemacs is broken you can't do anything with it anyway)
        lsp-modeline-diagnostics-enable nil
        ;; turn off the path breadcrumb at the top:
        lsp-headerline-breadcrumb-enable nil)
  :commands lsp)

;; (use-package lsp-ui
;;   :commands lsp-ui-mode)

(use-package flycheck)

;; show project-wide errors with flycheck, but it seems slow:
;; (use-package flycheck-projectile)

;; (use-package treemacs
;;   :config
;;   (setq treemacs-display-in-side-window nil))

;; disabled until we figure out what is wrong:
;; (use-package lsp-treemacs
;;   :after treemacs
;;   :commands lsp-treemacs-errors-list)

