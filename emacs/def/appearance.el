;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:37:14
;;    Time-stamp: <04-09-2013 13:09:37>
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


(require 'powerline)
(powerline-center-theme)


(provide 'appearance)
