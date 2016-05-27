;;; Code:

(add-to-list
 'load-path
 (expand-file-name "plugin/org-mode/lisp" user-emacs-directory))
(add-to-list
 'load-path
 (expand-file-name "plugin/org-mode/contrib/lisp" user-emacs-directory))

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)

(setq org-babel-results-keyword "results")
(setq org-plantuml-jar-path
      (expand-file-name "~/bin/plantuml.jar"))

(add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . puml-mode))


(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nill)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (ditaa . t)
   (sh . t)
   (python . t)
   (C . t)
   (dot . t)
   (plantuml .t)))

(provide 'init-org-mode)
