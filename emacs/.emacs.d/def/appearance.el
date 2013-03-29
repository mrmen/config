;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:37:14
;;    Time-stamp: <08-02-2013 10:38:25>
;;
;;    File name : /home/mrmen/.emacs.d/appearance.el
;;    Description : appearance definitions for emacs
;;

;; column and line count
(setq column-number-mode nil)
(setq column-number-mode t)

;; time and date
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

;; battery
(display-battery-mode t)

(provide 'appearance)
