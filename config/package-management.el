(require 'package)

(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("GNU ELPA"     . 5)
        ("MELPA"        . 0)))

(package-initialize)

(defun pin-packages (&rest pairs)
  "Pin a package to a specific package archive repo (like MELPA)."
  (dolist (p pairs)
    (add-to-list 'package-pinned-packages p t)))

;; use-package:
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

