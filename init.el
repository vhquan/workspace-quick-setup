;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"."http://orgmode.org/elpa/")
                         ("gnu"."http://elpa.gnu.org/packages/")
                         ("melpa"."https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; font settings
(custom-set-faces '(variable-pitch ((t (:family "Source Code Pro")))));; font face = font on startup screen
(add-to-list 'default-frame-alist '(font . "Source Code Pro-13:antialias=true:hinting=true"))

(add-to-list 'default-frame-alist '(height . 35))
(add-to-list 'default-frame-alist '(width . 120))

;; basic settings
(setq make-backup-file nil)
(setq auto-save-default nil)
(setq lazy-highlight-cleanup nil)
(setq-default tab-width 4)
(setq-default default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default truncate-lines -1)

;; minimal UI
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(global-linum-mode 1)
(blink-cursor-mode -1)

;; show matching parenthesis
(setq show-paren-delay 0)
(show-paren-mode 1)

;; htmlize for blogging
(use-package htmlize :ensure t)

