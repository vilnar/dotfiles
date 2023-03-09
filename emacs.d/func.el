;; source: https://github.com/bbatsov/crux/blob/master/crux.el
(defun yr:kill-other-buffers ()
  "Kill all buffers but the current one.
Doesn't mess with special buffers."
  (interactive)
  (when (y-or-n-p "Are you sure you want to kill all buffers but the current one? ")
    (seq-each
     #'kill-buffer
     (delete (current-buffer) (seq-filter #'buffer-file-name (buffer-list))))))


(defun yr:open-gnome-terminal ()
  (interactive)
  (shell-command "gnome-terminal"))
