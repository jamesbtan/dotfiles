(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(blink-cursor-mode -1)
(setq ring-bell-function #'ignore
      inhibit-startup-screen t)
(fset 'yes-or-no-p #'y-or-n-p)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-verbose t))

(use-package which-key
  :ensure t
  :config
  (require 'which-key)
  (which-key-mode))

(use-package god-mode
  :ensure t
  :init
  (setq god-exempt-major-modes nil)
  (setq god-exempt-predicates nil)
  :config
  (require 'god-mode)
  (god-mode)
  (defun my-god-mode-update-cursor-type ()
    (setq cursor-type (if god-local-mode 'box 'bar)))
  :bind (("<escape>" . god-mode-all)
	 :map god-local-mode-map
	 ("." . repeat))
  :hook (post-command . my-god-mode-update-cursor-type))

(use-package org
  :ensure t
  :defer t
  :init
  (setq org-directory "~/Documents/org")
  (setq	org-agenda-files '("capture.org"))
  :config
  (require 'org))

(use-package org-roam
  :ensure t
  :defer t
  :after (org)
  :init
  (setq org-roam-directory org-directory)
  :config
  (org-roam-db-autosync-mode)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today)))
