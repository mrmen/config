;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 16-04-2013 21:58:51
;;    Time-stamp: <16-04-2013 21:59:07>
;;
;;    File name : /home/mrmen/.emacs.d/def/auto-complete-def.el
;;    Description :
;;
(add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
	     "/usr/share/emacs/site-lisp/auto-complete/ac-dict")
(ac-config-default)

(provide 'auto-complete-def)
