;;; Code:

(defun default-chinese-im ()
  " Set up default chinese input method"
  (if (equal current-language-environment "Chinese-GB")
      (setq default-input-method "chinese-py")))


(add-hook 'set-language-environment-hook 'default-chinese-im)


(add-hook 'text-mode-hook (lambda () (set-input-method 'chinese-py) (toggle-input-method)))

(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(provide 'init-local)
