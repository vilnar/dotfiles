;; Title formatting
(setq frame-title-format (list "emacs - "  '(buffer-file-name "%f" "%b")))
(setq icon-title-format frame-title-format)

(setq fast-but-imprecise-scrolling t)

(tool-bar-mode 0)
(scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-display-line-numbers-mode 1)
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

;; search
(setq isearch-lazy-count 1)
(setq isearch-highlight 1)
(setq highlight-nonselected-windows t)
(setq-default case-fold-search t)

;; diff
(setq
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain)

;; editor
(show-paren-mode 1)
(global-subword-mode 1)
(electric-indent-mode -1) ;; stop trail whitespace
;; replace selected region with yank buffer
(delete-selection-mode 1)
(global-superword-mode 1) ;; select whole word
(global-auto-revert-mode t)

(setq-default indicate-empty-lines t)


;; saving history
(savehist-mode 1)
(setq savehist-additional-variables
      '(search-ring
        regexp-search-ring
        kill-ring
        file-name-history
        command-history
        shell-command-history))


;; ----------------------------------------------------------------------------
;; Load packages

(defun reload-dotemacs-files ()
  "Reload dot emacs files without restarting Emacs"
  (interactive)
  (load-file "~/.emacs.d/init.el"))


(setq custom-file "~/.emacs.d/customizations.el")
(load custom-file)


(load "~/.emacs.d/packages.el" t)
(load "~/.emacs.d/editor.el" t)
(load "~/.emacs.d/lisp/files.el" t)
(load "~/.emacs.d/lisp/json.el" t)
(load "~/.emacs.d/lisp/search.el" t)
(load "~/.emacs.d/lisp/text.el" t)
(load "~/.emacs.d/keybindings.el" t)


(defun yr:new-frame-setup (frame)
  ;; (message "DEBUG: frame setup")
  (if (display-graphic-p frame)
      (progn
        ;; (message "DEBUG load ui")
        (load "~/.emacs.d/ui.el" t))))
;; Run for already-existing frames
(mapc 'yr:new-frame-setup (frame-list))
;; Run when a new frame is created
(add-hook 'after-make-frame-functions 'yr:new-frame-setup)
