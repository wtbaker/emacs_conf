(setq-default tags-file-name (format "%s/%s" temporary-file-directory ".emacs.root.tags"))


(defvar tagging-root-path "~/dev" "The default directory to recursively tag")

(defun tagging-update-file-cache ()
    "Refresh the file cache for tagging-root-path"
    (interactive)
    (file-cache-add-directory-recursively tagging-root-path))

(defun tagging-update-tags ()
    "Refresh the tag file for tagging-root-path"
    (interactive)
    (compile
        (format
            "exctags -f %s --languages=C,Make,HTML,Tex -e -R %s"
            tags-file-name
            (expand-file-name tagging-root-path)))
    (delete-window (get-buffer-window (get-buffer "*compilation*"))))
