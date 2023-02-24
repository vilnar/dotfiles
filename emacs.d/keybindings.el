(global-unset-key (kbd "M-c"))
(global-unset-key (kbd "C-."))

(global-set-key (kbd "M-g") 'goto-line)

;; (global-set-key (kbd "<f6>") 'flyspell-buffer)
(global-set-key (kbd "<f6>") 'yr:toggle-flyspell)
(global-set-key (kbd "<f7>") 'yr:new-empty-buffer)
(global-set-key (kbd "<f8>") 'toggle-truncate-lines)
(global-set-key (kbd "<f9>") 'whitespace-mode)
(global-set-key (kbd "<f10>") 'dired-sidebar-toggle-sidebar)
;; (global-set-key (kbd "<f8>") 'tab-new)
;; (global-set-key (kbd "<f9>") 'bookmark-set)
;; (global-set-key (kbd "<f10>") 'bookmark-jump)
;; (global-set-key (kbd "<f12>") 'bookmark-bmenu-list)
(global-set-key (kbd "<f12>") 'save-buffers-kill-emacs)

;; (global-set-key (kbd "M-c g") 'rgrep)
(global-set-key (kbd "M-c g") #'rg-menu)
(global-set-key (kbd "M-c p") 'projectile-command-map)
(global-set-key (kbd "M-c f") 'fzf-directory)
(global-set-key (kbd "M-c h") 'lazy-highlight-cleanup)

(global-unset-key (kbd "M-r"))
(global-set-key (kbd "M-r") 'query-replace)


(global-set-key [(control shift up)]  'yr:move-text-up)
(global-set-key [(control shift down)]	'yr:move-text-down)
(global-unset-key (kbd "C-d"))
(global-set-key (kbd "C-S-d") 'yr:duplicate-line)
(eval-after-load "php-mode"
  '(define-key php-mode-map (kbd "C-S-d") 'yr:duplicate-line))

;; (global-set-key (kbd "C-\\") 'yr:set-input-method-ukraine)
;; (global-set-key (kbd "M-\\") 'yr:set-input-method-english)
(global-set-key (kbd "M-\\") 'yr:toggle-input-method)

(global-set-key (kbd "<C-S-return>") 'yr:new-line-above)
(global-set-key (kbd "<C-return>") 'yr:new-line-below)

(global-unset-key (kbd "M-m"))
(global-set-key (kbd "M-m") 'yr:toggle-mark-word-at-point)
(global-set-key (kbd "M-c w") 'yr:mark-whole-word)
(global-set-key (kbd "C-M-l") 'yr:copy-line)

;; Window switching. (C-x o goes to the next window)
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1))) ;; back one
(define-key winum-keymap (kbd "M-1") 'winum-select-window-1)
(define-key winum-keymap (kbd "M-2") 'winum-select-window-2)
(define-key winum-keymap (kbd "M-3") 'winum-select-window-3)
(define-key winum-keymap (kbd "M-4") 'winum-select-window-4)

;; go to last change, unfortunately, only local buffer
(global-set-key (kbd "M-9") 'goto-last-change)
(global-set-key (kbd "M-0") 'goto-last-change-reverse)


(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z")   'undo-fu-only-undo)
(global-set-key (kbd "C-S-z") 'undo-fu-only-redo)


;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; autocomplete
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-/") #'company-complete)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "C-y") #'company-complete-selection)
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd "RET") nil)
  (define-key company-active-map (kbd "TAB") nil))


(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-x f") 'find-file)
(global-set-key (kbd "s-<tab>") 'switch-to-buffer)
(global-set-key (kbd "C-<tab>") #'ibuffer)
;; (global-set-key (kbd "M-c b") 'ibuffer-other-window)

;; duplicate workspace
(global-set-key [(meta down)] 'tear-off-window)

;; multiple-cursors
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)


;; alias  -------------------------------------------------------------
(defalias 'noh 'lazy-highlight-cleanup)
(defalias 'rep 'query-replace)
(defalias 'wrap-toggle 'toggle-truncate-lines)

(defalias 'gst 'magit-status)
(defalias 'gblame 'magit-blame)
(defalias 'glog 'magit-log-current)
(defalias 'gdiff 'magit-diff-range)
(defalias 'gsub 'magit-submodule-update-all)
(defalias 'gblameshow 'magit-show-commit)
(defalias 'gbranches 'magit-show-refs-popup)

(defalias 'modeshow 'describe-mode)
(defalias 'rename-file-buffer 'yr:rename-file-and-buffer)
(defalias 'rev 'revert-buffer-quick)
