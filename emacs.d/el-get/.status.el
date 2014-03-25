((auto-complete status "installed" recipe
                (:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :load "el-get.el"))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :compile nil :features helm-config))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (python-mode status "installed" recipe
              (:name python-mode :description "Major mode for editing Python programs" :type bzr :url "lp:python-mode" :load-path
                     ("." "test")
                     :compile nil :prepare
                     (progn
                       (autoload 'python-mode "python-mode" "Python editing mode." t)
                       (autoload 'doctest-mode "doctest-mode" "Doctest unittest editing mode." t)
                       (setq py-install-directory
                             (el-get-package-directory "python-mode"))
                       (add-to-list 'auto-mode-alist
                                    '("\\.py$" . python-mode))
                       (add-to-list 'interpreter-mode-alist
                                    '("python" . python-mode))))))
