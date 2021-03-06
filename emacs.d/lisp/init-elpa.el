;;; 
(require 'package)
(setq package-list '(
		     smex
		     green-phosphor-theme
		     flycheck
		     js2-mode
		     json-mode
		     web-mode
		     exec-path-from-shell))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;("marmalade" . "https://marmalade-repo.org/packages/")
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))


(package-initialize)

;; fetch package list
(unless package-archive-contents
  (package-refresh-contents))
;; install missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-elpa)
