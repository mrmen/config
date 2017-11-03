;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 11:01:30
;;    Time-stamp: <26-02-2014 23:18:13>
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
(add-hook 'python-mode-hook 'font-lock-comment-annotations)


(setq anzu-search-threshold 1000)
(setq anzu-cons-mode-line-p t)
(setcar (cdr (assq 'isearch-mode minor-mode-alist))
        '(:eval (anzu--update-mode-line)))
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)


(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)


(defun reload-dot-emacs ()
  "Save the .emacs buffer if needed, then reload .emacs."
  (interactive)
  (let ((dot-emacs "~/.emacs"))
    (and (get-file-buffer dot-emacs)
	 (save-buffer (get-file-buffer dot-emacs)))
    (load-file dot-emacs))
  (message "Re-initialized!"))

(global-set-key (kbd "M-r") 'reload-dot-emacs)

(defun correction ()
  "Correct buffer using Antidote"
  (interactive)
    (shell-command 
   (format "/opt/Druide/Antidote8/Programmes64/Antidote8 -f %s" 
       (shell-quote-argument (buffer-file-name))))
)

(provide 'custom-def)