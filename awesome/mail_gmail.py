#!/usr/bin/python

import imaplib
import sys
import os

# id infos
user='xxx@gmail.com'
passwd='xxx'


is_reachable=os.system("ping -c1 -W2s imap.gmail.com &>/dev/null")
if (is_reachable==0):
    conn = imaplib.IMAP4_SSL('imap.gmail.com')
    conn.login(user,passwd)
    conn.select('Inbox','readonly')
    tmp, unseen = conn.search(None,'UNSEEN')
    file = open('/home/mrmen/tmp/gmail_headers','w')
    if (unseen[0].split() != []):
        for i in unseen[0].split():
            a,b = conn.fetch(i,'(RFC822.SIZE BODY[HEADER.FIELDS (SUBJECT FROM)])')
            all = b[0][1]#str(b[0][1])
            # tmp=str(all.splitlines()[0])[8:]#.split("\r")[0]
            # tmp = tmp[:len(tmp)-1]
            file.write(str(all)+str("\n"))
    else:
        file.write("")

    file.close()
    os.system("bash /home/mrmen/tmp/script.sh")
    nombre = len(unseen[0].split())
    print("<span color='red'>"+str(nombre)+"</span>")
else:
    print("<span color='red'>Err</span>")
