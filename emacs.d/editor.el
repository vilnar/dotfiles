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
 company-idle-delay 0.2
 company-minimum-prefix-length 3)

(defun mars/company-backend-with-yas (backends)
  "Add :with company-yasnippet to company BACKENDS.
Taken from https://github.com/syl20bnr/spacemacs/pull/179."
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
(fido-vertical-mode)


;; taken from https://emacs.stackexchange.com/questions/28355/how-to-unmark-selection-in-elisp
(defun yr:swiper-or-region (beg end)
  "Swiper region or 'empty string' if none highlighted."
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list nil nil)))
  (if (and beg end)
      (progn
        (deactivate-mark)
        (swiper (buffer-substring-no-properties beg end)))
    (swiper)))



;; highlight brackets
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
