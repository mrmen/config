;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 11:01:30
;;    Time-stamp: <08-02-2013 11:09:51>
;;
;;    File name : /home/mrmen/.emacs.d/custom-def.el
;;    Description :
;;

(custom-set-variables
 '(send-mail-function (
		       quote smtpmail-send-it
			     )
		      )
 )


(custom-set-faces
 '(default (
	    (
	     t (
		:inherit nil :stipple nil :background "#3f3f3f" :foreground
 "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil
 :underline nil :slant normal :weight normal :height 80 :width normal :foundry
 "unknown" :family "DejaVu Sans Mono"
 )
	       )
	    )
    )
 )

(provide 'custom-def)
