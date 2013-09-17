;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:42:54
;;    Time-stamp: <08-02-2013 10:45:02>
;;
;;    File name : /home/mrmen/.emacs.d/auto-fill-def.el
;;    Description : few definitions for emacs auto-fill
;;

;; 80 chars max on a line
(setq default-fill-column 80)

;; hook
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'emacs-lisp-mode-hook 'turn-on-auto-fill)
(add-hook 'conf-mode-hook 'turn-on-auto-fill)

(provide 'auto-fill-def)
