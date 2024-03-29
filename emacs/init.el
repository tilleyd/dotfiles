(setq inhibit-startup-message t)

(scroll-bar-mode -1)  ; disable vertical scrollbar
(tool-bar-mode -1)    ; disable toolbar
(tooltip-mode -1)     ; disable tooltips
(set-fringe-mode 0)   ; side margin size

(menu-bar-mode -1)    ; disable menu bar

(setq visible-bell nil) ; disable visible bell

(setq frame-title-format "%b - Emacs")
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

(setq scroll-margin 10)
(setq scroll-step 1)

(set-face-attribute 'default nil :font "RobotoMono Nerd Font" :height 112)

(set-face-attribute 'fixed-pitch nil :font "RobotoMono Nerd Font" :height 112)

(set-face-attribute 'fixed-pitch nil :font "Roboto" :weight 'regular :height 112)

;; Display line numbers
(global-display-line-numbers-mode t)
(column-number-mode)

(dolist (mode '(org-mode-hook
		term-mode-hook
		neotree-mode-hook
		image-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Set up the modeline
;; NOTE: Run M-x all-the-icons-install-fonts when running for the first time.
(use-package all-the-icons)
(use-package doom-modeline
  :init (doom-modeline-mode 1))

;; Set up the theme
;; (use-package zerodark-theme
;;   :init (load-theme 'zerodark t))
(use-package doom-themes
  :init (load-theme 'doom-one t))

;; Set up package loading
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package if it isn't installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Set up ivy completion
(use-package ivy
  :init (ivy-mode)
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil) ;; Don't start searches with ^
  (setq counsel-find-file-ignore-regexp "\\`\\.")) ;; Hide dotfiles



(use-package ivy-rich
  :init (ivy-rich-mode 1))

;; Which-key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; Helpful
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(defun dt/find-file-init-el () (interactive)
  (find-file "~/Projects/dotfiles/emacs/emacs.org"))

(use-package general
  :config
  (general-create-definer dt/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")
  (dt/leader-keys
    "]" '(switch-to-next-buffer :which-key "next buffer")
    "[" '(switch-to-prev-buffer :which-key "prev buffer")
    "x" '(counsel-M-x :which-key "M-x")
    "/" '(swiper :which-key "swiper")
    "SPC" '(counsel-projectile :which-key "find project file"))
  (dt/leader-keys
    "t" '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")
    "ts" '(hydra-text-scale/body :which-key "scale text"))
  (dt/leader-keys
    "f" '(:ignore t :which-key "file")
    "fs" '(save-buffer :which-key "save file")
    "fS" '(write-file :which-key "save as")
    "ff" '(counsel-find-file :which-key "find file")
    "fn" '(dired-create-empty-file :which-key "new file")
    "fp" '(counsel-projectile-find-file :which-key "find project file"))
  (dt/leader-keys
    "w" '(:ignore w :which-key "window")
    "wd" '(delete-window :which-key "delete window")
    "w/" '(split-window-right :which-key "vertical split")
    "w-" '(split-window-below :which-key "horizontal split")
    "wh" '(evil-window-left :which-key "move left")
    "wj" '(evil-window-down :which-key "move down")
    "wk" '(evil-window-up :which-key "move up")
    "wl" '(evil-window-right :which-key "move right")
    "wH" '(windmove-swap-states-left :which-key "swap left")
    "wJ" '(windmove-swap-states-down :which-key "swap down")
    "wK" '(windmove-swap-states-up :which-key "swap up")
    "wL" '(windmove-swap-states-right :which-key "swap right"))
  (dt/leader-keys
    "b" '(:ignore b :which-key "buffer")
    "bs" '(save-buffer :which-key "save buffer")
    "bb" '(counsel-switch-buffer :which-key "switch buffer")
    "bd" '(kill-this-buffer :which-key "delete this buffer")
    "bD" '(kill-buffer :which-key "delete buffer")
    "bn" '(evil-buffer-new :which-key "new buffer")
    "br" '(revert-buffer :which-key "revert buffer"))
  (dt/leader-keys
    "s" '(:ignore s :which-key "search")
    "ss" '(swiper :which-key "swiper")
    "sp" '(counsel-projectile-rg :which-key "search project"))
  (dt/leader-keys
    "o" '(:ignore o :which-key "org")
    "oa" '(org-agenda-list :which-key "agenda")
    "om" '(org-agenda :which-key "agenda menu")
    "oc" '(counsel-org-capture :which-key "capture")
    "or" '(org-refile :which-key "refile")
    "os" '(org-schedule :which-key "schedule")
    "od" '(org-deadline :which-key "deadline")
    "ox" '(org-toggle-checkbox :which-key "toggle checkbox"))
  (dt/leader-keys
    "p" '(:ignore p :which-key "project")
    "pp" '(counsel-projectile-switch-project :which-key "switch project")
    "pt" '(neotree-show :which-key "show tree")
    "pT" '(neotree-hide :which-key "hide tree")
    "pf" '(counsel-projectile-find-file :which-key "find project file"))
  (dt/leader-keys
    "g" '(:ignore g :which-key "git")
    "gs" '(magit-status :which-key "status"))
  (dt/leader-keys
    "q" '(:ignore q :which-key "quit")
    "qq" '(save-buffers-kill-emacs :which-key "save and quit")
    "qQ" '(kill-emacs :which-key "quit"))
  (dt/leader-keys
    "," '(:ignore , :which-key "settings")
    ",t" '(counsel-load-theme :which-key "choose theme")
    ",s" '(hydra-text-scale/body :which-key "scale text")
    ",," '(dt/find-file-init-el :which-key "open init.el")))

(general-define-key
 "<escape>" 'keyboard-escape-quit)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)

  ;; Allow C-g to exit to normal mode
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

  ;; Set up undo
  (use-package undo-tree)
  (global-undo-tree-mode 1)
  (evil-set-undo-system 'undo-tree)

  ;; Follow wrapped lines when moving
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-decrease "out")
  ("k" text-scale-increase "in")
  ("f" nil "finished" :exit t))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (setq projectile-project-search-path '("~/Projects"
                                     "~/Work/Leonicorn/NFT Marketplace")))

;; Provide better M-o options in project lists
(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package neotree
  :config
  (setq neo-theme 'icons)
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(defun dt/org-mode-setup ()
  (org-indent-mode)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(use-package org
  :hook (org-mode . dt/org-mode-setup)
  :config
  (setq org-ellipsis "▼"
	org-hide-emphasis-markers nil
	org-startup-with-inline-images t
	org-directory "~/Documents/Notes/")

  (setq org-agenda-files '("~/Documents/Agenda/Todo/" "~/Documents/Agenda/Calendar"))

  ;; Where to possibly refile items
  (setq org-refile-targets '(("~/Documents/Agenda/Todo/Archive.org" :maxlevel . 1)
			     ("~/Documents/Agenda/Todo/Inbox.org" :maxlevel . 1)))

  ;; Save buffers after refile
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  ;; Capture templates
  (setq org-capture-templates
	'(("t" "Tasks / Projects")
	  ("tt" "Task" entry (file+olp "~/Documents/Agenda/Todo/Inbox.org" "Inbox")
	   "* TODO %?\n%U\n%a\n%i" :empty-lines 1 :kill-buffer t)
	  ("td" "Today" entry (file+olp "~/Documents/Agenda/Todo/Inbox.org" "Inbox")
	   "* TODO %?\n%U\n%a\n%i" :empty-lines 1 :kill-buffer t)))

  ;; Set up habits
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

  ;; Set up babel
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
    (python . t)))
  (setq org-confirm-babel-evaluate nil
	org-src-preserve-indentation t
	org-src-tab-acts-natively nil
	org-edit-src-content-indentation 0)

  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))

  (dolist (face '((org-level-1 . 1.2)
		  (org-level-2 . 1.1)
  		  (org-level-3 . 1.05)
  		  (org-level-4 . 1.0)
  		  (org-level-5 . 1.1)
  		  (org-level-6 . 1.1)
  		  (org-level-7 . 1.1)
  		  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "RobotoMono Nerd Font" :weight 'regular :height (cdr face))))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("➤" "➤" "➤" "➤" "➤" "➤" "➤")))


(defun dt/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . dt/org-mode-visual-fill))

(defun dt/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/Projects/dotfiles/emacs/emacs.org"))
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'dt/org-babel-tangle-config)))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (c-mode . lsp-deferred)
  (c++-mode . lsp-deferred)
  (python-mode . lsp-deferred)
  (js-mode . lsp-deferred)
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

;;(use-package lsp-ui
;;  :hook (lsp-mode . lsp-ui-mode))

;; Make completions a lot better
(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind
  (:map company-active-map
	("<tab>" . company-complete-selection))
  (:map lsp-mode-map
	("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

;; Make it look even better
(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package evil-nerd-commenter
  :bind("M-/" . evilnc-comment-or-uncomment-lines))

(setq c-default-style "java")
(add-hook 'c++-mode-hook '(lambda ()
			    (c-set-offset 'arglist-intro '+)
			    (c-set-offset 'topmost-intro-cont 0)
			    (c-set-offset 'arglist-close '-)))



(use-package solidity-mode)
