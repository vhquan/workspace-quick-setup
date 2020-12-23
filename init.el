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

;; orgmode configs
(setq org-export-with-sub-superscripts nil)
(setq org-link-frame-setup '((file . find-file)))
(setq org-support-shift-select t)

(defun org-sitemap-custom-entry-format (entry style project)
  (let ((filename (org-publish-find-title entry project)))
    (if (= (length filename) 0)
      (format "*%s*" entry)
      (format "%s - [[file:%s][%s]]"
              (format-time-string "%Y-%m-%d" (org-publish-find-date entry project))
              entry
              filename))))

(setq org-publish-project-alist
      '(
        ("blog"
         :base-directory "~/posts"
         :base-extension "org"
         :publishing-directory "~/vhquan.github.io/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :exclude "rss.org\\[index.org\\|.*/private/.*"
         :auto-sitemap t
         :sitemap-filename "index.org"
         :sitemap-title "QUAN'S BLOG"
         :sitemap-format-entry org-sitemap-custom-entry-format
         :html-head-extra "<link rel=\"stylesheet\" href=\"/_css/style.css\">"
         :html-link-home ".."
         :author "Quan Vu"
         :email "vuhongquanbk97@gmail.com")
        ("blog-static"
         :base-directory "~/posts"
         :recursive t
         :base-extension "jpg\\|png\\|giff\\|mp4"
         :publishing-directory "~/vhquan.github.io/"
         :publishing-function org-publish-attachment)
        ("all" :components ("blog" "blog-static"))
        ))

;; postamble info
(setq org-export-with-author t) ;; print out author name
(setq org-export-with-email t) ;; print out email of author
(setq org-export-with-date t) ;; print out date
(setq org-return-follows-link t)
(setq org-hide-emphasis-markets t)
(setq org-html-validation-link nil)

;; show matching parenthesis
(setq show-paren-delay 0)
(show-paren-mode 1)

;; htmlize for blogging
(use-package htmlize :ensure t)

