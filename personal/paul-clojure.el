;; general setup for lisps

(require 'cider)
(require 'clojure-mode)
(require 'rainbow-delimiters)
(require 'paredit)

;; log cider messages (especially errors)
;; (setq nrepl-log-messages t)

(setq cider-stacktrace-frames-background-color "black")

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
     (define-key paredit-mode-map (kbd "{") 'paredit-open-curly)
     (define-key paredit-mode-map (kbd "C-<backspace>") 'paredit-backward-kill-word)
     (define-key paredit-mode-map (kbd "C-w") 'paredit-kill-region)
     (define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-square)
     (define-key paredit-mode-map (kbd "M-{") 'paredit-wrap-curly)))

;; END non-standard paredit customizations

(autoload 'enable-paredit-mode "paredit" "Minor mode for pseudo-structurally editing Lisp code." t)

;; setup for lisps in general

(defvar lisp-modes '(emacs-lisp-mode-hook
                     clojure-mode-hook))

(defun do-lisps-setup ()
  (rainbow-delimiters-mode t)
  (idle-highlight-mode t)
  (show-paren-mode t)
  (enable-paredit-mode))

(dolist (hook lisp-modes)
  (add-hook hook 'do-lisps-setup))

;; (add-hook 'cider-mode-hook 'eldoc-mode)

;;;;
;; company mode
;;;;

(require 'color)

;; Had some trouble getting these colors to apply - I've
;; solved it hackily using a hook.

(defun company-colors ()
    (let ((bg (face-attribute 'default :background)))
      (custom-set-faces
       `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 30)))))
       `(company-tooltip-common-selection ((t (:inherit default :foreground "grey" :background ,(color-lighten-name bg 50)))))
       `(company-tooltip-selection ((t (:inherit font-lock-function-name-face :background ,(color-lighten-name bg 50)))))
       `(company-tooltip-common ((t (:inherit default :foreground "white" :background ,(color-lighten-name bg 50)))))
       
       `(company-preview-common ((t (:inherit default :foreground "white" :background "light slate gray"))))
       
       `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
       `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5))))))))

(require 'company)

(global-company-mode)
;; (global-set-key (kbd "TAB") #'company-indent-or-complete-common)

(add-hook 'company-mode-hook #'company-colors)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)

;;;;
;; cider repl
;;;;

(setq cider-repl-use-clojure-font-lock t)

(add-hook 'cider-repl-mode-hook
          (lambda ()
            (show-paren-mode t)
            (enable-paredit-mode)
            ;; since CIDER 1.6.0, for some reason paredit's binding of RET
            ;;   is preventing the repl from working, so only for cider-repl-mode,
            ;;   override the paredit behavior:
            (let ((old-map (cdr (assoc 'paredit-mode minor-mode-map-alist)))
                  (new-map (make-sparse-keymap)))
              (set-keymap-parent new-map old-map)
              (define-key new-map (kbd "RET") nil)
              (make-local-variable 'minor-mode-overriding-map-alist)
              (push `(paredit-mode . ,new-map) minor-mode-overriding-map-alist))))

;; formatting

(put-clojure-indent 'pfn 2)
(put-clojure-indent 'receive 4)

(provide 'paul-clojure)

