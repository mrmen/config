;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:52:05
;;    Time-stamp: <17-06-2013 20:55:10>
;;
;;    File name : /home/mrmen/.emacs.d/wanderlust-def.el
;;    Description :
;;




;; ;; Wanderlust test stuff for gmail:
;; ;; wanderlust
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; IMAP, gmail:
(setq elmo-imap4-default-server "imap.gmail.com"
      elmo-imap4-default-user "tetcheve@gmail.com"
      elmo-imap4-default-authenticate-type 'clear
      elmo-imap4-default-port '993
      elmo-imap4-default-stream-type 'ssl

      ;;for non ascii-characters in folder-names
      elmo-imap4-use-modified-utf7 t)

;; SMTP
(setq wl-smtp-connection-type 'starttls
      wl-smtp-posting-port 587
      wl-smtp-authenticate-type "plain"
      wl-smtp-posting-user "tetcheve"
      wl-smtp-posting-server "smtp.gmail.com"
      wl-local-domain "gmail.com"
      wl-message-id-domain "smtp.gmail.com")

(setq wl-from "Thomas Etcheverria <tetcheve@gmail.com>"

      ;;all system folders (draft, trash, spam, etc) are placed in the
      ;;[Gmail]-folder, except inbox. "%" means it's an IMAP-folder
      wl-default-folder "%inbox"
      wl-draft-folder   "%[Gmail]/Drafts"
      wl-trash-folder   "%[Gmail]/Trash"
      wl-fcc            "%[Gmail]/Sent"

      ;; mark sent messages as read (sent messages get sent back to you and
      ;; placed in the folder specified by wl-fcc)
      wl-fcc-force-as-read    t

      ;;for when auto-compleating foldernames
      wl-default-spec "%")

(setq
  ;; hide many fields from message buffers
  wl-message-ignored-field-list '("^.*:")
  wl-message-visible-field-list
  '("^\\(To\\|Cc\\):"
    "^Subject:"
    "^\\(From\\|Reply-To\\):"
    "^Organization:"
    "^Message-Id:"
    "^\\(Posted\\|Date\\):"
    )
  wl-message-sort-field-list
  '("^From"
    "^Organization:"
    "^X-Attribution:"
     "^Subject"
     "^Date"
     "^To"
     "^Cc"))

;;Only save draft when I tell it to (C-x C-s or C-c C-s):
(setq wl-auto-save-drafts-interval nil)


(provide 'wanderlust-def)
