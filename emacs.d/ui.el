;; (load-theme 'leuven t)
;; (load-theme 'leuven-dark t)
(load-theme 'zenburn)
;; (load-theme 'tango t)
;; (load-theme 'tango-dark t)
;; (disable-theme 'tango-dark)

(if (not custom-enabled-themes)
    (progn
      ;; for default theme
      (set-face-attribute 'region nil :background "#c6dcf9")))


(setq custom--inhibit-theme-enable nil)
(custom-theme-set-faces
 'zenburn
 '(region ((t (:background "#0f0f0f"))))
 '(lazy-highlight ((t (:background "#385f38"))))
 '(highlight ((t (:background "#284f28"))))
 '(trailing-whitespace ((t (:background "#797979"))))
 '(ediff-current-diff-A ((t (:background "#543838"))))
 '(ediff-current-diff-B ((t (:background "#3f4735"))))
 '(ediff-current-diff-C ((t (:background "#364d4d"))))
 '(ediff-fine-diff-A ((t (:background "#8C5353" :weight bold))))
 '(ediff-fine-diff-B ((t (:background "#526a52" :weight bold))))
 '(ediff-fine-diff-C ((t (:background "#486b6e" :weight bold))))
)


(menu-bar-mode 1)
(context-menu-mode 1)

(scroll-bar-mode -1)

(set-face-attribute 'default nil :family "Jetbrains Mono NL" :height 135)
(set-face-attribute 'fixed-pitch nil :family "Jetbrains Mono NL")
(set-face-attribute 'variable-pitch nil :family "Jetbrains Mono NL")

;; (set-face-attribute 'default nil :family "Dejavu Sans Mono" :height 135)
;; (set-face-attribute 'fixed-pitch nil :family "Dejavu Sans Mono")
;; (set-face-attribute 'variable-pitch nil :family "Dejavu Sans Mono")

