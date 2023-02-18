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
 [_!_] register-list              ^^^^^^^^^^^^^^^^^^^^^^^^^     [_r_] toggle relative line numbers
 [_m_] magit
 [_l_] toggle LSP (%(on-off (lsp-active?)))
 [___] toggle highlight sexps (%(on-off highlight-sexp-mode))

 [_q_] quit
"
  ("q" nil nil)
  ("l" pm/toggle-lsp nil)
  ("m" magit nil :color blue)
  ("!" register-list nil :color blue)
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

;; rectangles

(defun smart-save ()
  (interactive)
  (if rectangle-mark-mode
      (call-interactively 'copy-rectangle-to-register)
      (when (use-region-p)
        (call-interactively 'copy-to-register))))

(defhydra hydra-paul-reg-menu (:color blue)
  "
          Save                                        Restore

  [_p_] save pos                       [_j_] jump to pos (or restore windows)
  [_s_] save selection (or rectangle)  [_i_] insert text (or rectangle)
  [_a_] append
  [_w_] save window config

[_v_] view [_t_] toggle rectangle mark (%(on-off rectangle-mark-mode)) [_q_] quit"
  ("q" nil nil)
  ("v" view-register nil)
  ("p" point-to-register nil)
  ("j" jump-to-register nil)
  ("s" smart-save nil)
  ;; ("c" copy-to-register nil)
  ;; ("r" copy-rectangle-to-register nil)
  ("a" append-to-register nil)
  ("t" rectangle-mark-mode nil :color amaranth)
  ("w" window-configuration-to-register nil)
  ("i" insert-register nil))

(global-set-key (kbd "C-c r")  'hydra-paul-reg-menu/body)

;; (set-register ?q nil)
