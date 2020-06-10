(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (which-key lsp-ui helm-lsp lsp-mode rust-mode ein async-await company projectile flycheck magit nlinum-relative railscasts-reloaded-theme helm evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

;;
;; Global configs
;;
(setq scroll-step           1
      scroll-conservatively 10000)
(tool-bar-mode -1) ; turn off the save/open file/etc buttons at the top of emacs
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; configure whitespace settings
;; (require 'whitespace)
;; (global-whitespace-mode 1)
;; (setq whitespace-line-column 120)
;; (setq whitespace-style '(face trailing lines spaces tabs empty
;;                               space-mark tab-mark
;;                               indentation indentation::space big-indent lines-tail))
;; (setq whitespace-tab-regexp "    ")

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;
;; Package configs
;;
;; emacs-async
(async-bytecomp-package-mode 1)

(require 'evil)
(evil-mode 1)

(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)

(require 'which-key)
(which-key-mode 1)

(use-package nlinum-relative
    :config
    (nlinum-relative-setup-evil)
    (add-hook 'prog-mode-hook 'nlinum-relative-mode))

;; lsp settings
(setq lsp-keymap-prefix "C-c l")
(use-package lsp-mode
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
            (prog-mode . lsp)
            ;; if you want which-key integration
            (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)(require 'lsp-mode)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Flycheck: on-the-fly syntax checking
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; themes
(use-package railscasts-reloaded-theme
    :ensure t
    :init
    (load-theme 'railscasts-reloaded t))
