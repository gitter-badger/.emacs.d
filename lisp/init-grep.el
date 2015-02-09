(setq-default grep-highlight-matches t
              grep-scroll-output t)

(when *is-a-mac*
  (setq-default locate-command "mdfind"))

;; I don't know what any of this does, but I'm sure it's cool.
;; (when (executable-find "ag")
;;   (require-package 'ag)
;;   (require-package 'wgrep-ag)
;;   (setq-default ag-highlight-search t)
;;   (global-set-key (kbd "M-?") 'ag-project))


(provide 'init-grep)
