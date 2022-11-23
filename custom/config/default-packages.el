;;load default packages:
(use-package cnfonts
  :ensure t
  :config
  (cnfonts-enable)
  )

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-monokai t)
)

(use-package tabbar
  :ensure t
  :defer 0
  :init
  :config
  (require 'tabbar)
  (tabbar-mode)
  (global-set-key (kbd "C-c j") 'tabbar-backward-group)
  (global-set-key (kbd "C-c k") 'tabbar-forward-group)
  (global-set-key (kbd "C-c h") 'tabbar-backward)
  (global-set-key (kbd "C-c l") 'tabbar-forward)

  (setq
   tabbar-scroll-left-help-function nil   ;don't show help information
   tabbar-scroll-right-help-function nil
   tabbar-help-on-tab-function nil
   tabbar-home-help-function nil
   tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button
   tabbar-scroll-left-button (quote (("") ""))
   tabbar-scroll-right-button (quote (("") "")))

  (defun my-tabbar-buffer-groups ()
    "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode."
    (list
     (cond
      ((or (get-buffer-process (current-buffer))
           ;; Check if the major mode derives from `comint-mode' or
           ;; `compilation-mode'.
           (tabbar-buffer-mode-derived-p
            major-mode '(comint-mode compilation-mode)))
       "Process"
       )
      ((string-equal "*" (substring (buffer-name) 0 1))
       "Emacs Buffer"
       )
      ((eq major-mode 'dired-mode)
       "Dired"
       )
      (t
       "User Buffer"
       ))))
  (setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
  :bind
  )

(use-package counsel
  :ensure t
  :defer 1
  :init
  :config
  (counsel-mode 1)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ))

(use-package rainbow-delimiters
  :ensure t
  :defer 1
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package swiper
  :ensure t
  :defer 1
  :bind ("C-s" . swiper)
  :config (setq enable-recursive-minibuffers t)
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (use-package counsel :ensure t))

(use-package ivy
  :ensure t
  :defer 1
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

(use-package avy
  :ensure t
  :defer 1
  :bind ("C-q" . avy-goto-char-2)
  )

(use-package ace-pinyin
  :ensure t
  :defer 1
  :config
  (ace-pinyin-global-mode +1)
  )

(use-package smooth-scrolling
  :ensure t
  :init
  :config
  (smooth-scrolling-mode t)
  (setq scrool-margin 3 scroll-consrvatively 10000)
  :bind
  )

(use-package undo-tree
  :ensure t
  :init
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d./emacs/backups")))
  (global-undo-tree-mode)
  :config
  )

(use-package unicad
  :ensure t
  :init
  :config
  (require 'unicad)
  (unicad-mode t)
  :bind
  )



;;;program language support
(use-package typescript-mode
  :ensure t
  :defer 1
)
(use-package matlab-mode
  :ensure t
  :defer 1
)
(use-package python-mode
  :ensure t
  :defer 1
)
(use-package scala-mode
  :ensure t
  :defer 1
)
(use-package lua-mode
  :ensure t
  :defer 1
)
(use-package rust-mode
  :ensure t
  :defer 1
)
(use-package cmake-mode
  :ensure t
  :defer 1
)


(provide 'default-packages)
