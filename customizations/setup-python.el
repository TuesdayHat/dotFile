(use-package lsp-python :ensure t
             :hook (python-mode . lsp-python-enable))
(use-package importmagic :ensure t
             :hook (python-mode . importmagic-mode))

(setq python-shell-interpreter "python3")
