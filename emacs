(add-to-list 'load-path "~/.emacs.d")
(setq inhibit-startup-message t)
(global-font-lock-mode 't)
(global-linum-mode 1)
(setq linum-format "%d| ")
(setq visible-bell t)
(display-time)
(defalias 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode 0)
(column-number-mode 1)
(if (functionp 'scroll-bar-mode) (scroll-bar-mode 0))
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))
(if (functionp 'menu-bar-mode) (menu-bar-mode 0))
(setq-default indent-tabs-mode nil)
(setq backup-by-copying t
      backup-directory-alist
      `(("." . "~/.hide"))
      delete-old-versions t
      kept-new-versions 5
      kept-old-versions 2
      version-control t)
(setq auto-save-file-name-transforms
      `((".*" "~/.hide")))
(show-paren-mode t)
(add-to-list 'load-path "~/.emacs.d/el-get/helm")
(require 'helm-config)
(helm-mode 1)
;;
;; el-get start
;;
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrive
    "https://github.com/dimitri/el-get/raw/master/el-get-install.el" 
    (lambda (s) (end-of-buffer) (eval-print-last-sexp))))

(setq
  el-get-sources
  '(el-get))
(setq packages
      (append
        '(el-get helm python-mode auto-complete)
        (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync packages)
;;
;; el-get end
;;

(require 'parenface)
(set-face-foreground 'paren-face "DimGray")
(autoload 'paredit-mode "paredit"
          "Minor mode for pseudo-structuarlly editing Lisp code."
          t)

;;;;;;;;;;;;

;; Scheme

;;;;;;;;;;;;

(require 'cmuscheme)

(setq scheme-program-name "scheme")         ;; 如果用 Petite 就改成 "petite"

;; bypass the interactive question and start the default interpreter

(defun scheme-proc ()

  "Return the current Scheme process, starting one if necessary."

  (unless (and scheme-buffer

               (get-buffer scheme-buffer)

               (comint-check-proc scheme-buffer))

    (save-window-excursion

      (run-scheme scheme-program-name)))

  (or (scheme-get-process)

      (error "No current process. See variable `scheme-buffer'")))

(defun scheme-split-window ()

  (cond

    ((= 1 (count-windows))

     (delete-other-windows)

     (split-window-vertically (floor (* 0.68 (window-height))))

     (other-window 1)

     (switch-to-buffer "*scheme*")

     (other-window 1))

    ((not (find "*scheme*"

                (mapcar (lambda (w) (buffer-name (window-buffer w)))

                        (window-list))

                :test 'equal))

     (other-window 1)

     (switch-to-buffer "*scheme*")

     (other-window -1))))

(defun scheme-send-last-sexp-split-window ()

  (interactive)

  (scheme-split-window)

  (scheme-send-last-sexp))

(defun scheme-send-definition-split-window ()

  (interactive)

  (scheme-split-window)

  (scheme-send-definition))

(add-hook 'scheme-mode-hook
          (lambda ()
            (paredit-mode 1)

            (define-key scheme-mode-map (kbd "<f5>") 'scheme-send-last-sexp-split-window)

            (define-key scheme-mode-map (kbd "<f6>") 'scheme-send-definition-split-window)))
