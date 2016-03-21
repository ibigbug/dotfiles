;; golang
(defun my-go-mode-hook()
					; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
					; Run Gofmt before save.
  (add-hook 'before-save-hook 'gofmt-before-save)
					; Customize compiling command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
	   "go build -v && go test -v && go vet"))
					; Go oracle
  (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
					; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)
  
(defun auto-complete-for-go ()
  (auto-complete-mode 1))

(add-hook 'go-mode-hook 'auto-complete-for-go)
(with-eval-after-load 'go-mode
  (require 'go-autocomplete))

(provide 'init-go-mode)
