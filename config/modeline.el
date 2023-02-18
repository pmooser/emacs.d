;; modeline configuration -*- lexical-binding: t -*-

(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                ;; mode-line-mule-info
                mode-line-client
                mode-line-modified
                ;; mode-line-remote
                ;; mode-line-frame-identification
                mode-line-buffer-identification
                "   "
                mode-line-position
                ;; (vc-mode vc-mode)
                "  "
                mode-line-modes
                mode-line-misc-info
                mode-line-end-spaces))

;; nice set of icons for languages and git etc:
(use-package all-the-icons
  :config
  ;; rescale the icons to avoid a clipping bug when using clojure LSP mode:
  (setq all-the-icons-scale-factor 1.0))

;; collapse minor modes into a menu with a gear icon:
(use-package minions
  :config
  (minions-mode 1)
  (setq minions-mode-line-lighter "⚙"))

;; prettier modeline:
(use-package doom-modeline
  :after (all-the-icons minions)
  :config
  (doom-modeline-def-modeline 'main
    '(bar matches buffer-info remote-host buffer-position selection-info)
    '(misc-info minor-modes checker major-mode process vcs "  "))
  (setq doom-modeline-minor-modes t
        ;; doom-modeline--flycheck-icon nil
        doom-modeline-buffer-encoding nil)
  (doom-modeline-mode 1))


