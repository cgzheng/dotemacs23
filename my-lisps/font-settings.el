;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-11-22 01:03:13 Monday by work>

(when (and window-system is-after-emacs-23)
  (require 'my-fontset-win)
  (if mswin
      ;; (huangq-fontset-courier 17)
      (huangq-fontset-consolas 13)
    ;; (huangq-fontset-dejavu 17)))
    ;; (huangq-fontset-fixedsys 17)
    (set-default-font "Monospace 11")))

(provide 'font-settings)
