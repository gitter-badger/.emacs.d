
;; This will probably come in handy.
(defun my-setup-indent (n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )

(defun my-coding-style ()
  (interactive)
  (message "My coding style!")
  (setq indent-tabs-mode t) ; use tab instead of space
  (my-setup-indent 4) ; indent 4 spaces width
  )


;;I'm not sure what this does
(setq web-mode-extra-constants '(("php" . ("CONS1" "CONS2"))))
(setq web-mode-enable-current-column-highlight t)
;; <?php expands to <?php ?>
(setq web-mode-enable-auto-pairing t)
;; Example - you may want to add hooks for your own modes.
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-mode))
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("beg" "end")))
        ("php"  . (("beg" "end")
                   ("beg" "end")))
        ))

(add-hook 'js2-mode-hook (lambda ()
                           (yas-minor-mode)
                           (yas-reload-all)
                           (skewer-mode)
                           (ggtags-mode 1)
                           ;;this conflicts with the snippets, and it's seriously annoying
                           ;;(ac-js2-mode)
                           ;;set ac sources to nil for javascript that way it doesn't interfer with yasnippet
                           (setq ac-sources
                                 '(
                                   ac-source-filename
                                   ac-source-dictionary
                                   ))
                           ))


(setq web-mode-engines-alist
      '(("php"  . "\\.php\\.")
        ("django"  . "\\.djhtml\\.")))


(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-css-property ac-source-html-bootstrap+))
        ("html" . (ac-source-words-in-buffer
                   ac-source-abbrev
                   ac-source-html-bootstrap+
                   ;;no need for yasnippet in html emmet mode is sooo much better
                   ;;ac-source-yasnippet
                   ac-source-emmet-html-aliases
                   ac-source-emmet-html-snippets
                   ac-source-html-tag
                   ac-source-html-attribute
                   ac-source-html-attribute-2
                                             ))
        ("php" . (
                  ac-source-words-in-buffer
                  ac-source-yasnippet
                  ac-source-filename
                  ))))


(add-hook 'web-mode-hook (lambda ()
                           ;;yas mode for php stuff
                           (yas-minor-mode)
                           (yas-reload-all)
                           (ggtags-mode 1)
                           ;;emmet mode for html % css related things
                           (emmet-mode)
                           (local-unset-key (kbd "C-<return>"))
                           (define-key web-mode-map (kbd "C-<return>") '(lambda ()
                                                                          (interactive)
                                                                          (newline)
                                                                          (evil-open-above 0)))
                           (push '("function" . ?𝆑) prettify-symbols-alist)
                           (push '(">=" . ?≥) prettify-symbols-alist)
                           (push '("<=" . ?≤) prettify-symbols-alist)
                           ;; I should not enable aggressive indent mode for soihub files.
                           ;; There's no need to have lots of git diffs with files.
                           ;; unset web mode's C-c C-h command, because I want to use that for 'help
                           (local-unset-key (kbd "C-c C-h"))
                           (global-set-key (kbd "C-c C-h") 'help)))



;; js2 customizations
(add-hook 'js2-mode-hook (lambda ()
                           (yas-minor-mode)
                           (yas-reload-all)
                           (skewer-mode)
                           (ggtags-mode 1)
                           ;;this conflicts with the snippets, and it's seriously annoying
                           ;;(ac-js2-mode)
                           ;;set ac sources to nil for javascript that way it doesn't interfer with yasnippet
                           (setq ac-sources
                                 '(
                                   ac-source-filename
                                   ac-source-dictionary
                                   ))
                           ))



(provide 'init-html)
