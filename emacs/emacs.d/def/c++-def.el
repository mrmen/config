;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 28-10-2013 14:39:24
;;    Time-stamp: <28-10-2013 15:30:14>
;;
;;    File name : /home/mrmen/.emacs.d/def/c++-def.el
;;    Description :
;;
;; Do checkout of fresh CEDET, and use this config (don't forget to change path below)
 

;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
 
;; Activate semantic
(semantic-mode 1)
 
(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)
 
 
;; EDE
(global-ede-mode 1)
(ede-enable-generic-projects)
 
 
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(require 'eieio)
(require 'mode-local)
(load "srecode/loaddefs" nil 'nomessage)

(global-srecode-minor-mode 1)            ; Enable template insertion menu

(require 'semantic/bovine/c)
(setq qt4-base-dir "/usr/include/qt4")
(semantic-add-system-include qt4-base-dir 'c++-mode)
(add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig-dist.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qglobal.h"))

(add-to-list 'auto-mode-alist'("/usr/include/qt4" . c++-mode))
(semantic-add-system-include "/usr/include/qt4" 'c++-mode)
(add-to-list 'semantic-lex-c-preprocessor-symbol-file "/usr/include/qt4/Qt/qconfig.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file "/usr/include/qt4/Qt/qconfig-dist.h")


;; (setq qt4-base-dir "/usr/include/qt4") ;; Adapt accordingly
;; (setq qt4-gui-dir (concat qt4-base-dir "/QtGui"))
;; (semantic-add-system-include qt4-base-dir 'c++-mode)
;; (semantic-add-system-include qt4-gui-dir 'c++-mode)
;; (add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig.h"))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig-large.h"))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qglobal.h"))

(provide 'c++-def)
