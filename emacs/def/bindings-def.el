;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:55:56
;;    Time-stamp: <04-09-2013 13:02:23>
;;
;;    File name : /home/mrmen/.emacs.d/bindings-def.el
;;    Description :
;;

; complete
(global-set-key [f5] 'dabbrev-expand)

(defun reload-dot-emacs ()
  (interactive)
  (load-file "~/.emacs")
  (message "Dot Emacs reloaded"))

(global-set-key "\M-r" 'reload-dot-emacs)

(when window-system
  (global-unset-key "\C-x\C-c")
  )

(provide 'bindings-def)
