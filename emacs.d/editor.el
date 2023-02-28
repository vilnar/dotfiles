(with-eval-after-load "ispell"
  (setenv "LANG" "en_US.UTF-8")
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_US,uk_UA")
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,uk_UA")
  (setq ispell-personal-dictionary "~/.hunspell_personal"))

(defun yr:toggle-flyspell ()
  "Toggle flyspell-mode."
  (interactive)
  ;; (message "debug %s"  (symbol-value flyspell-mode))
  (if (symbol-value flyspell-mode)
      (progn
        (flyspell-mode 0)
        (message "speller disable"))
    (flyspell-mode 1)
    (flyspell-buffer)
    (message "speller enable")))


;; autocomplete (default)
(global-company-mode 1)
(setq
 company-dabbrev-code-ignore-case t
 company-idle-delay 0.2
 company-minimum-prefix-length 3)

;; source https://github.com/syl20bnr/spacemacs/pull/179
(defun mars/company-backend-with-yas (backends)
  "Add :with company-yasnippet to company BACKENDS."
  (if (and (listp backends) (memq 'company-yasnippet backends))
	    backends
	  (append (if (consp backends)
		            backends
		          (list backends))
		        '(:with company-yasnippet))))

;; add yasnippet to all backends
(setq company-backends
      (mapcar #'mars/company-backend-with-yas company-backends))


;; enhances name completion when in minibuffer prompts (default)
;; (icomplete-vertical-mode)
;; (fido-vertical-mode)


;; source: https://github.com/bbatsov/crux/blob/master/crux.el
(defun yr:kill-other-buffers ()
  "Kill all buffers but the current one.
Doesn't mess with special buffers."
  (interactive)
  (when (y-or-n-p "Are you sure you want to kill all buffers but the current one? ")
    (seq-each
     #'kill-buffer
     (delete (current-buffer) (seq-filter #'buffer-file-name (buffer-list))))))
