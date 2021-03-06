;; TODO: link commits from vc-log to magit-show-commit
;; TODO: smerge-mode

(use-package magit
  :ensure t)
;;(require-package 'git-blame)
(use-package git-commit-mode
  :ensure t)
(use-package git-rebase-mode
  :ensure t)
(use-package gitignore-mode
  :ensure t)
(use-package gitconfig-mode
  :ensure t)
(use-package git-messenger
  :ensure t)
;; Though see also vc-annotate's "n" & "p" bindings
;; this package is soooo cool! you execute git-timemachine, you can then press p and n to go to the
;; previous and next verions. w copies the git hash of the current buffer, and q quits the buffer
(use-package git-timemachine
  :ensure t)
;; make git-timemachine's bindings over-ride evil normal mode's bindings
;; this code won't work, because I have evil-dvorak.el installed.
;; (eval-after-load 'git-timemachine
;;   '(progn
;;      (evil-make-overriding-map git-timemachine-mode-map 'normal)
;;      ;; force update evil keymaps after git-timemachine-mode loaded
;;      (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)))

(setq-default
 magit-save-some-buffers nil
 ;; if a command takes longer than 5 seconds, pop up the process buffer.
 magit-process-popup-time 5
 magit-diff-refine-hunk t
 magit-completing-read-function 'magit-ido-completing-read)

;; Hint: customize `magit-repo-dirs' so that you can use C-u M-F12 to
;; quickly open magit on any one of your projects.
(global-set-key [(meta f12)] 'magit-status)

(after-load 'magit
  (define-key magit-status-mode-map (kbd "C-M-<up>") 'magit-goto-parent-section))

(require-package 'fullframe)
(after-load 'magit
  (fullframe magit-status magit-mode-quit-window))

(add-hook 'git-commit-mode-hook 'goto-address-mode)
(after-load 'session
  (add-to-list 'session-mode-disable-list 'git-commit-mode))


;;; When we start working on git-backed files, use git-wip if available

(after-load 'magit
  (global-magit-wip-save-mode)
  ;; (diminish 'magit-wip-save-mode)
  )

(after-load 'magit
   (diminish 'magit-auto-revert-mode))



;; Convenient binding for vc-git-grep
(global-set-key (kbd "C-x v f") 'vc-git-grep)


(require-package 'git-messenger)
(global-set-key (kbd "C-x v p") #'git-messenger:popup-message)


(provide 'init-git)
