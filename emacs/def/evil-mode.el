;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 13-07-2013 23:44:31
;;    Time-stamp: <04-09-2013 13:03:47>
;;
;;    File name : /home/mrmen/.emacs.d/def/evil-mode.el
;;    Description :
;;

;; undo-tree mode required by evil

(require 'undo-tree)
;; replace undo emacs 
(global-undo-tree-mode)

(require 'evil)
;; turn on evil mode
(setq evil-mode 1)

;; modify cursor color
;fait varier la couleur du curseur en fonction du mode
 (setq evil-normal-state-cursor '("red" box)
       evil-visual-state-cursor '("light salmon" box)
       evil-insert-state-cursor '("blue" box)
       evil-replace-state-cursor '("sienna" hbar)
       evil-emacs-state-cursor '("green" box))

(evil-initialize-state 'emacs)

(require 'evil)
(evil-mode 1)
;; change mode-line color by evil state
(lexical-let ((default-color (cons (face-background 'mode-line)
(face-foreground 'mode-line))))
(add-hook 'post-command-hook
(lambda ()
(let ((color (cond ((minibufferp) default-color)
((evil-insert-state-p) '("red" . "#ffffff"))
((evil-emacs-state-p) '("DarkGreen" . "#ffffff"))
((evil-replace-state-p) '("blue" . "#ffffff"))
((evil-visual-state-p) '("white" . "#ffffff"))
((evil-normal-state-p) '("orange" . "#ffffff"))
((evil-operation-state-p) '("pink" . "#ffffff"))

((buffer-modified-p) '("#006fa0" . "#ffffff"))
(t default-color))))
(set-face-background 'mode-line (car color))
(set-face-foreground 'mode-line (cdr color))))))

(setq evil-insert-state-cursor '("red" box))
(setq evil-default-cursor '("orange" box))
(setq evil-normal-state-cursor '("orange" box))
(setq evil-visual-state-cursor '("white" box))
(setq evil-replace-state-cursor '("blue" box))
(setq evil-operator-state-cursor '("pink" box))
(setq evil-emacs-state-cursor '("green" box))

;; ((evil-insert-state-p) '("#e80000" . "#ffffff"))

;; ((evil-emacs-state-p) '("#444488" . "#ffffff"))



(provide 'evil-def)
