;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:41:53
;;    Time-stamp: <04-12-2013 18:46:57>
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

;; added 
;; ac math
;(require 'ac-math)

;(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

;; (defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
;;   (setq ac-sources
;;         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
;;                 ac-sources))
;;   )

;; (add-hook 'latex-mode-hook 'ac-latex-mode-setup)

;; ;; latex-extra
;;    (eval-after-load 'latex '(latex/setup-keybinds))
;;     (require 'latex-extra)


;; defined in auto-fill-def
;;
;;(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

(setq TeX-source-correlate-mode t)


(getenv "PATH")
(setenv "PATH"
	(concat
	 "/usr/local/texlive/2013/bin/x86_64-linux"
	 ":"
	 (getenv "PATH")
	 )
	)

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
		'("LuaTeX" "lualatex %t" TeX-run-TeX nil (latex-mode) :help "Run LuaLaTeX") t))
(custom-set-variables '(LaTeX-command "latex -synctex=1") )


(add-hook 'LaTeX-mode-hook
          (lambda()
           (add-to-list 'TeX-expand-list
                        '("%(dir)" 
                          (lambda () default-directory)))))
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(setq TeX-view-program-list 
      '(("okular" "okular --unique %o#src:%n%(dir)./%b")))

;; (add-hook 'LaTeX-mode 
;;           (lambda ()
;;             (TeX-fold-mode 1)
;;             (add-hook 'find-file-hook 'TeX-fold-buffer t t)))

;; (add-hook 'LaTeX-mode-hook 
;;       (lambda () 
;;         (TeX-fold-mode 1)
;;         (add-hook 'find-file-hook 'TeX-fold-buffer t t)
;;         (add-hook 'after-change-functions 
;;               (lambda (start end oldlen) 
;;                 (when (= (- end start) 1)
;;                   (let ((char-point 
;;                                  (buffer-substring-no-properties 
;;                                   start end)))
;;                    (when (or (string= char-point "}")
;;                          (string= char-point "$"))
;;                     (TeX-fold-paragraph)))))
;;                t t)))

(provide 'latex-def)
