;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 05-03-2014 13:49:41
;;    Time-stamp: <05-03-2014 16:27:27>
;;
;;    File name : /home/mrmen/.emacs.d/def/maths.el
;;    Description :
;;
(defun getEqn (a b c d)
  (interactive "na : \nnb : \nnc : \nnd : ")
  (setq coeff 
	(/ (float (- d b)) (float (- c a)))
	)
  (setq ord 
	(- b (* coeff a))
	)
  (insert (format "\\draw[domain=%s:%s] plot (\\x,%s *\\x + %s);" a c coeff ord))
  )


(defun solveEqn (a b e c d f)
  (interactive "na : \nnb : \nnc : \nnd : \nne : \nnf : ")
  (setq delta (- ( * a d) (* b c)))
  (if (not (equal delta 0))
      (progn 
	(setq x (/ (- (* e d) (* b f)) (float delta)))
	(setq y (/ (- ( * a f) (* e c)) (float delta)))
	(insert (format "(%s,%s)" x y))
	(message (format "Intersection found : (%s,%s)" x y))
	)
    (message "Cramer says ' No '")
    )
)

(defun distance (x y a b)
  (interactive "nx : \nny : \nna : \nnb : ")
  (setq dist (sqrt (+
	 (expt (- x a) 2)
	 (expt (- y b) 2)
	 )))
  (message "Distance between (%s,%s) and (%s,%s) is %s" x y a b dist)
  (insert (format "%s" dist))
  )



