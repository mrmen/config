;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 31-01-2013 13:10:34
;;    Time-stamp: <05-02-2013 15:35:14>
;;
;;    File name : /tmp/test.el
;;    Description :
;;

(defun test ()
  (interactive)
  (end-of-line)
  (setq p (point))
  (goto-char (point-min))
  (message "%d" p)
  )

(defun havingfun (num)
  (interactive "nLine number : ")
  (goto-char (point-min))
  (while (not (eq (line-end-position) (point-max)))
    (forward-line (- num 1))
    (let (p1 p2 myLine)
      (setq p1 (line-beginning-position) )
      (setq p2 (line-end-position) )
      (setq myLine (buffer-substring-no-properties p1 p2))
    (if (string-match "File" myLine)
	(message "Yes")
      (message "No")
      )
      )
    )
  )

