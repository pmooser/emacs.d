;; general setup for lisps

(require 'cider)
(require 'clojure-mode)
(require 'rainbow-delimiters)
(require 'paredit)

(setq cider-stacktrace-frames-background-color "black")

;; hack to enable font-lock in cider repl (https://github.com/clojure-emacs/cider/issues/749)
;;(add-hook 'cider-repl-mode-hook 'clojure-font-lock-setup)

;; For some reason these 4 lines are critical to make
;; paredit work properly in the REPL - otherwise it will
;; not backspace properly over {} or []:
(modify-syntax-entry ?\{ "(}" lisp-mode-syntax-table)
(modify-syntax-entry ?\} "){" lisp-mode-syntax-table)
(modify-syntax-entry ?\[ "(]" lisp-mode-syntax-table)
(modify-syntax-entry ?\] ")[" lisp-mode-syntax-table)

;; BEGIN non-standard paredit customizations:

(eval-after-load 'paredit
  '(progn
     ;; make ctrl navigation work as it normally does (outside of paredit):
     (define-key paredit-mode-map (kbd "C-<right>") 'forward-word)
     (define-key paredit-mode-map (kbd "C-<left>") 'backward-word)

     (define-key paredit-mode-map (kbd "C-<backspace>") 'paredit-backward-kill-word)
     (define-key paredit-mode-map (kbd "C-w") 'paredit-kill-region)
     (define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-square)
     (define-key paredit-mode-map (kbd "M-{") 'paredit-wrap-curly)))

;; END non-standard paredit customizations

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)

;; setup for lisps in general

(defvar lisp-modes '(emacs-lisp-mode-hook
                     clojure-mode-hook
                     cider-mode-hook))

(defun do-lisps-setup ()
  (rainbow-delimiters-mode t)
  (idle-highlight-mode t)
  (show-paren-mode t)
  (paredit-mode +1))

(dolist (hook lisp-modes)
  (add-hook hook 'do-lisps-setup))

;;;;
;; ac-cider
;;;;

(require 'auto-complete-config)
(ac-config-default)

(require 'ac-cider)

(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)

(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

;;;;
;; company mode
;;;;
;;(add-hook 'cider-mode-hook 'company-mode)
;;(add-hook 'cider-repl-mode-hook 'company-mode)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;;;;
;; cider repl
;;;;

(setq cider-repl-use-clojure-font-lock t)

(add-hook 'cider-repl-mode-hook
          (lambda ()
            (show-paren-mode t)
            (paredit-mode +1)))

(provide 'paul-clojure)

