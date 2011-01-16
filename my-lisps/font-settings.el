;; -*- Emacs-Lisp -*-

;; Time-stamp: <2011-01-16 22:37:51 Sunday by ssl>

(when (and window-system is-after-emacs-23)
  (require 'my-fontset-win)
  (if mswin
      ;; (huangq-fontset-courier 17)
      (huangq-fontset-consolas 15)
    ;; (huangq-fontset-dejavu 17)))
    ;; (huangq-fontset-fixedsys 17)
    (set-default-font "Monospace 11")))

(provide 'font-settings)
