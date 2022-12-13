(defun yr:move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
	    (exchange-point-and-mark))
     (let ((column (current-column))
	      (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
	    (transpose-lines arg))
       (forward-line -1)))))

(defun yr:move-text-down (arg)
   "Move region (transient-mark-mode active) or current line arg lines down."
   (interactive "*p")
   (yr:move-text-internal arg))

(defun yr:move-text-up (arg)
   "Move region (transient-mark-mode active) or current line arg lines up."
   (interactive "*p")
   (yr:move-text-internal (- arg)))


(defun yr:duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (set-mark (line-end-position))
  (kill-ring-save (region-beginning) (region-end))
  (next-line 1)
  (open-line 1)
  (yank))

;; (setq default-input-method "ukrainian-computer")
(defun yr:set-input-method-ukraine ()
  (interactive)
  (set-input-method "ukrainian-computer"))


(defun yr:set-input-method-english ()
  (interactive)
  (set-input-method nil))

(defun yr:toggle-input-method ()
   (interactive)
   (if (equal current-input-method "ukrainian-computer")
       (set-input-method nil)
     (set-input-method "ukrainian-computer")))


(defun yr:end-of-line-and-indented-new-line ()
  (interactive)
  (end-of-line)
  (newline-and-indent))
