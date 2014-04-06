;;; ov.el --- Overlay library for Emacs Lisp -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2014 by Shingo Fukuyama

;; Version: 20140331.523
;; X-Original-Version: 1.0
;; Author: Shingo Fukuyama - http://fukuyama.co
;; URL: https://github.com/ShingoFukuyama/ov.el
;; Created: Mar 20 2014
;; Keywords: overlay
;; Package-Requires: ((emacs "24.3"))

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;;; Commentary:

;; Simple way to manipulate overlay for Emacs.
;; More information is in README.md or https://github.com/ShingoFukuyama/ov.el

;;; Code:

(require 'cl-lib)

(defgroup ov nil
  "Group for ov.el"
  :prefix "ov-" :group 'development)

;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Overlay-Properties.html
(defvar ov-prop-list '(priority
                       window
                       category
                       face
                       mouse-face
                       display
                       help-echo
                       field
                       modification-hooks
                       insert-in-front-hooks
                       insert-behind-hooks
                       invisible
                       intangible
                       isearch-open-invisible
                       isearch-open-invisible-temporary
                       before-string
                       after-string
                       line-prefix
                       wrap-prefix
                       evaporate
                       local-map
                       keymap))

;; Make overlay / Set properties -----------------------------------------------
(defun ov (beg end &rest properties)
  "Make an overlay from `beg' and `end', then set `properties'."
  ;; To pass properties to `ov-set'
  (when (listp (car-safe properties))
    (setq properties (car properties)))
  (let ((o (ov-make beg end)))
    (ov-set o properties)
    o))

;; Just make an overlay from `beg' and `end'.
;; Alias                             ;; Argument
(defalias 'ov-create  'make-overlay) ;; (beg end)
(defalias 'ov-make    'make-overlay) ;; (beg end)

(defun ov-line (&optional point)
  "Make an overlay from the beginning of the line to the beginning of the next line, which include `point`."
  (let (o)
    (save-excursion
      (goto-char (or point (point)))
      (setq o (ov-make (point-at-bol) (min (1+ (point-at-eol)) (point-max)))))
    o))

(defun ov-match (string &optional beg end)
  "Make overlays that match the `string'. `beg' and `end' are specify the area."
  (save-excursion
    (goto-char (or beg (point-min)))
    (let (ov-or-ovs)
      (ov-recenter (point-max))
      (while (search-forward string end t)
        (setq ov-or-ovs (cons (ov-make (match-beginning 0)
                                            (match-end 0)) ov-or-ovs)))
      ov-or-ovs)))

(defun ov-regexp (regexp &optional beg end)
  "Make overlays that match the `regexp'. `beg' and `end' are specify the area."
  (save-excursion
    (goto-char (or beg (point-min)))
    (let (ov-or-ovs)
      (ov-recenter (point-max))
      (while (re-search-forward regexp end t)
        (setq ov-or-ovs (cons (ov-make (match-beginning 0)
                                            (match-end 0)) ov-or-ovs)))
      ov-or-ovs)))

(defun ov-region ()
  "Make an overlay from a region, when you make a region"
  (if mark-active
      (let ((o (ov-make (region-beginning) (region-end))))
        (deactivate-mark t)
        o)
    (error "Error: Need to make region")))

(defun ov-set (ov-or-ovs-or-regexp &rest properties)
  "Set properties and values in an overlay or overlays alternately."
  (unless (and ov-or-ovs-or-regexp properties)
    (error "Error: arguments are OV and PROPERTIES"))
  (cond ((stringp ov-or-ovs-or-regexp)
         (setq ov-or-ovs-or-regexp (ov-regexp ov-or-ovs-or-regexp)))
        ((ov-p ov-or-ovs-or-regexp)
         (setq ov-or-ovs-or-regexp (cons ov-or-ovs-or-regexp nil))))
  (when (listp (car-safe properties))
    (setq properties (car properties)))
  (let ((len (length properties))
        (i 0))
    (unless (eq (logand len 1) 0)
      (error "Error: invalid properties pairs"))
    (mapc (lambda (ov)
            (while (< i len)
              (overlay-put ov (nth i properties) (nth (setq i (1+ i)) properties))
              (setq i (1+ i)))
            (setq i 0))
          ov-or-ovs-or-regexp)
    nil))
(defalias 'ov-put 'ov-set)


;; Delete overlay --------------------------------------------------------------
;;;###autoload
(cl-defun ov-clear (&optional prop-or-beg (val-or-end 'any) beg end)
  "Clear `beg' and `end' of overlays whose `property' has `value'."
  (interactive)
  (cl-labels ((clear
               (con beg end)
               (ov-recenter (or end (point-max)))
               (mapc (lambda (ov)
                       (when (and (memq prop-or-beg (ov-prop ov))
                                  (if con
                                      t (equal val-or-end (ov-val ov prop-or-beg))))
                         (delete-overlay ov)))
                     (overlays-in beg end))))
    (cond
     ;; (ov-clear)
     ((and (not prop-or-beg) (eq 'any val-or-end) (not beg) (not end))
      (ov-recenter (point-max))
      (remove-overlays (point-min) (point-max)))
     ;; (ov-clear 10 500)
     ((and (numberp prop-or-beg) (numberp val-or-end))
      (ov-recenter val-or-end)
      (remove-overlays prop-or-beg val-or-end))
     ;; (ov-clear 'face 'warning)
     ((and (symbolp prop-or-beg) (not (eq 'any val-or-end)) (not beg) (not end))
      (clear nil (point-min) (point-max)))
     ;; (ov-clear 'face) or (ov-clear 'face 'any)
     ((and (symbolp prop-or-beg) (eq 'any val-or-end) (not beg) (not end))
      (clear t (point-min) (point-max)))
     ;; (ov-clear 'face 'worning 10 500)
     ((and (symbolp prop-or-beg) (not (eq 'any val-or-end)) (numberp beg) (numberp end))
      (clear nil beg end))
     ;; (ov-clear 'face 'any 10 500)
     ((and (symbolp prop-or-beg) (eq 'any val-or-end) (numberp beg) (numberp end))
      (clear t beg end))
     (t nil)))
  nil)

(defmacro ov-reset (ov-or-ovs-variable)
  "Clear overlays in `ov-or-ovs-variable'. The variable is going to be nil."
  `(progn
     (mapc (lambda (ov)
             (delete-overlay ov))
           (if (listp ,ov-or-ovs-variable)
               ,ov-or-ovs-variable
             (cons ,ov-or-ovs-variable nil)))
     (setq ,ov-or-ovs-variable nil)))


;; Look up overlay parameters, etc ---------------------------------------------
;; Alias                                ;; Argument
;; Check whether `ov' is overlay or not.
(defalias 'ov-p    'overlayp)           ;; (ov)
(defalias 'ov?     'overlayp)           ;; (ov)
(defalias 'ov-val  'overlay-get)        ;; (ov property)
;; Get the boundary position of an overlay.
(defalias 'ov-beg  'overlay-start)      ;; (ov)
(defalias 'ov-end  'overlay-end)        ;; (ov)
;; Get the buffer object of an overlay.
(defalias 'ov-buf  'overlay-buffer)     ;; (ov)
;; Get the properties from an overlay.
(defalias 'ov-prop 'overlay-properties) ;; (ov)

(defun ov-spec (ov-or-ovs)
  "Make a specification list from an overlay or overlay list."
  (or (listp ov-or-ovs) (setq ov-or-ovs (cons ov-or-ovs nil)))
  (mapcar (lambda (ov)
            (list (ov-beg ov) (ov-end ov)
                  (ov-buf ov) (overlay-properties ov)))
          ov-or-ovs))


;; Get present overlay object --------------------------------------------------
(defun ov-at (&optional point)
  "Get an overlay from `point' or when the cursor is at an existing overlay."
  (or point (setq point (point)))
  (car (overlays-at point)))

;; Get overlays between `beg' and `end'.
(cl-defun ov-in (&optional prop-or-beg (val-or-end 'any) beg end)
  (cl-labels ((in (con beg end)
                  (delq nil
                        (mapcar
                         (lambda ($ov)
                           (when (and (memq prop-or-beg (ov-prop $ov))
                                      (if con
                                          t (equal val-or-end (ov-val $ov prop-or-beg))))
                             $ov))
                         (overlays-in beg end)))))
    (cond
     ;; (ov-in)
     ((and (not prop-or-beg) (eq 'any val-or-end) (not beg) (not end))
      (overlays-in (point-min) (point-max)))
     ;; (ov-in 10 500)
     ((and (numberp prop-or-beg) (numberp val-or-end))
      (overlays-in prop-or-beg val-or-end))
     ;; (ov-in 'face 'warning)
     ((and (symbolp prop-or-beg) (not (eq 'any val-or-end)) (not beg) (not end))
      (in nil (point-min) (point-max)))
     ;; (ov-in 'face) or (ov-in 'face 'any)
     ((and (symbolp prop-or-beg) (eq 'any val-or-end) (not beg) (not end))
      (in t (point-min) (point-max)))
     ;; (ov-in 'face 'worning 10 500)
     ((and (symbolp prop-or-beg) (not (eq 'any val-or-end)) (numberp beg) (numberp end))
      (in nil beg end))
     ;; (ov-in 'face 'any 10 500)
     ((and (symbolp prop-or-beg) (eq 'any val-or-end) (numberp beg) (numberp end))
      (in t beg end))
     (t nil))))

(defun ov-all ()
  "Get overlays in the whole buffer."
  (overlays-in (point-min) (point-max)))

(defun ov-backwards (&optional point)
  "Get overlays within from the beginning of the buffer to `point'."
  (ov-in (point-min) (or point (point))))

(defun ov-forwards (&optional point)
  "Get overlays within from the buffer to `point' to the end of the buffer."
  (ov-in (or point (point)) (point-max)))


;; Overlay manipulation --------------------------------------------------------
;; Alias                                  ;; Argument
(defalias 'ov-recenter 'overlay-recenter) ;; (point)
;; Move an existing overlay position to another position.
(defalias 'ov-move     'move-overlay)     ;; (ov beg end &optional buffer)

(defmacro ov-timeout (time func func-after)
  "Execute `func-after' after `time' seconds passed since `func' done."
  (declare (indent 1))
  (if (symbolp func-after)
      (run-with-timer time nil `(lambda () (funcall ',func-after)))
    (run-with-timer time nil `(lambda () ,(funcall `(lambda () ,func-after)))))
  (if (symbolp func)
      (funcall func)
    (funcall (lambda () (eval func)))))

(cl-defun ov-next (&optional point-or-prop prop-or-val (val 'any))
  "Get the next existing overlay from `point-or-prop'. You can also specify `prop-or-val' and its `val'."
  (cl-labels ((next
               (po pr va)
               (save-excursion
                 (goto-char (next-overlay-change po))
                 (let (ov)
                   (while (and (not (if (setq ov (ov-at (point)))
                                        (and (memq pr (ov-prop ov))
                                             (if (eq 'any va)
                                                 t (equal va (ov-val ov pr))))))
                               (not (if (eobp) (progn (setq ov nil) t))))
                     (goto-char (next-overlay-change (point))))
                   ov))))
    (cond
     ;; (ov-next) or (ov-next 300)
     ((and (or (numberp point-or-prop) (not point-or-prop))
           (not prop-or-val) (eq 'any val))
      (let* ((po (next-overlay-change (or point-or-prop (point))))
             (ov (ov-at po)))
        (if (ov? ov)
            ov
          (ov-at (next-overlay-change po)))))
     ;; (ov-next 'face)
     ((and point-or-prop (symbolp point-or-prop) (not prop-or-val) (eq 'any val))
      (next (point) point-or-prop 'any))
     ;; (ov-next 'face 'warning)
     ((and point-or-prop (symbolp point-or-prop) prop-or-val (eq 'any val))
      (next (point) point-or-prop prop-or-val))
     ;; (ov-next 300 'face 'warning)
     ((and (or (not point-or-prop) (numberp point-or-prop))
           (symbolp prop-or-val) (not (eq 'any val)))
      (next (or point-or-prop (point)) prop-or-val val))
     ;; (ov-next 300 'face)
     ((and (or (numberp point-or-prop) (not point-or-prop)) (symbolp prop-or-val))
      (next (or point-or-prop (point)) prop-or-val val))
     (t nil))))

(cl-defun ov-prev (&optional point-or-prop prop-or-val (val 'any))
  "Get the previous existing overlay from `point-or-prop'. You can also specify `prop-or-val' and its `val'."
  (cl-labels ((prev
               (po pr va)
               (save-excursion
                 (goto-char (previous-overlay-change po))
                 (let (ov)
                   (while (and (not (if (setq ov (ov-at (1- (point))))
                                        (and (memq pr (ov-prop ov))
                                             (if (eq 'any va)
                                                 t (equal va (ov-val ov pr))))))
                               (not (if (bobp) (progn (setq ov nil) t))))
                     (goto-char (previous-overlay-change (point))))
                   ov))))
    (cond
     ((and (or (numberp point-or-prop) (not point-or-prop))
           (not prop-or-val) (eq 'any val))
      (ov-at (1- (previous-overlay-change (or point-or-prop (point))))))
     ;; (ov-prev 'face)
     ((and point-or-prop (symbolp point-or-prop) (not prop-or-val) (eq 'any val))
      (prev (point) point-or-prop 'any))
     ;; (ov-prev 'face 'warning)
     ((and point-or-prop (symbolp point-or-prop) prop-or-val (eq 'any val))
      (prev (point) point-or-prop prop-or-val))
     ;; (ov-prev 300 'face 'warning)
     ((and (or (not point-or-prop) (numberp point-or-prop))
           (symbolp prop-or-val) (not (eq 'any val)))
      (prev (or point-or-prop (point)) prop-or-val val))
     ;; (ov-prev 300 'face)
     ((and (or (numberp point-or-prop) (not point-or-prop)) (symbolp prop-or-val))
      (prev (or point-or-prop (point)) prop-or-val val))
     (t nil))))


;; Impliment pseudo read-only overlay function ---------------------------------
(defun ov-read-only (ov-or-ovs)
  "It implements a read-only like feature for overlay. It's not as good as that of the text property."
  (or (listp ov-or-ovs) (setq ov-or-ovs (cons ov-or-ovs nil)))
  (mapc (lambda (ov)
          (overlay-put ov 'modification-hooks    '(ov--read-only))
          (overlay-put ov 'insert-in-front-hooks '(ov--read-only)))
        ov-or-ovs))

;; http://lists.gnu.org/archive/html/emacs-devel/2002-08/msg00428.html
(defvar ov-save-comint-last-prompt-overlay nil)
(defun ov--read-only (overlay after start end &optional _len)
  (if (and (not after)
           (or (< (ov-beg overlay) start)
               (> (ov-end overlay) end)))
      (error "")))

(defadvice comint-output-filter (around swap-read-only activate)
  "Add a read-only equivalency to the last prompt overlay."
  ;; Caution: in Emacs <~21.2, a new overlay gets created for each
  ;; prompt... in later versions, text-properties for old prompts
  ;; are used instead, and the original overlay is recycled.  In
  ;; this case, we can advise snapshot-last-prompt to remove the
  ;; read-only *text properties* (not the overlay properties).
  ;; Here we test to ensure the prompt isn't in the same position as
  ;; the process-mark before removing the read-only overlay stuff.
  (when (and ov-save-comint-last-prompt-overlay
             (not (equal
                   (marker-position (process-mark (get-buffer-process
                                                   (current-buffer))))
                   (ov-end
                    ov-save-comint-last-prompt-overlay))))
    (overlay-put ov-save-comint-last-prompt-overlay
                 'modification-hooks nil)
    (overlay-put ov-save-comint-last-prompt-overlay
                 'insert-in-front-hooks' nil))
  ad-do-it
  (when comint-last-prompt-overlay
    (setq ov-save-comint-last-prompt-overlay
          comint-last-prompt-overlay)
    (overlay-put comint-last-prompt-overlay 'intangible t)
    (overlay-put comint-last-prompt-overlay 'modification-hooks
                 '(idlwave-shell-comint-signal-read-only))
    (overlay-put comint-last-prompt-overlay 'insert-in-front-hooks
                 '(idlwave-shell-comint-signal-read-only))))

(defadvice comint-snapshot-last-prompt (after remove-text-read-only activate)
  "Remove the read-only text properties potentially set by snapshot"
  (when comint-last-prompt-overlay
    (remove-text-properties
     (ov-beg comint-last-prompt-overlay)
     (ov-end comint-last-prompt-overlay)
     '(modification-hooks nil insert-in-front-hooks nil))))


(provide 'ov)
;;; ov.el ends here
