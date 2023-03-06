(defun yr:isearch-improve (arg-forward)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (let ((selection (buffer-substring-no-properties (mark) (point))))
          ;; (debug selection)
          (deactivate-mark)
          (isearch-mode arg-forward)
          (isearch-yank-string selection)))
    (if arg-forward
        (call-interactively #'isearch-forward)
      (call-interactively #'isearch-backward))))

(defun yr:isearch-forward-improve ()
  "isearch forward with selected text"
  (interactive)
  (yr:isearch-improve t))

(defun yr:isearch-backward-improve ()
  "isearch backward with selected text"
  (interactive)
  (yr:isearch-improve nil))

(defun yr:occur-improve ()
  "occur with selected text"
  (interactive)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (let ((selection (buffer-substring-no-properties (mark) (point))))
          (deactivate-mark)
          (occur selection)))
    (call-interactively #'occur)))

(defun yr:consult-line-improve ()
  "consult-line with selected text"
  (interactive)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (let ((selection (buffer-substring-no-properties (mark) (point))))
          (deactivate-mark)
          (consult-line selection)))
    (call-interactively #'consult-line)))

(defun yr:fzf-directory-improve ()
  "fzf-directory with copy selected text"
  (interactive)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (kill-ring-save (mark) (point))
        (deactivate-mark)
        (call-interactively #'fzf-directory))
    (call-interactively #'fzf-directory)))

(defun yr:query-replace-improve ()
  "query-replace with copy selected text"
  (interactive)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (kill-ring-save (mark) (point))
        (deactivate-mark)
        (goto-char (mark))
        (call-interactively #'query-replace))
    (call-interactively #'query-replace)))

(require 'hi-lock)
(defun yr:toggle-mark-word-at-point ()
  "Highlighting the current word."
  (interactive)
  (if hi-lock-interactive-patterns
      (unhighlight-regexp (car (car hi-lock-interactive-patterns)))
    (highlight-symbol-at-point)))
(add-to-list 'hi-lock-face-defaults "highlight")


