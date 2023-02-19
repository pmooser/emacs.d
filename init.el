;;   -*- lexical-binding: t; -*-
;;;;

;; for debugging elisp:
;; (setq debug-on-error t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; start a server so we can open files in an emacs instance from the cmd line
(server-start)

;; SVG widget images don't work well with black backgrounds:
(setq widget-image-enable nil)

(defun load-config (config-file-name)
  "Load a configuration file from ./config/"
  (load (concat
         (concat (locate-user-emacs-file "config/")) config-file-name)))

(load-config "themes.el")
(load-config "package-management.el")
(load-config "path.el")
(load-config "basic.el")
(load-config "company.el")
(load-config "vc.el")
(load-config "hydra.el")
(load-config "paul-advice.el")
(load-config "lisps.el")
(load-config "clojure.el")
(load-config "modeline.el")
(load-config "utils.el")
(load-config "lsp.el")
(load-config "bqn.el")
(load-config "registers.el")

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
 '(idle-highlight ((t (:inherit region :background "grey25"))))
 '(mode-line ((t (:background "gray26" :foreground "gray90" :box (:line-width (1 . -1) :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "grey30" :foreground "gray70" :box (:line-width -1 :color "grey40") :weight light))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#FFAAAA"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#FFAA55"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#FFFFAA"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#55FF55"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#AAAAFF"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#C3AAD5"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#DAAAFF"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#FFAAFF"))))
 '(rainbow-delimiters-unmatched-face ((t (:background "grey" :foreground "red")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2700786ab07967d6e952285dfa18341382fb8a6a7f70d667778f2ce489436a17" "37046960cf667c5ab3b76235d35a5db4763c531e706502a9067fa78db5a775c0" "246cd0eb818bfd347b20fb6365c228fddf24ab7164752afe5e6878cb29b0204e" "cc8528fcff6ff85ed132ea83e457a58ae0a49168c93bd752a8c446c61fefcdb5" "07cb8ee4f51bde500e71e6da1311f2349d6f2e21570bcd9d0d85f5147d77c4a9" "1f6039038366e50129643d6a0dc67d1c34c70cdbe998e8c30dc4c6889ea7e3db" "4c460925984441cad09c74e042fa9d26f4b35320e04d6fb8a265d1a61c9f5c45" "78e9a3e1c519656654044aeb25acb8bec02579508c145b6db158d2cfad87c44e" default))
 '(ido-enable-flex-matching t)
 '(ns-antialias-text t)
 '(package-selected-packages
   '(zenburn-theme smyx-theme seti-theme oceanic-theme naquadah-theme dakrone-theme atom-one-dark-theme melancholy-theme hydra flycheck-projectile lsp-clojure flycheck lsp-mode magit doom-modeline minions all-the-icons cider expand-region idle-highlight-mode paredit rainbow-delimiters company ws-butler undo-tree multiple-cursors exec-path-from-shell use-package)))

;; scroll left/right using trackpad gestures
;; (setq mouse-wheel-tilt-scroll t)
;; (setq mouse-wheel-flip-direction t)
