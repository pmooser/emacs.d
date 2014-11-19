;; general utility functions 

(defun toggle-comment-region-or-line ()
  "Toggle comment on either region or line."
  (interactive)
  (save-excursion
    (if mark-active
        (comment-or-uncomment-region (region-beginning) (region-end))
      (progn
        (back-to-indentation)
        (push-mark)
        (end-of-line)
        (comment-or-uncomment-region (mark) (point)))))
  (next-line))

(provide 'paul-utils)

