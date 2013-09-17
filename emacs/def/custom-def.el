;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 11:01:30
;;    Time-stamp: <14-09-2013 15:27:27>
;;
;;    File name : /home/mrmen/.emacs.d/custom-def.el
;;    Description :
;;

(custom-set-variables
 '(send-mail-function (
		       quote smtpmail-send-it
			     )
		      )
 )

;; (custom-set-faces
;;  '(default (
;; 	    (
;; 	     t (
;; 		:inherit nil :stipple nil :background "#3f3f3f" :foreground
;; 			 "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil
;; 			 :underline nil :slant normal :weight normal :height 80 :width normal :foundry
;; 			 "unknown" :family "Droid Sans Mono"
;; 			 )
;; 	       )
;; 	    )
;;     )
;;  )



(custom-set-faces
 '(default (
	    (
	     t (
		:inherit nil :stipple nil :background "#3f3f3f" :foreground
			 "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil
			 :underline nil :slant normal :weight normal :height 90 :width normal :foundry
			 "unknown" :family "Hermit"
			 )
	       )
	    )
    )
 )


					;
					; myindent
					;
(defun myindent ()
  (interactive)
  (setq my-point (point))
  (end-of-buffer)
  (setq point-end (point))
  (beginning-of-buffer)
  (setq point-cur (point))
  (message "%d -- %d" point-cur point-end)
  (while (not (eq point-cur point-end))
    (end-of-line)
    (setq point-cur (point))
    (indent-according-to-mode)
    (next-line)
    )
  )


;;
;; add kill word on c-w if no region
;;
(defun kill-word-or-region ()
"Kill region if there's one, otherwise kill the a word backward"
(interactive)
(if (and transient-mark-mode mark-active)
(kill-region (region-beginning) (region-end))
(backward-kill-word 1)))
 
(global-set-key (kbd "C-w") 'kill-word-or-region)


;;
;; highlight some comments
;;

(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.

This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'font-lock-comment-annotations)


;;
;; Antidote
;;
(defun correction ()
  (interactive)
  (setq file (buffer-file-name))
  (setq command (concat "/opt/Druide/Antidote8/Programmes64/Antidote8 -f " file))
  (start-process-shell-command "Antidote" "Antidote" command)
  )



(provide 'custom-def)
