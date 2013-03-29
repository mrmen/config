;;
;;
;;    Thomas "Mr Men" Etcheverria
;;    <tetcheve (at) gmail .com>
;;
;;    Created on : 08-02-2013 10:53:00
;;    Time-stamp: <08-02-2013 10:53:30>
;;
;;    File name : /home/mrmen/.emacs.d/jabber-def.el
;;    Description :
;;

(require 'jabber)
(setq jabber-account-list
      '(("tetcheve@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl))
        ("tetcheve@chat.facebook.com"
         (:network-server . "chat.facebook.com")
         (:connection-type . network))))

(provide 'jabber-def)
