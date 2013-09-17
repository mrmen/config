;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:58:41
;;    Time-stamp: <03-09-2013 21:25:49>
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

(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}
	       \\usepackage[margin=1cm]{geometry}
%               \\usepackage[french]{babel}
               \\def\\maketitle{}
               \\def\\tableofcontents{}
               \\pagestyle{empty}"
               ("\\section{%s}" . "\\section*{%s}")))


(provide 'org-def)
