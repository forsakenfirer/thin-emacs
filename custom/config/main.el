;;;packages source setting
(package-initialize)
(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(("gnu"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
                         ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;;load as needs
(add-to-list 'load-path "~/.emacs.d/emacs/config")
(require 'default-packages)
(require 'non-packages)

(defun load-custom-packages ()
  "load extended plugins."
  (interactive)
  (require 'extend-packages)
  )

(global-set-key [f10] 'load-custom-packages)





(provide 'main)
