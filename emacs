;;
;;      ________
;;     |        |
;;     |    ____|
;;     |   |  
;;     |   |___                                _______
;;     |       | ___                          /       |  ______
;;     |   ____||   | __  __   __   ______   /   _____| /      |
;;     |   |    |   |/  \/  \ /  \ /  __   \|   |      |    ___|
;;  _  |   |____|    _    _    _  |  /  |  ||   |_____  \___   \
;; / \ |        |   / \  / \  / \ |  |__|  |\         | |      |
;; \_/ |________|__|  |_|  |_|  |_|_________\\________| |______/
;;
;;     Author: Thomas <MrMen> Etcheverria
;;     Mail:   tetcheve at gmail dot com
;;
;;      Time-stamp: <06-03-2012 21:31:57>
;;


;;
;; Modify load path
;;

; add .emacs.d to load-path
(add-to-list 'load-path "~/.emacs.d/")


; if darwin system add texlive path
; 2011 by default, modify if needed
(if (equal system-type 'darwin)
    (add-to-list 'load-path "/usr/local/texlive/2011/"))

; add color-theme-solarized
(add-to-list 'load-path "~/.emacs.d/color-theme-solarized")


; color theme
(require 'color-theme)
(color-theme-euphoria)

;;
;; user's definitions
;;


;;
;; Interface tweaks
;;

; column and line count
(setq column-number-mode nil)
(setq column-number-mode t)

; time and date
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

; transient mode not active by default in darwin
(if (equal system-type 'darwin)
    (setq-default transient-mark-mode t))


; time-stamp
;; time-stamps (better not use those in version-controlled files)
(defun insert-time-stamp-on-create ()
"insert time-stamp on create file" (interactive)
(insert ";;   Time-stamp: <>"))



(setq time-stamp-pattern nil)
(setq ;; when there's "Time-stamp: <>" in the first 10 lines of the file
  time-stamp-active t        ; do enable time-stamps
  time-stamp-line-limit 20   ; check first 10 buffer lines for Time-stamp: <>
  time-stamp-format "%02d-%02m-%04y %02H:%02M:%02S") ; date format
(add-hook 'before-save-hook 'time-stamp) ; update when saving





; encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;;
;; auto-fill-mode
;;

; 80 chars max on a line
(setq default-fill-column 80)

; add auto-fill for few mode
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'emacs-lisp-mode-hook 'turn-on-auto-fill)
(add-hook 'conf-mode-hook 'turn-on-auto-fill)

; some few functions
(require 'misc-func)



;;
;; LaTeX-mode
;;
; LaTeX functions
(defun babel-quote ()
  "insert babel quote and go between them" (interactive)
  (insert "\\og  \\fg{}") (backward-char 6))

; create hook
(add-hook 'LaTeX-mode-hook '(lambda ()
    (global-set-key (kbd "«") 'babel-quote))
)


(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)


(require 'tex-site)

(add-to-list 'auto-mode-alist '("tex$" . latex-mode)) 
;;(add-to-list 'auto-mode-alist '("\\.tex$" . reftex-mode)) ; sometimes not auto load


;; LaTeX shortcurt
(require 'my-parent) ;my-parent package


;;
;; Org-mode
;;
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode)) ;to have the org mode available in .org file
(setq org-log-done t)


;;
;; w3m for macOS
;;
(add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m")
(if window-system
   (require 'w3m-load))