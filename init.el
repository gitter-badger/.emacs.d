;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

;; I can define some emacs testing of variables.  This will hopefully help me spot errors. cool.
;; (ert-deftest pp-test-quote ()
;;   "Tests the rendering of `quote' symbols in `pp-to-string'."
;;   (should (equal (pp-to-string '(quote quote)) "'quote"))
;;   (should (equal (pp-to-string '((quote a) (quote b))) "('a 'b)\n"))
;;   (should (equal (pp-to-string '('a 'b)) "('a 'b)\n")))


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;;(require 'init-benchmarking) ;; Measure startup time

;; I don't use it, why have it?
;;(defconst *spell-check-support-enabled* t) ;; Enable with t if you prefer
;;(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
;; initialize cedet before elpa, just in case.
;;(load-file "/home/joshua/.emacs.d/cedet/cedet-devel-load.el")
;; https://github.com/jwiegley/use-package

(require 'init-utils)
(require 'init-elpa)      ;; Machinery for installing required packages
;;(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
;;(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(eval-when-compile
  (require 'use-package))
;; diminish hides packages from being on the modeline.  You can use use-package to do this
(require 'diminish)
;; to use :bind with use-package, require bind-key
(require 'bind-key)
(require 'use-package)
(require 'init-wgrep)
(require 'init-abbrev)
(require 'init-edit-server)
;; I have some global abbreviations.  So I should turn on abbrev mode
;;(require-package 'project-local-variables)
;; this helps you minizize modeline clutter by hidding some modes on the mode line.
;; http://www.emacswiki.org/emacs/DiminishedModes

;; this will be cool to monitor my commands.
;; But I have to initialize it...It will not record commands by default.
;; I don't really use this functionality.  I never see what commands I'm using.  So I'll ignore it for now.
;;(require-package 'mwe-log-commands)
;;(mwe:log-keyboard-commands)

(require 'init-forecast)
(require 'init-gnus)
(require 'init-vc)
(require 'init-gui-frames)
(require 'init-recentf)
(require 'init-dired)
(require 'init-avy)
(require 'init-sunrise)
(require 'init-grep)
;; I don't really ever use erc in emacs.  It's kind of annoying, and it occasionally changes the buffer to
;; erc buffers randomly.  Not a fan at the moment.
;;(require 'init-erc)
(require 'init-eshell)
;;(require 'init-term)
;; this sets up paradox to use my private token to access public repos.
(require 'init-paradox)
(require 'init-bash)
;; Nicer naming of buffers for files with identical names
;; Instead of Makefile<1> and Makefile<2>, it will be
;; Makefile | tmp  Makefile | lisp
(require 'init-uniquify)
;;yasnippet needs to be loaded before auto complete to let them play nicely together
(require 'init-yasnippet)
(require 'init-cedet)
(require 'init-flycheck)
(require 'init-helm)
;; I haven't used projectile commands in a while.  I'll try turing them off and seenig what happens.
(require 'init-projectile)
;;(org-babel-load-file "init-org.org")
;;(org-babel-load-file (concat user-emacs-directory "init-org.org"))
;;https://github.com/danielmai/.emacs.d/blob/master/init.el
(require 'init-org)
(require 'init-hydra)
;; I also hardly ever use this sx package, which is an amazing package!
;; (use-package sx
;;   :defer t
;;   :ensure t) ;;searching stack exchange via emacs!  C-c S
(require 'init-editing-utils)
(require 'init-evil)
;; set up info to use the windmove commands!
(require 'init-info)

;; http://alexott.net/en/writings/emacs-vcs/EmacsDarcs.html
;;(require 'init-darcs)
(require 'init-git)
;;(require 'init-github)

(require 'init-lisp)
(require 'init-javascript)

(require 'init-html)
;;(require 'init-org2blog)
(require 'init-css)
;;(require 'init-python-mode)
(require 'init-defuns)
(require 'init-emms)

(require 'init-misc)
;;powerline has to be loaded before the zenburn theme to work properly
(require 'init-powerline-evil)

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
(put 'scroll-left 'disabled nil)
