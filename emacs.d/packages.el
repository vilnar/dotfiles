(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; ui
(use-package zenburn-theme
  :ensure t)
(use-package leuven-theme
  :ensure t)

;; http://www.emacswiki.org/emacs/Yasnippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

;; https://github.com/emacsmirror/undo-fu
(use-package undo-fu
  :ensure t)

(use-package magit
  :ensure t
  :init
  (message "Loading Magit!")
  :config
  (message "After loaded Magit!")

  (defun magit-submodule-update-all ()
    "Update all submodules"
    :description "Update All (git submodule update --init --recursive)"
    (interactive)
    (magit-with-toplevel
     (magit-run-git-async "submodule" "update" "--init" "--recursive")))

  (setq
   magit-list-refs-sortby "-committerdate"
   ;; show whitespace for diff
   magit-diff-refine-ignore-whitespace nil
   magit-diff-paint-whitespace t
   magit-diff-paint-whitespace-lines 'all)

  (define-key magit-hunk-section-map (kbd "RET") 'magit-diff-visit-file-other-window)
  (define-key magit-file-section-map (kbd "RET") 'magit-diff-visit-file-other-window))


(use-package winum
  :ensure t
  :init
  (winum-mode))


(use-package vertico
  :ensure t
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook
  (rfn-eshadow-update-overlay . vertico-directory-tidy)
  :init
  (vertico-mode 1))

(use-package vertico-prescient
  :ensure t
  :commands (vertico-prescient-mode prescient-persist-mode)
  :init
  (vertico-prescient-mode 1)
  (prescient-persist-mode 1)
  :config
  (setq prescient-filter-method '(literal regexp literal-prefix prefix initialism)
        prescient-sort-full-matches-first t
        prescient-sort-length-enable t
        prescient-history-length 1000))

(use-package consult
  :ensure t)


(use-package fzf
  :ensure t
  :init
  (setenv "FZF_DEFAULT_COMMAND" "fdfind --type f --hidden --exclude .git --no-ignore")
  :config
  (progn (add-to-list 'load-path "/usr/bin/fzf")))


(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

(use-package projectile
  :ensure t
  :init
  (projectile-mode 1))

;; Highlight terms in code-comments such as TODO, FIXME
(use-package hl-prog-extra
  :ensure t
  :init (add-hook 'prog-mode-hook #'hl-prog-extra-mode))


;; shows lines you have modified from the last commit.
(use-package diff-hl
  :ensure t
  :demand t
  :config
  (global-diff-hl-mode))

;; go to last change, unfortunately, only local buffer
(use-package goto-chg
  :ensure t)

;; grep
(use-package rg
  :ensure t)
(with-eval-after-load 'rg
   (setq rg-ignore-ripgreprc nil)
)

(use-package multiple-cursors
  :ensure t)

;; (use-package highlight-indent-guides
;;   :ensure t
;;   :config
;;   (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;;   (setq highlight-indent-guides-method 'character))

;; linters
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t)
  :config
  (add-hook 'go-mode-hook (lambda ()
                            (setq flycheck-checker 'go-staticcheck)))
  (add-hook 'php-mode-hook (lambda ()
                             (setq flycheck-checker 'php)))
  ;; (setq flycheck-check-syntax-automatically '(mode-enabled save))
  ;; (add-hook 'after-init-hook #'global-flycheck-mode)
  ;; (setq flycheck-idle-change-delay 2.0)
)
(with-eval-after-load 'flycheck
  ;; don't hightlight info
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
)


;; ----------------------------------------------------------------------------
;; programming languages

(use-package dockerfile-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(use-package markdown-mode
  :ensure t
  :init
  (setq markdown-mouse-follow-link nil)
  :config
  (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (setq markdown-command "/usr/bin/pandoc"))

(use-package php-mode
  :ensure t
  :config
  (add-hook 'php-mode-hook
	    (lambda ()
	      (php-enable-psr2-coding-style)
	      (setq-local indent-tabs-mode nil)
	      (setq-local tab-width 4))))


(add-hook 'emacs-lisp-mode-hook
  (lambda ()
    (setq-local fill-column 120)
    (setq-local tab-width 2)
    (setq-local evil-shift-width 2)
    (setq-local indent-tabs-mode nil)

    (setq-local ffip-patterns '("*.el"))

    ;; Don't delimit on dashes or underscores. Why?
    ;; .. makes searching for variable names inconvenient.
    (modify-syntax-entry ?- "w")
    (modify-syntax-entry ?_ "w")))

(add-hook 'python-mode-hook
  (lambda ()
    (setq-local fill-column 80)
    (setq-local tab-width 4)
    (setq-local evil-shift-width 4)
    (setq-local indent-tabs-mode nil)

    (setq-local ffip-patterns '("*.py"))))

(add-hook 'sh-mode-hook
  (lambda ()
    (setq-local fill-column 120)
    (setq-local tab-width 4)
    (setq-local evil-shift-width 4)
    (setq-local indent-tabs-mode nil)

    (setq-local ffip-patterns '("*.sh"))))

(add-to-list 'auto-mode-alist '("\\.bash_aliases\\'" . sh-mode))

(add-hook 'js-mode-hook
	  (lambda ()
	    (setq-local indent-tabs-mode nil)
	    (setq-local js-indent-level 2) 
	    (setq-local tab-width 2)))

(add-hook 'conf-mode-hook
	  (lambda ()
	    (interactive)
	    (conf-quote-normal nil)))


(use-package go-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode)))


(use-package rust-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
         ("\\.erb\\'" . web-mode)
         ("\\.hbs\\'" . web-mode))
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2))

(use-package yaml-mode
  :ensure t)

