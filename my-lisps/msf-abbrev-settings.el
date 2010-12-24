;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-10 18:40:31 Saturday by ahei>

(require 'my-msf-abbrev)

(eal-define-keys
 `(c-mode-base-map emacs-lisp-mode-map sh-mode-map ruby-mode-map
                   conf-javaprop-mode-map sgml-mode-map)
 `(("C-c R" msf-abbrev-goto-root)
   ("C-c A" msf-abbrev-define-new-abbrev-this-mode)))

(defun msf-abbrev-settings ()
  "settings for `msf-abbrev'."
  (setq msf-abbrev-root (concat my-emacs-path "mode-abbrevs"))

  (defun complete-or-indent (arg &optional is-lisp command)
    "�������ڵ��ʺ���Ͳ���,�������indent.IS-LISPΪt��ʱ������`PC-lisp-complete-symbol'"
    (interactive "P")
    (if mark-active
        (indent-region (region-beginning) (region-end))
      (if (looking-at "\\>")
          (if is-lisp (PC-lisp-complete-symbol) (hippie-expand arg))
        (if command
            (call-interactively command)
          (indent-for-tab-command)))))

  (defun cond-fld-prev ()
    "�����snippet��map��,��ִ��`fld-prev',����ʲô������"
    (interactive)
    (if (fld-exit)
        (fld-prev)))

  (if is-before-emacs-21
      (progn
        (defun fld-next-or-complete-or-indent (arg &optional is-lisp)
          "�����snippet��map��,��ִ��fld-next,����ִ��complete-or-indent"
          (interactive)
          (if (fld-exit)
              (fld-next)
            (complete-or-indent arg is-lisp)))

        (defun cond-fld-choose ()
          "�����snippet��map��,��ִ��fld-choose,����ִ��c-context-line-break"
          (interactive)
          (if (fld-exit)
              (fld-choose)
            (c-context-line-break)))

        (add-hook 'c++-mode-hook (lambda () (define-key c++-mode-map (kbd "RET") 'cond-fld-choose)) t)
        (eal-define-keys
         'c-mode-base-map
         `(("RET"   cond-fld-choose)
           ("M-RET" fld-cleanup-form-at-point))))

    (defun complete-or-indent-for-lisp ()
      "`lisp-mode'�µ�`complete-or-indent'"
      (interactive)
      (complete-or-indent nil t)))

  (eal-define-keys
   'c-mode-base-map
   `(("<backtab>" cond-fld-prev))))

(eval-after-load "my-msf-abbrev"
  `(msf-abbrev-settings))

(msf-abbrev-load)

(provide 'msf-abbrev-settings)
