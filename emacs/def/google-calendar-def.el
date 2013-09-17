;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 04-09-2013 13:06:35
;;    Time-stamp: <04-09-2013 13:06:49>
;;
;;    File name : /home/mrmen/.emacs.d/def/google-calendar-def.el
;;    Description :
;;
;; (setq load-path (append (list (expand-file-name "~/emacs/icalendar")) load-path))
(require 'icalendar)
;; (setq load-path (append load-path (list (expand-file-name "~/emacs/google"))))
(require 'google-calendar)

(setq google-calendar-user           "tetcheve")         ;;; GOOGLE USER
(setq google-calendar-code-directory "/usr/lib/python2/site-packages/emacs-google/") ;;; PATH TO THE
;;; PYTHON CODE

(setq google-calendar-directory      "~/tmp")               ;;; TEMPORARY DIRECTORY
(setq google-calendar-url            "https://www.google.com/calendar/ical/tetcheve%40gmail.com/private-5eadfc7db3cccec3ec8540639ebc1852/basic.ics") ;;; URL TO YOUR GOOGLE CALENDAR
(setq google-calendar-auto-update    t )                    ;;; DEFINE IF THE CALENDAR IS DOWNLOADED AFTER EVERY MODIFICATION

(provide 'google-calendar-def)
