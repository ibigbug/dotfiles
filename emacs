(add-to-list 'load-path "~/.emacs.d")

(setq inhibit-startup-message t)
(global-font-lock-mode 't)
(setq visible-bell t)
(display-time)
(defalias 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode 0)
(column-number-mode 1)
(if (functionp 'scroll-bar-mode) (scroll-bar-mode 0))
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))
(if (functionp 'menu-bar-mode) (menu-bar-mode 0))
(setq-default indent-tabs-mode nil)
(setq-default make-backup-files nil)

(show-paren-mode t)

(require 'parenface)
(set-face-foreground 'paren-face "DimGray")
(autoload 'paredit-mode "paredit"
          "Minor mode for pseudo-structuarlly editing Lisp code."
          t)

(require 'cmuscheme)
(setq scheme-programe-name "scheme")
;;
;; bypass the interactive question and start the default interpreter
;;
(defun scheme-proc ()
  "Return the current Scheme process, starting one if necessary."
  (unless (and scheme-buffer
               (get-buffer scheme-buffer)
               (comint-check-proc scheme-buffer))
    (save-window-excursion
      (run-scheme scheme-program-name)))
  (or (scheme-get-process)
      (error "No current process. See variable `scheme-buffer`")))

(defun scheme-split-window ()
  (cond
    ((= 1 (count-windows))
     (delete-other-windows)
     (split-window-vertically (floor (* 0.618 (window-height))))
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
            (define-key scheme-mode-map (kbd "<f6>") 'scheme-send-definition-window)))
