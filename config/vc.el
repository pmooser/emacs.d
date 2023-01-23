;; version control    -*- lexical-binding: t; -*-

(use-package magit)

(use-package vc
  :ensure nil)

(defun pm/vc-root ()
  "Return path (string) of VC root associated with the current buffer, or nil."
  (let ((buf-path (buffer-file-name (current-buffer))))
    (when buf-path
      (vc-call-backend (vc-responsible-backend buf-path) 'root buf-path))))

