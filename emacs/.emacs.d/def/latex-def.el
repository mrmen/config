;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:41:53
;;    Time-stamp: <08-02-2013 10:48:36>
;;
;;    File name : /home/mrmen/.emacs.d/latex-def.el
;;    Description : latex definitions for emacs
;;



;; load 
(require 'tex-site)


;; definitions
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq reftex-plug-into-AUCTeX t)


;; hook

(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode) ; pdf mode
;(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode) ; flyspeel
;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;; defined in auto-fill-def
;;
;;(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

(provide 'latex-def)
