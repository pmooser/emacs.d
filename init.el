;;   -*- lexical-binding: t; -*-
;;;;

;; customize stuff in its own file:
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

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

(load-config "package-management.el")
(load-config "org.el")
(load-config "themes.el")
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

;; scroll left/right using trackpad gestures
;; (setq mouse-wheel-tilt-scroll t)
;; (setq mouse-wheel-flip-direction t)
