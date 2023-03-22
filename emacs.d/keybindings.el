;; Globally override key binding for all minor modes
;; sources:
;; https://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs
;; https://shallowsky.com/blog/linux/editors/emacs-global-key-bindings.html
(defvar my-keys-minor-mode-map (make-sparse-keymap)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that global key settings override annoying major modes."
  t "global-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(defconst global-minor-mode-alist
  (list (cons
         'my-keys-minor-mode
         my-keys-minor-mode-map)))

(setf emulation-mode-map-alists '(global-minor-mode-alist))

;; turn off for minibuffer
(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

;; examples
;; (define-key my-keys-minor-mode-map (kbd "C-d") #'mc/mark-next-like-this-word)


;; ====================================================================

(global-unset-key (kbd "M-c"))
(global-unset-key (kbd "C-."))

(global-set-key (kbd "M-u") 'avy-goto-char-2)

(global-set-key (kbd "M-s") 'save-buffer)
;; (global-set-key (kbd "C-x f") 'find-file)
(global-set-key (kbd "M-o") 'find-file)

(global-set-key (kbd "M-q") 'kill-buffer)
(global-set-key (kbd "C-q") 'kill-buffer)
(global-set-key (kbd "C-M-q") 'save-buffers-kill-emacs)

(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)


(global-set-key (kbd "M-;") 'yr-consult-line-improve)
(global-set-key (kbd "C-;") 'yr-consult-line-improve)
(global-unset-key (kbd "M-g"))
(global-set-key (kbd "M-g") 'consult-goto-line)
(global-set-key (kbd "M-y") 'consult-yank-pop)

;; comment toggle
(global-unset-key (kbd "M-/"))
(global-set-key (kbd "M-/") 'comment-line)
(global-unset-key (kbd "C-/"))
(global-set-key (kbd "C-/") 'comment-line)


;; (global-set-key (kbd "<f6>") 'flyspell-buffer)
(global-set-key (kbd "<f6>") 'yr-toggle-flyspell)
;; (global-set-key (kbd "<f7>") 'switch-to-buffer-other-tab)
(global-set-key (kbd "<f7>") 'tab-new)
(global-set-key (kbd "<f8>") 'toggle-truncate-lines)
(global-set-key (kbd "<f9>") 'whitespace-mode)
(global-set-key (kbd "<f10>") 'dired-sidebar-toggle-sidebar)
;; (global-set-key (kbd "<f8>") 'tab-new)
;; (global-set-key (kbd "<f9>") 'bookmark-set)
;; (global-set-key (kbd "<f10>") 'bookmark-jump)
;; (global-set-key (kbd "<f12>") 'bookmark-bmenu-list)
(global-set-key (kbd "<f12>") 'save-buffers-kill-emacs)

;; (global-set-key (kbd "M-c f f") 'yr-fzf-directory-improve)
;; (global-set-key (kbd "M-c f f") 'yr-fzf-projectile-improve)
(global-set-key (kbd "M-c f f") #'yr-projectile-find-file-improve)
(global-set-key (kbd "M-c f c") #'projectile-find-file-in-directory)
;; (global-set-key (kbd "M-k") #'rg-literal)
(global-set-key (kbd "M-c g m") #'rg-menu)
(global-set-key (kbd "M-c g g") #'rg-project)
;; (global-set-key (kbd "M-c p") 'projectile-command-map)
(global-set-key (kbd "M-c p") 'projectile-switch-project)
(global-set-key (kbd "M-h") 'lazy-highlight-cleanup)


(global-set-key [(control shift up)]  'yr-move-text-up)
(global-set-key [(control shift down)]	'yr-move-text-down)

(define-key my-keys-minor-mode-map (kbd "C-S-d") 'crux-duplicate-current-line-or-region)

;; (global-set-key (kbd "C-\\") 'yr-set-input-method-ukraine)
;; (global-set-key (kbd "M-\\") 'yr-set-input-method-english)
(global-set-key (kbd "M-l") 'yr-toggle-input-method)

(global-set-key (kbd "<C-S-return>") 'crux-smart-open-line-above)
(global-set-key (kbd "<C-return>") 'crux-smart-open-line)

(global-unset-key (kbd "M-m"))
(global-set-key (kbd "M-m") 'yr-toggle-mark-word-at-point)
;; (global-set-key (kbd "C-M-SPC") 'er/mark-word)
;; (global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-M-SPC") 'er/expand-region)
(global-set-key (kbd "C-M-l") 'yr-copy-line)

(global-set-key (kbd "M-5")
                (lambda ()
                  (interactive)
                  (other-window -1))) ;; back one
(define-key winum-keymap (kbd "M-1") 'winum-select-window-1)
(define-key winum-keymap (kbd "M-2") 'winum-select-window-2)
(define-key winum-keymap (kbd "M-3") 'winum-select-window-3)
(define-key winum-keymap (kbd "M-4") 'winum-select-window-4)

;; go to last mark
(global-set-key (kbd "M--") 'consult-mark)
(global-set-key (kbd "M-=") 'consult-global-mark)

(global-unset-key (kbd "C-z"))
(define-key my-keys-minor-mode-map (kbd "C-z")   'undo-fu-only-undo)
(define-key my-keys-minor-mode-map (kbd "C-S-z") 'undo-fu-only-redo)
(define-key my-keys-minor-mode-map (kbd "M-z")   'undo-fu-only-undo)
(define-key my-keys-minor-mode-map (kbd "C-M-z") 'undo-fu-only-redo)


;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; autocomplete
;; (global-set-key (kbd "M-SPC") 'dabbrev-completion)
(global-set-key (kbd "M-SPC") 'company-complete)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-SPC") #'company-complete)
  (define-key company-active-map (kbd "M-n") #'company-select-next)
  (define-key company-active-map (kbd "M-p") #'company-select-previous)
  (define-key company-active-map (kbd "M-y") #'company-complete-selection)
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd "RET") nil)
  (define-key company-active-map (kbd "TAB") nil))


(global-unset-key (kbd "M-r"))
(global-set-key (kbd "M-r") 'yr-query-replace-improve)
;; (global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-s") 'yr-isearch-forward-improve)
(global-set-key (kbd "C-r") 'yr-isearch-backward-improve)
(global-set-key (kbd "M-c w") 'isearch-toggle-word)
(global-set-key (kbd "M-c b") 'yr-occur-improve)


;; (global-set-key (kbd "s-<tab>") 'switch-to-buffer)
(global-set-key (kbd "s-<tab>") 'consult-buffer)
(global-set-key (kbd "C-<tab>") #'ibuffer)
;; (global-set-key (kbd "M-c b") 'ibuffer-other-window)


;; multiple-cursors
(global-unset-key (kbd "M-<down-mouse-1>"))
(define-key my-keys-minor-mode-map (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
(define-key my-keys-minor-mode-map [(meta down)] 'mc/mark-next-like-this)
(define-key my-keys-minor-mode-map (kbd "C-d") #'mc/mark-next-like-this-word)
(define-key my-keys-minor-mode-map (kbd "M-c C-d") 'mc/skip-to-next-like-this)


(global-set-key (kbd "M-c 1") 'google-translate-at-point)
(global-set-key (kbd "M-c 2") 'google-translate-at-point-reverse)


;; ctags
(global-set-key (kbd "M-c t j") 'citre-jump)
(global-set-key (kbd "M-c t J") 'citre-jump-back)
(global-set-key (kbd "M-c t p") 'citre-peek)
(global-set-key (kbd "M-c t u") 'citre-update-this-tags-file)

(define-key citre-peek-keymap (kbd "<up>") 'citre-peek-prev-tag)
(define-key citre-peek-keymap (kbd "<down>") 'citre-peek-next-tag)
(define-key citre-peek-keymap (kbd "M-j") 'citre-peek-jump)


;; alias  -------------------------------------------------------------
(defalias 'noh 'lazy-highlight-cleanup)
(defalias 'rep 'query-replace)
(defalias 'wrap-toggle 'toggle-truncate-lines)

(defalias 'gst 'magit-status)
(defalias 'gblame 'magit-blame)
(defalias 'glog 'magit-log-current)
(defalias 'gdiff-range 'magit-diff-range)
(defalias 'gdiff-file 'magit-diff-buffer-file)
(defalias 'gsub 'magit-submodule-update-all)
(defalias 'gblameshow 'magit-show-commit)
(defalias 'gbranches 'magit-show-refs-popup)

(defalias 'modeshow 'describe-mode)
(defalias 'rev 'revert-buffer-quick)
(defalias 'rename-file-buffer 'crux-rename-file-and-buffer)
(defalias 'delete-file-buffer 'crux-delete-file-and-buffer)
(defalias 'remove-file-buffer 'crux-delete-file-and-buffer)
(defalias 'name-copy 'yr-file-name-to-clipboard)
(defalias 'absolute-copy 'yr-path-file-absolute-to-clipboard)
(defalias 'new-buffer 'yr-new-empty-buffer)
(defalias 'gnome-terminal 'yr-open-gnome-terminal)
(defalias 'close-other-buffers 'crux-kill-other-buffers)
(defalias 'zen-mode 'olivetti-mode)
(defalias 'markdown-preview-now 'markdown-live-preview-mode)
(defalias 'ctags-genarate 'citre-create-tags-file)
(defalias 'ctags-update 'citre-update-tags-file)
(defalias 'line-current-what 'what-line)
