;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 11-01-2013 10:37:47
;;    Time-stamp: <12-12-2013 08:35:29>
;;
;;    File name : /home/mrmen/.emacs.d/theme.el
;;    Description :
;;
;;
;; Themes and color
;;

(require 'color-theme)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#3f3f3f" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 80 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))



;(add-to-list 'custom-theme-load-path "/usr/share/emacs/site-lisp/zenburn-emacs-mod")
;(load-theme 'zenburn-mod t)

(color-theme-initialize)

;;
;; TODO: tester si dark ou light et choisir le mode en fonction
;;

(color-theme-solarized-dark)

(provide 'theme)
