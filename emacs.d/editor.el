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


;; source https://emacs.stackexchange.com/questions/51986/show-paren-mode-only-highlights-when-cursor-is-one-character-after-closing-paren
(defun show-paren--locate-near-paren-ad ()
  "Locate an unescaped paren \"near\" point to show.
If one is found, return the cons (DIR . OUTSIDE), where DIR is 1
for an open paren, -1 for a close paren, and OUTSIDE is the buffer
position of the outside of the paren.  Otherwise return nil."
  (let* ((before (show-paren--categorize-paren (point))))
    (when (or
       (eq (car before) 1)
       (eq (car before) -1))
      before)))

(advice-add 'show-paren--locate-near-paren :override #'show-paren--locate-near-paren-ad)


;; source: https://stackoverflow.com/questions/3417438/close-all-buffers-besides-the-current-one-in-emacs
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (delq (current-buffer)
              (remove-if-not 'buffer-file-name (buffer-list)))))
