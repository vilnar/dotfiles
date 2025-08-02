(if (not custom-enabled-themes)
    (progn
      ;; for default theme
      (set-face-attribute 'region nil :background "#c6dcf9")))

;; light
;; (load-theme 'tsdh-light)
;; (load-theme 'modus-operandi)
;; dark
(load-theme 'modus-vivendi)
;; (load-theme 'tango-dark)


(menu-bar-mode 1)
(context-menu-mode 1)

(scroll-bar-mode -1)

(set-face-attribute 'default nil :family "JetBrains Mono NL" :height 110)
(set-face-attribute 'fixed-pitch nil :family "JetBrains Mono NL")
(set-face-attribute 'variable-pitch nil :family "JetBrains Mono NL")


