(use-package org :ensure t
             :config
             (global-set-key "\C-cl" 'org-store-link)
             (global-set-key "\C-ca" 'org-agenda)
             (global-set-key "\C-cc" 'org-capture)
             (global-set-key "\C-cb" 'org-switchb))
