(with-eval-after-load 'package
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

;; Auto-install use-package. Why?
;; .. this is a defacto-standard package manager, useful to isolate each package's configuration.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; This is only needed once, near the top of the file
(eval-when-compile (require 'use-package))

;; Download automatically. Why?
;; .. convenience, so on first start all packages are installed.
(setq use-package-always-ensure t)
;; Defer loading packages by default. Why?
;; .. faster startup for packages which are only activated on certain modes or key bindings.
(setq use-package-always-defer t)

;; Add the ability to upgrade all packages. Why?
;; .. adds a quick way to upgrade everything at once.
(use-package package-utils
  :commands (package-utils-upgrade-all-and-recompile))



;; http://www.emacswiki.org/emacs/Yasnippet
(use-package yasnippet
  :init
  (yas-global-mode 1))


;; https://github.com/emacsmirror/undo-fu
;; Use a thin wrapper for undo. Why?
;; .. By default undo doesn't support redo as most users would expect from other software.
(use-package undo-fu)


(use-package magit
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
  (setq magit-list-refs-sortby "-committerdate")
  (define-key magit-hunk-section-map (kbd "RET") 'magit-diff-visit-file-other-window)
  (define-key magit-file-section-map (kbd "RET") 'magit-diff-visit-file-other-window))


(use-package winum
  :init
  (winum-mode))


(use-package fzf
   :init
   (setenv "FZF_DEFAULT_COMMAND" "fdfind --type f --hidden --exclude .git --no-ignore")
   :config
   (progn (add-to-list 'load-path "/usr/bin/fzf")))


(use-package projectile
  :commands projectile-mode
  :init
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'default)
  (projectile-mode 1))


;; Highlight terms in code-comments such as TODO, FIXME, URL's & email. Why?
;; .. these are common conventions in software that it's useful to highlight them.
(use-package hl-prog-extra
  :init (add-hook 'prog-mode-hook #'hl-prog-extra-mode))


(use-package diff-hl
  :config
  (global-diff-hl-mode +1)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package helm
  :config
  (helm-mode 1))

;; ----------------------------------------------------------------------------
;; programming languages

(use-package dockerfile-mode
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))


(use-package markdown-mode
  :config
  (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (setq markdown-command "/usr/bin/pandoc"))

(use-package php-mode
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
