;; -*- Emacs-Lisp -*-

;; Time-stamp: <12/26/2007 22:42:34 by cg_zheng

;;; shell: restore arrows(up/down) to their orginal functions
(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map [up] 'previous-line)
            (define-key shell-mode-map [down] 'next-line)))
;; multi-shell
(when (require 'multi-shell nil t)
  (setq multi-shell-name "*shell*")
  (setq multi-shell-shell-function (quote (shell))))

(require 'multi-shell)

(define-key global-map (kbd "C-c m") 'multi-shell-new)
(define-key global-map (kbd "C-c n") 'multi-shell-next)
(define-key global-map (kbd "C-c p") 'multi-shell-prev)

(provide 'multi-shell-settings)
