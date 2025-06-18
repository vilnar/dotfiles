(if (not custom-enabled-themes)
    (progn
      ;; for default theme
      (set-face-attribute 'region nil :background "#c6dcf9")))

(load-theme 'leuven-dark)

;; (load-theme 'zenburn)
;; ;; https://emacs.stackexchange.com/a/60628
;; (custom-theme-set-faces
;;  'zenburn
;;  '(region ((t (:background "#0f0f0f"))))
;;  '(lazy-highlight ((t (:background "#385f38"))))
;;  '(highlight ((t (:background "#284f28"))))
;;  '(trailing-whitespace ((t (:background "#797979"))))
;;  '(whitespace-tab ((t (:background "#494949" :foreground "#6F6F6F"))))
;;  '(whitespace-space ((t (:background "#494949" :foreground "#6F6F6F"))))
;;  '(ediff-current-diff-A ((t (:background "#543838"))))
;;  '(ediff-current-diff-B ((t (:background "#3f4735"))))
;;  '(ediff-current-diff-C ((t (:background "#364d4d"))))
;;  '(ediff-fine-diff-A ((t (:background "#8C5353" :weight bold))))
;;  '(ediff-fine-diff-B ((t (:background "#526a52" :weight bold))))
;;  '(ediff-fine-diff-C ((t (:background "#486b6e" :weight bold))))
;;  '(doom-modeline-input-method ((t (:foreground "#EBCB8B" :weight bold)))))

;; (enable-theme 'zenburn)



(menu-bar-mode 1)
(context-menu-mode 1)

(scroll-bar-mode -1)

(set-face-attribute 'default nil :family "Jetbrains Mono NL" :height 110)
(set-face-attribute 'fixed-pitch nil :family "Jetbrains Mono NL")
(set-face-attribute 'variable-pitch nil :family "Jetbrains Mono NL")


