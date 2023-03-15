;; Title formatting
(setq frame-title-format (list "emacs - "  '(buffer-file-name "%f" "%b")))

(tool-bar-mode 0)
(scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode -1)
(xterm-mouse-mode 1)

(menu-bar-mode -1)

;; maximize window
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; eol type
(setq eol-mnemonic-unix "LF")
(setq eol-mnemonic-dos "CRLF")
(setq eol-mnemonic-mac "CR")

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq delete-by-moving-to-trash t)

;; search
(setq isearch-lazy-count 1)
(setq lazy-highlight-cleanup nil)
(setq lazy-highlight-buffer t)

;; case sensitive for search
(setq-default case-fold-search t)

;; editor
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(column-number-mode 1)
(global-hl-line-mode 1)
;; (setq-default cursor-type 'hollow)
(setq-default cursor-type t)
(show-paren-mode 1)
(global-subword-mode 1)
(electric-indent-mode -1) ;; stop trail whitespace
(setq whitespace-line-column 120)
;; replace selected region with yank buffer
(setq-default show-trailing-whitespace t)
(delete-selection-mode 1)
(global-superword-mode 1) ;; select whole word

;; show brackets, parens in inside
(setq show-paren-when-point-inside-paren t)

;; wrap
(setq-default truncate-lines t)
(setq-default word-wrap t)

(setq-default indicate-empty-lines t)

(global-auto-revert-mode t)
;; autosave
(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))
;; (add-hook 'focus-out-hook 'save-buffer)




;; ----------------------------------------------------------------------------
;; Load packages

(defun reload-dotemacs-files ()
  "Reload dot emacs files without restarting Emacs"
  (interactive)
  (load-file "~/.emacs.d/init.el"))


(setq custom-file "~/.emacs.d/customizations.el")
(load custom-file)

(load "~/.emacs.d/default-packages.el" t)
(load "~/.emacs.d/packages.el" t)
(load "~/.emacs.d/func.el" t)
(load "~/.emacs.d/spec.el" t)
(load "~/.emacs.d/lisp/files.el" t)
(load "~/.emacs.d/lisp/json.el" t)
(load "~/.emacs.d/lisp/search.el" t)
(load "~/.emacs.d/lisp/text.el" t)
(load "~/.emacs.d/keybindings.el" t)


;; load ui for all frames
(defun yr:new-frame-setup (frame)
  (if (display-graphic-p frame)
      (progn
        ;; (message "DEBUG load ui")
        (load "~/.emacs.d/ui.el" t))))
;; Run for already-existing frames
(mapc 'yr:new-frame-setup (frame-list))
;; Run when a new frame is created
(add-hook 'after-make-frame-functions 'yr:new-frame-setup)
(put 'upcase-region 'disabled nil)
