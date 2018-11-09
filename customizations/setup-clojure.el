(use-package clojure-mode :ensure t
             :mode ("\\.edn$"
                    "\\.boot$"
                    "\\.cljs.*$"
                    ("lein-env" . enh-ruby-mode))
             :config (add-hook 'clojure-mode-hook
                (lambda ()
                  (setq inferior-lisp-program "lein repl")
                  (font-lock-add-keywords
                   nil
                   '(("(\\(facts?\\)"
                      (1 font-lock-keyword-face))
                     ("(\\(background?\\)"
                      (1 font-lock-keyword-face))))
                  (define-clojure-indent (fact 1))
                  (define-clojure-indent (facts 1))))
             )

             (use-package subword :ensure t
               :hook (clojure-mode-hook . subword-mode))
               (use-package clojure-mode-extra-font-locking :ensure t)

               (use-package cider :ensure t

                 :config
                 (setq cider-repl-pop-to-buffer-on-connect t)
                 (setq cider-repl-history-file "~/.emacs.d/cider-history")
                 (setq cider-repl-wrap-history t)
                 (setq cider-repl-display-help-banner nil)

                 (defun cider-start-http-server ()
                 (interactive)
                 (cider-load-current-buffer)
                 (let ((ns (cider-current-ns)))
                 (cider-repl-set-ns ns)
                 (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
                 (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))

                 (defun cider-refresh ()
                 (interactive)
                 (cider-interactive-eval (format "(user/reset)")))

                 (defun cider-user-ns ()
                 (interactive)
                 (cider-repl-set-ns "user"))

                 (eval-after-load 'cider
                 '(progn
                   (define-key clojure-mode-map (kbd "C-c C-v") 'cider-start-http-server)
                   (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
                   (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
                   (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))
                   )
