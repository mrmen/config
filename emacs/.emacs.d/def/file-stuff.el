;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:39:10
;;    Time-stamp: <08-02-2013 10:50:31>
;;
;;    File name : /home/mrmen/.emacs.d/file-stuff.el
;;    Description : file manipulation stuff for emacs
;;


;; encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)



;; time stamp definition
;;
(setq time-stamp-pattern nil)
(setq ;; when there's "Time-stamp: <>" in the first 10 lines of the file
  time-stamp-active t        ; do enable time-stamps
  time-stamp-line-limit 20   ; check first 10 buffer lines for Time-stamp: <>
  time-stamp-format "%02d-%02m-%04y %02H:%02M:%02S") ; date format
(add-hook 'before-save-hook 'time-stamp) ; update when saving


(provide 'file-stuff)
