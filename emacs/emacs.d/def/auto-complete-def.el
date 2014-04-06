;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 16-04-2013 21:58:51
;;    Time-stamp: <13-10-2013 12:20:28>
;;
;;    File name : /home/mrmen/.emacs.d/def/auto-complete-def.el
;;    Description :
;;

;; navite archlinux package
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20130724.1750")
(require 'auto-complete-config)

;; navite archlinux package
(add-to-list 'ac-dictionary-directories
;;	     "/usr/share/emacs/site-lisp/auto-complete/ac-dict"
	     "~/.emacs.d/elpa/auto-complete-20130724.1750/dict"
)
(ac-config-default)

(provide 'auto-complete-def)
