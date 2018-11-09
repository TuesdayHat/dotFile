(use-package lsp-java :ensure t
  :hook (java-mode . lsp-java-enable)
  :config (setq lsp-java--workspace-folders
    (list "~/code/BlackJack"
    "~/code/"
    "~/Code/scrollView/")))
