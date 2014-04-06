;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:55:56
;;    Time-stamp: <25-02-2014 11:34:16>
;;
;;    File name : /home/mrmen/.emacs.d/bindings-def.el
;;    Description :
;;

;; complete
(global-set-key [f5] 'dabbrev-expand)

;; tabbar
(global-set-key (kbd "M-<right>") 'tabbar-forward)
(global-set-key (kbd "M-S-<right>") 'tabbar-forward-group)
(global-set-key (kbd "M-<left>") 'tabbar-backward)
(global-set-key (kbd "M-S-<left>") 'tabbar-backward-group)

(provide 'bindings-def)
