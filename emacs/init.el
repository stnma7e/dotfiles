(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org"
		   user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(beacon-color "#f2777a")
 '(custom-safe-themes
   '("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "dd4045f095288cdd2ff9ba043e1a6def457e51af762aee7ecdafdbba0877e7c3" default))
 '(fci-rule-color "#383838")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(python-mode evil-visualstar code-cells code-cells-mode diff-hl all-the-icons ace-window ripgrep rg undo-fu json-mode format-all go-mode copmany vertico evil-collection general doom-themes eglot zenburn-theme yasnippet-snippets yaml-mode which-key undo-tree tabbar session puppet-mode pod-mode muttrc-mode mutt-alias lsp-mode initsplit ido-completing-read+ htmlize graphviz-dot-mode gitignore-mode gitconfig-mode gitattributes-mode git-modes folding flycheck ess eproject editorconfig diminish csv-mode company color-theme-modern browse-kill-ring boxquote bm bar-cursor apache-mode vterm use-package rustic magit helm-projectile haskell-mode evil)))
 '(package-selected-packages
   (quote
    (rustic vterm which-key lsp-ui helm-lsp lsp-mode ein company projectile flycheck magit nlinum-relative railscasts-reloaded-theme helm evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
