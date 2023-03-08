;; org mode  -*- lexical-binding: t; -*-

;; use-package won't install org, since it's built-in, so
;;   we remove it from the list of builtins:
(assq-delete-all 'org package--builtins)
(assq-delete-all 'org package--builtin-versions)

;; This is needed for exporting to HTML with syntax highlighting:
(use-package htmlize
  :ensure t)

(use-package org
  :ensure t
  :custom
  (org-directory "~/org")
  (org-src-fontify-natively t)
  (org-src-tab-acts-natively t)
  :hook
  ;; proportional fonts
  (org-mode . variable-pitch-mode)
  ;; wrap lines nicely
  (org-mode . visual-line-mode)
  :config
  ;; (setq org-hide-emphasis-markers t)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (clojure . t)
     (org . t)))
  (setq org-babel-clojure-backend 'cider))

;; enable some simple completions (like "<s" and then TAB for a code block)
(require 'org-tempo)

;; display emphasis markers when cursor is on top of a rich text word:
(use-package org-appear
  :hook (org-mode . org-appear-mode))

;; alternatively: org-superstar
;; https://github.com/integral-dw/org-superstar-mode

(use-package org-bullets
  :ensure t
  :custom
  (org-ellipsis " ⤵")
  :hook
  (org-mode . org-bullets-mode))

;; Some tips:
;;
;; https://zzamboni.org/post/beautifying-org-mode-in-emacs/
;; https://github.com/zzamboni/dot-emacs/blob/master/init.el
;; https://mstempl.netlify.app/post/beautify-org-mode/
;; https://github.com/zzamboni/dot-emacs/blob/master/init.org

;; Need to find a way to set this on a file-local basis:
;; (setq org-confirm-babel-evaluate nil)
