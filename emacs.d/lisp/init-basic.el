;; basic configs
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(global-linum-mode 1)
(setq linum-format "%2d ")

(column-number-mode 0)
(setq inhibit-startup-message 1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-font-lock-mode t)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(display-time)
(setq display-time-24hr-format t)
(setq display-day-and-date t)
(setq display-time-interval 10)

(setq frame-title-format "%f")
(setq-default make-backup-file nil)
(setq font-lock-maximum-decoration t)
(setq backup-by-copying t)


(defun set-exec-path-from-shell-PATH()
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$"
			  ""
			  (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell)  ; for eshell
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))


;; keybinding
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)


;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(auto-complete-mode t)

;; smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") '.smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-cmmand)

(provide 'init-basic)
