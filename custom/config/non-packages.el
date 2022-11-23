;;;custom config:

;;hide startup screen
(setq inhibit-startup-screen t)

(when (not (display-graphic-p))
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  )

;;取消滚动条
(set-scroll-bar-mode nil)

;;设置长和宽
(set-frame-width (selected-frame) 113)
(set-frame-height (selected-frame) 40)

;;高亮当前行
(when (display-graphic-p)
    (global-hl-line-mode t))

;; UTF-8 as default encoding
(prefer-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(modify-coding-system-alist 'process "*" 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq-default pathname-coding-system 'utf-8-unix)
(set-file-name-coding-system 'utf-8-unix)

;;ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
	       ("dired" (mode . dired-mode))
	       ("org" (name . "^.*org$"))
	       ("magit" (mode . magit-mode))
	       ("web" (or (mode . web-mode) (mode . js2-mode)))
	       ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
	       ("programming" (or
			       (mode . ess-mode)
			       (mode . ess-r-mode)
			       (mode . python-mode)
			       (mode . c++-mode)))
	       ("emacs" (or
			 (name . "^\\*scratch\\*$")
			 (name . "^\\*Messages\\*$")))
	       ))))
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-auto-mode 1)
	    (ibuffer-switch-to-saved-filter-groups "default")))

;;recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;c coding style
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-default-style "Linux")
(setq c-basic-offset 4)

;;c++ coding style
(defconst my-cc-style
  '("linux" ; this is inheritance from the linux style
    (c-basic-offset . 4)
    (c-offsets-alist . ((innamespace . [0])))))
(c-add-style "my-cc-style" my-cc-style)
(defun my-cc-hook()
  (c-set-style "my-cc-style")
  (setq indent-tabs-mode nil)
  (setq default-tab-width 4)
  (setq tab-width 4)
  (setq global-hl-line-mode t)
  (c-set-offset 'inline-open '0)
  )
(add-hook 'c++-mode-hook 'my-cc-hook)

;;tmp files backups
(setq backup-directory-alist (quote (("." . "~/.emacs.d/custom/backups"))))

(setq lazy-lock-defer-on-scrolling t)
(setq font-lock-maximum-decoration t)
(fset 'yes-or-no-p 'y-or-n-p)

;;关闭当前buffer
(global-set-key "\C-xk" 'kill-this-buffer)

;;行号
(global-set-key (kbd "C-c 0") 'linum-mode)
(setq linum-format "%04d")

;;自动换行
(toggle-truncate-lines t)
(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))

;;org 代码块缩进
(setq org-src-preserve-indentation t)

;;区域粘贴删除
(delete-selection-mode t)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;;括号补全
(electric-pair-mode t)

;;关闭其它窗口
(delete-other-windows)


(provide 'non-packages)
