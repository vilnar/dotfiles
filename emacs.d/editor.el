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
;; (fido-vertical-mode)
