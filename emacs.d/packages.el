(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)


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
;;  (message "Loading Magit!")
  :config
;; (message "After loaded Magit!")

  (defvar magit-ediff-show-stash-with-index nil)

  (setq
   magit-list-refs-sortby "-committerdate"
   ;; magit-section-initial-visibility-alist '((hide))
   ;; show whitespace for diff
   magit-diff-refine-ignore-whitespace nil
   ;; magit-diff-paint-whitespace t
   ;; magit-diff-paint-whitespace-lines 'all
  )

  (define-key magit-hunk-section-map (kbd "RET") 'magit-diff-visit-file-other-window)
  (define-key magit-file-section-map (kbd "RET") 'magit-diff-visit-file-other-window)

  (with-eval-after-load "magit-diff"
    (define-key magit-file-section-map [C-return] 'magit-diff-visit-worktree-file)))

;; fix magit-commit
(setq git-commit-cd-to-toplevel t)
(defun git-commit-setup-updir ()
  ;; This assumes that the the working tree belonging to the current
  ;; directory, is its parent directory.
  (setq default-directory (file-name-parent-directory default-directory)))
(advice-add 'git-commit-setup :before 'git-commit-setup-updir)


(use-package winum
  :ensure t
  :init
  (winum-mode))

;; complete command
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
  (setq
   prescient-filter-method '(literal regexp literal-prefix prefix initialism)
   ;; prescient-filter-method '(literal)
   prescient-sort-full-matches-first t
   prescient-sort-length-enable t
   prescient-history-length 1000))

(use-package consult
  :ensure t
  :config
  (setq consult-line-start-from-top t))



(use-package dired-sidebar
  :ensure t
  :config
  (setq
   dired-sidebar-width 40
   dired-sidebar-theme 'ascii))

(use-package projectile
  :ensure t
  :init
  (projectile-mode 1)
  :config
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching nil)
  (setq projectile-git-command "fd . -0 --type f --color=never --strip-cwd-prefix --hidden --exclude .git --no-ignore")
  (setq projectile-git-fd-args " . -0 --type f --color=never --strip-cwd-prefix --hidden --exclude .git --no-ignore")
  (setq projectile-generic-command "fd . -0 --type f --color=never --strip-cwd-prefix --hidden --exclude .git --no-ignore")
)

;; Highlight terms in code-comments such as TODO, FIXME
(use-package hl-prog-extra
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'hl-prog-extra-mode))



;; grep
(use-package rg
  :ensure t
  :config
  (with-eval-after-load 'rg
    (setq rg-ignore-ripgreprc nil)))

(use-package multiple-cursors
  :ensure t)


(use-package wrap-region
  :ensure t
  :config
  (wrap-region-global-mode 1)
  (wrap-region-add-wrapper "`" "`" nil '(markdown-mode ruby-mode)))


(use-package google-translate
  :ensure t
  :config
  ;; (setq google-translate-default-source-language "en")
  (setq google-translate-default-source-language "auto")
  (setq google-translate-default-target-language "uk")
  (setq google-translate-translation-directions-alist
        '(("uk" . "en") ("en" . "uk"))))


(use-package expand-region
  :ensure t)


(use-package crux
  :ensure t)


(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-bar-width 1)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-major-mode-color-icon nil)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-minor-modes nil)
  (doom-modeline-enable-word-count nil)
  (doom-modeline-buffer-encoding t)
  (doom-modeline-indent-info nil)
  (doom-modeline-checker-simple-format t)
  (doom-modeline-vcs-max-length 12)
  (doom-modeline-env-version t)
  (doom-modeline-irc-stylize 'identity)
  (doom-modeline-github-timer nil)
  (doom-modeline-gnus-timer nil)
  :config
  (setq doom-modeline-icon nil)
)


(use-package emojify
  :ensure t
  :config
  (when (member "Segoe UI Emoji" (font-family-list))
    (set-fontset-font
     t 'symbol (font-spec :family "Segoe UI Emoji") nil 'prepend))
  (setq emojify-display-style 'unicode)
  (setq emojify-emoji-styles '(unicode))
  (bind-key* (kbd "C-c .") #'emojify-insert-emoji))

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
  ;; (add-hook 'markdown-mode-hook 'flyspell-mode) ;; it's slow
  ;; (add-hook 'markdown-mode-hook 'turn-on-flyspell)
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (setq markdown-command "/usr/bin/pandoc"))

(use-package php-mode
  :ensure t
  :config
  (setq php-mode-coding-style 'psr2)
  (add-hook 'php-mode-hook
            (lambda ()
              (setq-local indent-tabs-mode nil)
              (setq-local tab-width 4))))


(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq-local fill-column 120)
            (setq-local tab-width 2)
            (setq-local evil-shift-width 2)
            (setq-local indent-tabs-mode nil)
            (setq-local indent-line-function 'insert-tab)

            (setq-local ffip-patterns '("*.el"))

            ;; disable elisp--xref-backend, because sometimes emacs freeze
            (setq-local xref-backend-functions #'citre-xref-backend)

            ;; Don't delimit on dashes or underscores. Why?
            ;; .. makes searching for variable names inconvenient.
            (modify-syntax-entry ?- "w")
            (modify-syntax-entry ?_ "w")))

(add-hook 'python-mode-hook
          (lambda ()
            (setq-local fill-column 120)
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

(use-package cmake-mode
  :ensure t)

(use-package groovy-mode
  :ensure t)





;; ==========================================================
;; autocomplete new
(use-package corfu
  :ensure t
  :init
  ;; Enable auto completion and configure quitting
  (setq corfu-auto t
      corfu-auto-prefix 2
      corfu-quit-no-match 'separator) ;; or t
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))

;; Use Dabbrev with Corfu!
(use-package dabbrev
  :bind (("M-SPC" . dabbrev-completion))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Available since Emacs 29 (Use `dabbrev-ignored-buffer-regexps' on older Emacs)
  (add-to-list 'dabbrev-ignored-buffer-modes 'authinfo-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))
