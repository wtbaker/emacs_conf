(defun buffers-close-all ()
    (interactive)
    (mapc 'kill-buffer (buffer-list)))
