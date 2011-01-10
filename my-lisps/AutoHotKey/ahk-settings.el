;; -*- Emacs-Lisp -*-

(setq ahk-syntax-directory (concat my-emacs-lisps-path "AutoHotKey/Syntax"))
(add-to-list 'auto-mode-alist '("\\.ahk$" . ahk-mode))
(autoload 'ahk-mode "ahk-mode")

(provide 'ahk-settings)
