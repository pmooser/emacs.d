;; configuration for lisps -*- lexical-binding: t -*-

(use-package rainbow-delimiters
  :hook (emacs-lisp-mode clojure-mode clojurescript-mode cider-repl-mode lisp-mode))

(use-package paredit
  :bind (:map paredit-mode-map
              ;; override navigation with ctrl:
              ("C-<right>" . forward-word)
              ("C-<left>" . backward-word)
              ;; override certain paredit bindings:
              ("{" . paredit-open-curly)
              ("C-<backspace>" . paredit-backward-kill-word)
              ("C-w" . paredit-kill-region)
              ("M-[" . paredit-wrap-square)
              ("M-{" . paredit-wrap-curly))
  :hook (emacs-lisp-mode
         clojure-mode
         clojurescript-mode
         cider-repl-mode
         lisp-mode
         lisp-interaction-mode))

(use-package idle-highlight-mode
  :hook (emacs-lisp-mode clojure-mode clojurescript-mode))

(use-package expand-region
  :bind (("C-=" . er/expand-region)))

;; TODO - change face
;; TOOD - add binding to enable/disable
(use-package highlight-sexp
  :ensure nil)

