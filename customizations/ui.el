;;disables toolbar
(when (fboundp 'tool-bar-mode)
   (tool-bar-mode -1))
(menu-bar-mode 1)

;;line numbers
(global-display-line-numbers-mode 1)

;;disable OS scroll bar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;;horizantal scroll only current line
(setq auto-hscroll-mode (quote current-line))
;(setq truncate-lines t)

;;color themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'tomorrow-night-bright t)

;; increase font size for better readability
;;(set-face-attribute 'default nil :height 140)

;;set initial window size
(setq initial-frame-alist '((top . 0) (left . 0) (width . 100) (height . 20)))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;; No cursor blinking
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)

;;backspace deletes entire region
(setq delete-selection-mode 1)
