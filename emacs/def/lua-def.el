;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:51:22
;;    Time-stamp: <08-02-2013 10:51:43>
;;
;;    File name : /home/mrmen/.emacs.d/lua-def.el
;;    Description : lua definitions
;;


(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(provide 'lua-def)
