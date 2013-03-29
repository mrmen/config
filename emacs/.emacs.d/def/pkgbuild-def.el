;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:46:01
;;    Time-stamp: <08-02-2013 10:47:02>
;;
;;    File name : /home/mrmen/.emacs.d/pkgbuild-def.el
;;    Description : pkgbuild mode def (Archlinux)
;;


(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode))
			      auto-mode-alist))


(provide 'pkgbuild-def)
