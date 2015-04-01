(defun delimator-delete-active-file ()
    "Delete the file associated with the active buffer"
    (interactive)
    (let ((file (buffer-file-name)))
      (when file
        (if (vc-backend file)
            (vc-delete-file file)
          (progn
            (delete-file file)
            (message "Deleted file %s" file)
            (kill-buffer))))))

(provide 'delimator)
