(with-eval-after-load "ispell"
  (setenv "LANG" "en_US.UTF-8")
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_US,uk_UA")
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,uk_UA")
  (setq ispell-personal-dictionary "~/.hunspell_personal"))

(defun yr-toggle-flyspell ()
  "Toggle flyspell-mode."
  (interactive)
  ;; (message "debug %s"  (symbol-value flyspell-mode))
  (if (symbol-value flyspell-mode)
      (progn
        (turn-off-flyspell)
        ;; (flyspell-mode 0)
        (message "speller disable"))
    ;; (flyspell-mode 1)
    ;; (flyspell-buffer)
    (turn-on-flyspell)
    (message "speller enable")))


;; saving history
(savehist-mode 1)
(setq savehist-additional-variables
      '(search-ring
        regexp-search-ring
        kill-ring
        file-name-history
        command-history
        shell-command-history))

;; diff
(setq
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain)


(setq dired-listing-switches "-lah --group-directories-first")
