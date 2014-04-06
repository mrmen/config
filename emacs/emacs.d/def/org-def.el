;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:58:41
;;    Time-stamp: <14-06-2013 12:01:13>
;;
;;    File name : /home/mrmen/.emacs.d/org-def.el
;;    Description :
;;

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode)) ;to have the org mode available in .org file
(setq org-log-done t)

(define-key global-map "\C-ca" 'org-agenda)

(setq org-agenda-files (list "~/org/boulot.org"
                             "~/org/cours.org" 
                             "~/org/maison.org"))

(provide 'org-def)
