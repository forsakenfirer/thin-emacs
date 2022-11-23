
(use-package flycheck
  :ensure t
  :defer 1
  :config
  (setq truncate-lines nil)
  :hook
  (prog-mode . flycheck-mode))

(use-package company
  :ensure t
  :defer 1
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t)
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence)))

(use-package company-box
  :ensure t
  :defer 1
  :if window-system
  :hook (company-mode . company-box-mode))

(use-package treemacs
  :ensure t
  :defer 1
  :config
  (treemacs-tag-follow-mode)
  (treemacs)
  (set-frame-width (selected-frame) 125)
  :bind
  (:map global-map
        ("C-x O"     . treemacs)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs-select-window)
        ("C-x t B"   . treemacs-bookmark)
        ;; ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  (:map treemacs-mode-map
	("/" . treemacs-advanced-helpful-hydra)))

(use-package treemacs-projectile
  :ensure t
  :defer 1
  :after (treemacs projectile))

(use-package lsp-treemacs
  :ensure t
  :defer 1
  :after (treemacs lsp))

(use-package magit
  :ensure t
  :defer 1
  :bind
  ("C-c g" . 'magit-status)
)

(provide 'extend-packages)

