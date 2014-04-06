;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 24-02-2014 17:46:34
;;    Time-stamp: <26-02-2014 23:16:05>
;;
;;    File name : /home/thomas/.emacs.d/def/tabbar-def.el
;;    Description :
;;

(require 'tabbar)
(tabbar-mode 1)



(setq tabbar-background-color "#959A79") ;; the color of the tabbar background
(custom-set-faces
 '(tabbar-default ((t (:inherit variable-pitch :background "#959A79" :foreground "black" :weight bold))))
 '(tabbar-button ((t (:inherit tabbar-default :foreground "dark red"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-highlight ((t (:underline t))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "#95CA59"))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "#95CA59"))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))


;; bindings part
(global-set-key (kbd "M-<right>") 'tabbar-forward)
(global-set-key (kbd "M-<left>") 'tabbar-backward)
(global-set-key (kbd "M-<up>") 'tabbar-forward-group)
(global-set-key (kbd "M-<down>") 'tabbar-backward-group)

(setq tabbar-cycle-scope (quote tabs))
(setq table-time-before-update 0.1)
(setq tabbar-use-images t)

;; Add a buffer modification state indicator in the tab label, and place a
;; space around the label to make it looks less crowd.
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
   (setq ad-return-value
         (if (and (buffer-modified-p (tabbar-tab-value tab))
                  (buffer-file-name (tabbar-tab-value tab)))
             (concat " + " (concat ad-return-value " "))
           (concat " " (concat ad-return-value " ")))))




 ;; Called each time the modification state of the buffer changed.
 (defun ztl-modification-state-change ()
   (tabbar-set-template tabbar-current-tabset nil)
   (tabbar-display-update))


 ;; First-change-hook is called BEFORE the change is made.
 (defun ztl-on-buffer-modification ()
   (set-buffer-modified-p t)
   (ztl-modification-state-change))
 (add-hook 'after-save-hook 'ztl-modification-state-change)

 ;; This doesn't work for revert, I don't know.
 ;;(add-hook 'after-revert-hook 'ztl-modification-state-change)
 (add-hook 'first-change-hook 'ztl-on-buffer-modification)


 (defun tabbar-buffer-groups ()
   "Return the list of group names the current buffer belongs to.
     Return a list of one element based on major mode."
   (list
    (cond
     ((or (get-buffer-process (current-buffer))
          ;; Check if the major mode derives from `comint-mode' or
          ;; `compilation-mode'.
          (tabbar-buffer-mode-derived-p
           major-mode '(comint-mode compilation-mode)))
      "Process"
      )
     ;; ((member (buffer-name)
     ;;          '("*scratch*" "*Messages*" "*Help*"))
     ;;  "Common"
     ;;  )
     ((string-equal "*" (substring (buffer-name) 0 1))
      "Common"
      )
     ((member (buffer-name)
              '("xyz" "day" "m3" "abi" "for" "nws" "eng" "f_g" "tim" "tmp"))
      "Main"
      )
     ((eq major-mode 'dired-mode)
      "Dired"
      )
     ((memq major-mode
            '(help-mode apropos-mode Info-mode Man-mode))
      "Common"
      )
     ((memq major-mode
            '(rmail-mode
              rmail-edit-mode vm-summary-mode vm-mode mail-mode
              mh-letter-mode mh-show-mode mh-folder-mode
              gnus-summary-mode message-mode gnus-group-mode
              gnus-article-mode score-mode gnus-browse-killed-mode))
      "Mail"
      )
     (t
      ;; Return `mode-name' if not blank, `major-mode' otherwise.
      (if (and (stringp mode-name)
               ;; Take care of preserving the match-data because this
               ;; function is called when updating the header line.
               (save-match-data (string-match "[^ ]" mode-name)))
          mode-name
        (symbol-name major-mode))
      ))))

;; BUFFER MODIFICATION STATE INDICATOR
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
   (setq ad-return-value
         (if (and (buffer-modified-p (tabbar-tab-value tab))
                  (buffer-file-name (tabbar-tab-value tab)))
             (concat " + " (concat ad-return-value " "))
           (concat " " (concat ad-return-value " ")))))
(defun ztl-modification-state-change ()
   (tabbar-set-template tabbar-current-tabset nil)
   (tabbar-display-update))
(defun ztl-on-buffer-modification ()
   (set-buffer-modified-p t)
   (ztl-modification-state-change))
(add-hook 'after-save-hook 'ztl-modification-state-change)
(add-hook 'first-change-hook 'ztl-on-buffer-modification)


(provide 'tabbar-def)
