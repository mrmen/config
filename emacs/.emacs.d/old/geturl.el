(require 'url)


(defun www-edit-web-page (url)
  "Retrieve web page and load into new buffer for editing.
Automatically insert after <body> tag URL, appropriately html-tagged URL."
  (interactive "sLoad URL: ")
  (with-temp-buffer (url-retrieve url 'edit-web-page)))


(defun edit-web-page (status)
      "Switch to the buffer returned by `url-retreive'.
    The buffer should contain the web page sent by the server."
      (switch-to-buffer (current-buffer))
    (goto-char 0)
    (re-search-forward "<body.*>" nil t) ;go to end of <body ...> tag.
    ;insert URL into page
    (insert "\n<p>From: <a href=\"" url "\">" url "</a>\n </p>\n\n"))

(defun read-line ()
  (interactive)
  (beginning-of-buffer)
  (if (eq (point) (point-max))
      (message "Fin")
    (
     (string-match ".*feed.controls.*" (setq string (buffer-substring
						 beginning-of-line end-of-line)))
     (message "got")
     (next-line)
     )
    )
  )


