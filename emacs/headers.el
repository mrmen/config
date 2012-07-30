;;   Time-stamp: <30-07-2012 18:57:03>
;;
;;
;;
;;
;;
;;
;;
;;
;; This file create headers if file does not exist.
;; - time-stamp
;; - name 
;; - mail address
;; - what you want
;;
;;
;; README
;;
;; Function add-or-not-time-stamp ()
;;   test if file exists and call add-time-stamp if not
;;
;; Function add-time-stamp ()
;;   test name of file and if match some condtions (c,cpp,tex,sh,…)
;;   add time-stamp and headers
;;





;; add-or-not-time-stamp ()
;;
;;    test if file exists and then call add-time-stamp if false
;;
(defun add-or-not-time-stamp () (interactive)
  (if (file-exists-p (buffer-file-name))
    ;; file already exists do nothing
    (progn
      (message "file already exists")
      )
    ;; file doesn't exist adding time-stamp
    (choose-file-type)
    )
)



;; select-comment ()
;;
;;   select comment char and call function
;;
(defun choose-file-type () (interactive)
  (setq comment "none")
  (setq bang "none")
  (cond
   ;; if C file : commnt = //
   ((string-match "\\.c$" (buffer-file-name))
    (setq comment "//")
    )
   ((string-match "\\.h$" (buffer-file-name))
    (setq comment "//")
    )
   ;; if c++ file : comment = //
   ((string-match "\\.cpp$" (buffer-file-name))
    (setq comment "//")
    )
   ((string-match "\\.cc$" (buffer-file-name))
    (setq comment "//")
    )
   ;; tex file : comment = %
   ((string-match "\\.tex$" (buffer-file-name))
    (setq comment "%")
    )
   ((string-match "\\.bib$" (buffer-file-name))
    (setq comment "%")
    )
   ;; python file : comment = #
   ((string-match "\\.py$" (buffer-file-name))
    (setq comment "#")
    (setq bang "#!/usr/bin/env python")
    )
   ;; bash file : comment = #
   ((string-match "\\.sh$" (buffer-file-name))
    (setq comment "#")
    (setq bang "#!/bin/bash")
   )
  ;; emacs lisp file : comment = ;;
   ((string-match "\\.el$" (buffer-file-name))
    (setq comment ";;")
    )
   )
  (if (string= comment "none")
      (message "unknown file type")
    (add-time-stamp comment bang)
    )
  )

;; add-time-stamp (comment-char)
;;
;;     add time-stamp with comment-char
;;     and call format-hearders if posible
;;
(defun add-time-stamp (comment bang) (interactive)
  ;; insert comment and time-stamp
  ;;   also add piece of info about user
  (format-headers comment)
  )


;; format-headers (comment)
;;
;;    format headers and insert it
(defun format-headers (comment bang) (interactive)
  (if( string= bang "none")
      (message "no bang")
    (insert (format "%s\n" bang))
      )
  (insert (format "\
%s
%s
%s    Thomas \"Mr Men\" Etcheverria
%s    <tetcheve (at) gmail .com>
%s
%s    Created on : %s"
comment comment comment comment comment comment (format-time-string "%d-%m-%Y %H:%M:%S")))
;  (insert (format-time-string "%d-%m-%Y %H:%M"))
  (insert (format "\n%s    Time-stamp: <>\n%s\n" comment comment comment))
  (insert (format "%s    File name : %s\n" comment
(buffer-file-name)))

  (insert (format "%s    Description :\n%s\n" comment comment))
)

;;
;;
;; old versions of functions
;; should not be used
;;
;;
;;
;; (defun insert-time-stamp-on-create ()
;;   "insert time-stamp on create file" (interactive)
;;   (insert ";;   Time-stamp: <>")
;;   (newline))
;;
;;
;; (defun is-there-timestamp () (interactive) 
;;   ;; go to beginning of buffer for search (if not)
;;   (beginning-of-buffer)
;;   ;; search for "Time-stamp: <"
;;   (if (search-forward "Time-stamp: <" nil t)
;;       ;; if true does nothing : should never happen
;;       (progn
;; 	(message "timestamp already present")
;; 	(t)
;;        )
;;     ;; else, insert timestamp
;;     (progn
;;       (insert-time-stamp-on-create)
;;      )
;;    )
;;   ;; exit
;; )


(provide 'headers)