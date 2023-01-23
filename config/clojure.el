;; clojure and related package setup -*- lexical-binding: t -*-
;;
;; - see also lisps.el

;; DEBUG:
;; log cider messages (especially errors)
;; (setq nrepl-log-messages t)

;; fixing white background color in stack traces,
;;   see: https://github.com/jackrusher/dotemacs/issues/33
(set-variable 'cider-stacktrace-frames-background-color "grey20")

(use-package cider
  :pin "MELPA Stable"
  :init
  (add-hook 'cider-repl-mode-hook
            (lambda ()
              (show-paren-mode t)
              ;; (enable-paredit-mode)
              ;; since CIDER 1.6.0, for some reason paredit's binding of RET
              ;;   is preventing the repl from working, so only for cider-repl-mode,
              ;;   override the paredit behavior:
              (let ((old-map (cdr (assoc 'paredit-mode minor-mode-map-alist)))
                    (new-map (make-sparse-keymap)))
                (set-keymap-parent new-map old-map)
                (define-key new-map (kbd "RET") nil)
                (make-local-variable 'minor-mode-overriding-map-alist)
                (push `(paredit-mode . ,new-map) minor-mode-overriding-map-alist))))
  :config
  (setq cider-default-cljs-repl 'shadow))

(use-package clojure-mode
  :config
  (add-hook 'clojure-mode-hook #'idle-highlight-mode)
  ;; custom indentation:
  (put-clojure-indent 'pfn 2)
  (put-clojure-indent 'receive 4))

(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

;; NOTE - cider gets confused sometimes, so we might have to occasionally explicitly call:
;;   cider-set-repl-type

(defun clj-connect ()
  "Connect to nREPL project associated with current buffer."
  (interactive)
  (let ((project-dir (pm/vc-root)))
    (when (not project-dir)
      (error "Couldn't find project directory associated with current buffer!"))
    (let* ((nrepl-port (string-to-number (get-string-from-file (concat project-dir "/.nrepl-port"))))
           (params (list :host "localhost" :port nrepl-port :project-dir project-dir)))
      (cider-connect-clj params))))

(defun shadow-connect ()
  "Connect to shadow-cljs nREPL associated with current buffer. Note that this will check project-root/.dir-locals.el for defaults."
  (interactive)
  (let ((project-dir (pm/vc-root)))
    (when (not project-dir)
      (error "Couldn't find project directory associated with current buffer!"))
    (let* ((nrepl-port (string-to-number (get-string-from-file (concat project-dir "/.shadow-cljs/nrepl.port"))))
           (params (list :host "localhost" :port nrepl-port :cljs-repl-type 'shadow)))
      (if (null (cider-repls))
          (cider-connect-cljs params)
        (cider-connect-sibling-cljs params)))))

