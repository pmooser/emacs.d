;; hydra  -*- lexical-binding: t; -*-
;;
;; https://github.com/abo-abo/hydra

(use-package hydra)

;; simple hydra for my commonly used commands

(defun on-off (arg)
  (if arg 'on 'off))

(defun lsp-active? ()
  (and (boundp 'lsp-mode) lsp-mode))

(defun pm/toggle-lsp ()
  (interactive)
  (when (boundp 'lsp-mode)
    (let* ((on? (lsp-active?))
           (mode-arg (if on? -1 1)))
      (lsp-mode mode-arg)
      (lsp-managed-mode mode-arg)
      (message "Turning lsp-mode %s !" (on-off (not on?))))))

(defun pm/toggle-relative ()
  (interactive)
  (setq display-line-numbers (if (equal 'relative display-line-numbers)
                                 nil
                               'relative)))

;; quick menu for various common actions:
(defhydra hydra-paul-menu (:color amaranth)
  "
               Actions          ^^^^^^^^^^^^^^^^^^^^^^^^^^^                      Lines

 [_c_] clj-connect                ^^^^^^^^^^^^^^^^^^^^^^^^^     [_t_] toggle truncate lines (%(on-off truncate-lines)) 
 [_s_] shadow-connect             ^^^^^^^^^^^^^^^^^^^^^^^^^     [_#_] toggle line numbers 
 [_m_] magit                      ^^^^^^^^^^^^^^^^^^^^^^^^^     [_r_] toggle relative line numbers
 [_l_] toggle LSP (%(on-off (lsp-active?)))                 
 [___] toggle highlight sexps (%(on-off highlight-sexp-mode))

 [_q_] quit
"
  ("q" nil nil)
  ("l" pm/toggle-lsp nil)
  ("m" magit nil :color blue)
  ("t" toggle-truncate-lines nil)
  ("#" display-line-numbers-mode nil)
  ("r" pm/toggle-relative nil)
  ("_" highlight-sexp-mode nil)
  ("c" (lambda ()
         (interactive)
         (if (not (cider-current-repl))
             (clj-connect)
           (message "This buffer already has a repl!")))
   nil :color blue)
  ("s" (lambda ()
         (interactive)
         (if (not (cider-current-repl))
             (shadow-connect)
           (message "This buffer already has a repl!")))
   nil :color blue))

(global-set-key (kbd "C-c m") 'hydra-paul-menu/body)

