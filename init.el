(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

; (eval-when-compile
;  (add-to-list 'load-path (append '("~/.emacs.d/elpa")
;                                  ;;'("elpa/use-package-20180715.1801/use-package.el")
;                                  ))
;  (require 'use-package))

 (unless (package-installed-p 'use-package)
 	(package-refresh-contents)
 (package-install 'use-package))

;;globals
(use-package better-defaults :ensure t)
(use-package projectile :ensure t)

(use-package smex :ensure t)
(use-package nov :ensure t
             :mode "\\.epub\\'")
(use-package pdf-tools :ensure t
             :magic ("%PDF" . pdf-view-mode)
             :config
             (pdf-tools-install))
(use-package magit :ensure t)
(use-package rainbow-delimiters :ensure t
             :hook (prog-mode . rainbow-delimiters-mode)
             )
(use-package multiple-cursors :ensure t)
(use-package sublimity :ensure t
             :hook (prog-mode . sublimity-mode)
             :config
             ; (use-package sublimity-map
             ;              :config
             ;              (setq sublimity-map-size 15)
             ;              (setq sublimity-map-fraction 0.2)
             ;              (setq sublimity-map-text-scale -7))
             (use-package sublimity-scroll
                          :config
                          (setq sublimity-scroll-weight 10
                            sublimity-scroll-drift-length 5))
             )
(use-package ibuffer :ensure t)
(use-package company-shell :ensure t)
(use-package zeal-at-point :ensure t)
(use-package which-key :ensure t
             :config
             (which-key-mode)
             (which-key-setup-minibuffer)
             (setq which-key-popup-type 'frame)
             (setq which-key-frame-max-width 60)
             (setq which-key-frame-max-height 20))
(use-package no-littering :ensure t)
(use-package auto-minor-mode :ensure t)
(use-package general :ensure t)
(use-package ivy :ensure t)
(use-package counsel :ensure t)
(use-package iedit :ensure t)
(use-package ido-completing-read+ :ensure t)

;;Code Completion
(use-package smartparens :ensure t
             :hook (prog-mode . smartparens-mode)
             :config (require 'smartparens-config))
(use-package paredit :ensure t
             :hook ((emacs-lisp-mode . enable-paredit-mode)
                     (eval-expression-minibuffer-setup . enable-paredit-mode)
                     (ielm-mode . enable-paredit-mode)
                     (lisp-mode . enable-paredit-mode)
                     (lisp-interaction-mode . enable-paredit-mode)
                     (scheme-mode . enable-paredit-mode)
                     (lisp-interaction-mode . enable-paredit-mode)
                     (clojure-mode . enable-paredit-mode)
                     (cider-repl-mode . enable-paredit-mode)))
(use-package eldoc :ensure t
             :hook ((emacs-lisp-mode . turn-on-eldoc-mode)
                    (lisp-interaction-mode . turn-on-eldoc-mode)
                    (ielm-mode . turn-on-eldoc-mode)
                    (cider-mode . turn-on-eldoc-mode)))
(use-package company :ensure t
             :hook (after-init . global-company-mode)
             :config (setq company-lsp-enable-snippet 1))
(use-package yasnippet :ensure t
             :config (yas-global-mode 1))
(use-package yasnippet-snippets :ensure t)
(use-package flycheck :ensure t
             :hook (prog-mode . flycheck-mode)
             )

;;LSP
(use-package lsp-mode :ensure t
             :defer t
             ;:config (setq lsp-ui-sideline-ignore-duplicate t)
             )
(use-package company-lsp :ensure t
             :defer t
             :config (push 'company-lsp company-backends))
(use-package lsp-ui :ensure t
             :hook (lsp-mode . lsp-ui-mode)
             :config (setq lsp-ui-doc 1))


(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;;customizations
(add-to-list 'load-path "~/.emacs.d/customizations")
(load "shell-integration.el")
(load "navigation.el")
(load "ui.el")
(load "editing.el")
(load "misc.el")
(load "setup-org.el")
;;language specific
;(load "elisp-editing.el")
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-java.el")
(load "setup-python.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(package-selected-packages (quote (use-package)))
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
