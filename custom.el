;;;;
;; faces
;;;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-result-overlay-face ((t (:background "dark cyan" :box (:line-width (2 . -1) :color "MediumPurple3")))))
 '(cider-stacktrace-face ((t (:inherit default :foreground "SkyBlue1"))))
 '(company-echo-common ((t (:foreground "SpringGreen2"))))
 '(company-scrollbar-bg ((t (:background "gray15"))))
 '(company-tooltip ((t (:background "grey50" :foreground "white"))))
 '(company-tooltip-common ((t (:foreground "SpringGreen2"))))
 '(company-tooltip-common-selection ((t (:foreground "dark green" :inherit company-tooltip-common))))
 '(company-tooltip-selection ((t (:background "DarkSlateGray1" :foreground "black"))))
 '(diff-added ((t (:inherit diff-changed :background "LightGreen" :foreground "black"))))
 '(diff-indicator-added ((t (:inherit diff-added :background "black" :foreground "LightGreen"))))
 '(diff-indicator-removed ((t (:inherit diff-removed :background "black" :foreground "LightPink"))))
 '(diff-removed ((t (:inherit diff-changed :background "pink" :foreground "black"))))
 '(doom-modeline-bar ((t (:inherit doom-modeline-highlight :background "DeepSkyBlue1"))))
 '(doom-modeline-buffer-minor-mode ((t (:inherit font-lock-doc-face :foreground "grey" :slant normal))))
 '(doom-modeline-buffer-modified ((t (:inherit (error bold) :foreground "orange"))))
 '(doom-modeline-project-dir ((t (:inherit (font-lock-string-face bold) :foreground "LightSkyBlue"))))
 '(fixed-pitch ((t (:family "Menlo" :height 130))))
 '(idle-highlight ((t (:inherit region :background "grey25"))))
 '(mode-line ((t (:background "gray26" :foreground "gray90" :box (:line-width (1 . -1) :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "grey30" :foreground "gray70" :box (:line-width -1 :color "grey40") :weight light))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-ellipsis ((t (:inherit fixed-pitch :bold t :foreground "white" :underline nil))))
 '(org-formula ((t (:inherit fixed-pitch :foreground "#F5F5F5"))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#FFAAAA"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#FFAA55"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#FFFFAA"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#55FF55"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#AAAAFF"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#C3AAD5"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#DAAAFF"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#FFAAFF"))))
 '(rainbow-delimiters-unmatched-face ((t (:background "grey" :foreground "red"))))
 '(variable-pitch ((t (:family "Helvetica" :height 160)))))

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:inherit default :family "Helvetica" :height 160))))
 '(fixed-pitch ((t (:inherit default :family "Menlo" :height 130)))))

(custom-theme-set-faces
 'user
 '(org-ellipsis ((t (:inherit fixed-pitch :bold t :foreground "white" :underline nil))))
 ;; monospace fonts in org blocks:
 '(org-block                 ((t (:inherit fixed-pitch :background "#1d1e1f"))))
 '(org-table                 ((t (:inherit fixed-pitch :foreground "#AFE1AF"))))
 '(org-formula               ((t (:inherit fixed-pitch :foreground "#F5F5F5"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-property-value        ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-tag                   ((t (:inherit (shadow fixed-pitch) :weight bold))))
 '(org-verbatim              ((t (:inherit (shadow fixed-pitch))))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2700786ab07967d6e952285dfa18341382fb8a6a7f70d667778f2ce489436a17" "37046960cf667c5ab3b76235d35a5db4763c531e706502a9067fa78db5a775c0" "246cd0eb818bfd347b20fb6365c228fddf24ab7164752afe5e6878cb29b0204e" "cc8528fcff6ff85ed132ea83e457a58ae0a49168c93bd752a8c446c61fefcdb5" "07cb8ee4f51bde500e71e6da1311f2349d6f2e21570bcd9d0d85f5147d77c4a9" "1f6039038366e50129643d6a0dc67d1c34c70cdbe998e8c30dc4c6889ea7e3db" "4c460925984441cad09c74e042fa9d26f4b35320e04d6fb8a265d1a61c9f5c45" "78e9a3e1c519656654044aeb25acb8bec02579508c145b6db158d2cfad87c44e" default))
 '(ido-enable-flex-matching t)
 '(ns-antialias-text t)
 '(org-safe-remote-resources '("\\`https://fniessen\\.github\\.io\\(?:/\\|\\'\\)"))
 '(package-selected-packages
   '(counsel yaml-mode htmlize org-appear org-tempo ob-clojure org-bullets org nano-theme lsp-ui bqn-mode zenburn-theme smyx-theme seti-theme oceanic-theme naquadah-theme dakrone-theme atom-one-dark-theme melancholy-theme hydra flycheck-projectile lsp-clojure flycheck lsp-mode magit doom-modeline minions all-the-icons cider expand-region idle-highlight-mode paredit rainbow-delimiters company ws-butler undo-tree multiple-cursors exec-path-from-shell use-package)))
