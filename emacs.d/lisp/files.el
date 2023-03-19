(defun yr-wrap-find-name-with-path ()
  (interactive)
  (setq-local find-args "-not -path './.git/*' -path \"*\"")
  (call-interactively 'find-dired))

(defun yr-wrap-find-name-with-name ()
  (interactive)
  (setq-local find-args "-not -path './.git/*' -name \"\"")
  (call-interactively 'find-dired))

;; Source: http://ergoemacs.org/emacs/emacs_new_empty_buffer.html
(defun yr-new-empty-buffer ()
  "Open a new empty buffer"
  (interactive)
  (let (($buf (generate-new-buffer "untitled")))
    (switch-to-buffer $buf)
    (text-mode)
    (setq buffer-offer-save t)
    $buf))

(defun yr-path-file-absolute-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
		                  default-directory
		                (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun yr-file-name-to-clipboard ()
  "Copy the current buffer filename part to the clipboard."
  (interactive)
  (let ((filepart (file-name-nondirectory buffer-file-name)))
    (if filepart
	      (progn
	        (message "Copied buffer file part '%s' to the clipboard." filepart)
	        (kill-new filepart))
      (error "Buffer not visiting a file"))))


(defcustom yr-old-name-arg ""
  "old file name"
  :type 'string)

(defun yr-rename-file-and-buffer ()
  "Renames current buffer and file"
  (interactive)
  (let ((name (buffer-name))
	      (filename (buffer-file-name)))
    (if (not filename)
	      (message "Buffer '%s' is not visiting a file!" name)
      (setq yr-old-name-arg name)
      (call-interactively 'yr-rename-file-and-buffer-to-new-name))))


(defun yr-rename-file-and-buffer-to-new-name (new-name)
  "Renames current buffer and file to NEW-NAME."
  (interactive (list (read-string "New name: " yr-old-name-arg)))
  (if (get-buffer new-name)
	    (message "A buffer named '%s' already exists!" new-name)
	  (progn
	    (rename-file buffer-file-name new-name 1)
	    (rename-buffer new-name)
	    (set-visited-file-name new-name)
	    (set-buffer-modified-p nil))))


