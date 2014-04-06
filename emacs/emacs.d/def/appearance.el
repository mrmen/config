;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:37:14
;;    Time-stamp: <13-10-2013 15:10:31>
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
