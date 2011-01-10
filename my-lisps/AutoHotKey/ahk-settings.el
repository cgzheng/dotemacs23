;; -*- Emacs-Lisp -*-

;; Time-stamp: <2011-01-10 13:04:17 Monday by ssl>
(load (concat my-emacs-my-lisps-path "my-subdirs"))

(setq ahk-syntax-directory (concat my-emacs-lisps-path "AutoHotKey/Syntax"))
(add-to-list 'auto-mode-alist '("\\.ahk$" . ahk-mode))
(autoload 'ahk-mode "ahk-mode")

(provide ahk-settings)
