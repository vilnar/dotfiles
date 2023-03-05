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


(require 'hi-lock)
(defun yr:toggle-mark-word-at-point ()
  "Highlighting the current word."
  (interactive)
  (if hi-lock-interactive-patterns
      (unhighlight-regexp (car (car hi-lock-interactive-patterns)))
    (highlight-symbol-at-point)))
(add-to-list 'hi-lock-face-defaults "highlight")


(defun yr:mark-whole-word (&optional arg allow-extend)
  "Like `mark-word', but selects whole words and skips over whitespace.
If you use a negative prefix arg then select words backward.
Otherwise select them forward.

If cursor starts in the middle of word then select that whole word.

If there is whitespace between the initial cursor position and the
first word (in the selection direction), it is skipped (not selected).

If the command is repeated or the mark is active, select the next NUM
words, where NUM is the numeric prefix argument.  (Negative NUM
selects backward.)"
  (interactive "P\np")
  (let ((num  (prefix-numeric-value arg)))
    (unless (eq last-command this-command)
      (if (natnump num)
          (skip-syntax-forward "\\s-")
        (skip-syntax-backward "\\s-")))
    (unless (or (eq last-command this-command)
                (if (natnump num)
                    (looking-at "\\b")
                  (looking-back "\\b")))
      (if (natnump num)
          (left-word)
        (right-word)))
    (mark-word arg allow-extend)))

