(provide 'misc-functions)

(defun babel-quote ()
  "insert babel quote and go between them" (interactive)
  (insert "\\og  \\fg{}") (backward-char 6))

(defun double-parent ()
  "insert babel quote and go between them" (interactive)
  (insert "()") (backward-char 1))

(defun double-croch ()
  "insert babel quote and go between them" (interactive)
  (insert "[]") (backward-char 1))

(defun double-acol ()
  "insert babel quote and go between them" (interactive)
  (insert "{}") (backward-char 1))


