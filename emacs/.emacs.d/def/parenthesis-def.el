;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:54:59
;;    Time-stamp: <08-02-2013 10:55:14>
;;
;;    File name : /home/mrmen/.emacs.d/parenthesis-def.el
;;    Description :
;;


;;
;; user's definitions
;;
(require 'parenthesis)

(global-set-key "(" 'parenthesis-insert-parens)
(global-set-key "[" 'parenthesis-insert-brackets)
(global-set-key "{" 'parenthesis-insert-braces)
(global-set-key "\"" 'parenthesis-insert-double-quotation)
(global-set-key "«" 'parenthesis-insert-og)

(setq show-paren-delay 1)           ; how long to wait?
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'parenthesis) ; alternatives are 'parenthesis' and
				     ; 'mixed' also 'expression'

(provide 'parenthesis-def)
