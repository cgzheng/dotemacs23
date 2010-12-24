;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-12-15 11:09:10 Wednesday by work>

(require 'multi-term)

(when use-cua
  (cua-selection-mode 1))

(define-key global-map (kbd "C-x e") 'multi-term)

(defun term-send-kill-whole-line ()
  "Kill whole line in term mode."
  (interactive)
  (term-send-raw-string "\C-a")
  ;; 没有`sleep-for'有时候就不行, 不知道为什么
  (sleep-for 0 1)
  (kill-line)
  (term-send-raw-string "\C-k"))

(defun term-send-kill-line ()
  "Kill line in term mode."
  (interactive)
  (call-interactively 'kill-line)
  (term-send-raw-string "\C-k"))

(defun term-send-yank ()
  "Yank in term mode."
  (interactive)
  (yank)
  (term-send-raw-string (current-kill 0)))

(defun term-send-copy-line ()
  "Copy left line in term mode."
  (interactive)
  (term-send-home)
  (sleep-for 0 1)
  (term-send-copy-line-left))

(defun term-send-copy-line-left ()
  "Copy current left line in term mode."
  (interactive)
  (term-send-kill-line)
  (term-send-raw-string "\C-_"))

(defun term-send-backward-kill-semi-word ()
  "Backward kill semiword in term mode."
  (interactive)
  (term-send-raw-string "\e\C-h"))

(defun term-send-undo ()
  "Undo in term mode."
  (interactive)
  (term-send-raw-string "\C-_"))

(defun term-send-esc ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\e"))

(setq multi-term-switch-after-close nil)
(setq multi-term-program "/bin/bash")
;; (setq term-term-name "linux")
;; (setq term-unbind-key-list '("C-x" "<ESC>" "<up>" "<down>" "C-j"))
;; cg_zheng: I like to use <up> and <down> as send-term-up/down, so try not unbind it
 (setq term-unbind-key-list '("C-x" "<ESC>" "C-j"))
(setq
 term-bind-key-alist
 `(("C-c"   . term-send-raw)
   ("C-p"   . term-send-raw)
   ("C-n"   . term-send-raw)
   ("C-s"   . isearch-forward)
   ("C-r"   . term-send-raw)
   ("C-m"   . term-send-raw)
   ("C-k"   . term-send-kill-line)
   ("C-x f"   . find-file-at-point)
   ("C-y"   . term-send-raw)
   (,(if window-system "C-/" "C-_") . term-send-undo)
   ;; ("C-M-h" . term-send-backward-kill-semi-word)
   ("M-DEL"   . term-send-raw-meta)
   ("M-H"   . enter-text-mode)
   ("M-J"   . switch-term-and-text)
   ("M-L"   . switch-term-and-line)
   ("M-f"   . term-send-raw-meta)
   ("M-b"   . term-send-raw-meta)
   ("M-d"   . term-send-raw-meta)
   ("M-K"   . term-send-kill-whole-line)
   ("M-p"   . previous-line)
   ("M-n"   . next-line)
   ("M-u"   . term-send-raw-meta)
   ("M-w"   . term-send-copy-line)
   ("M-W"   . term-send-copy-line-left)
   ("M-y"   . term-send-raw-meta)
   ("M-."   . term-send-raw-meta)
   ("M-/"   . term-send-raw-meta)
   ("M-0"   . term-send-raw-meta)
   ("M-1"   . term-send-raw-meta)
   ("M-2"   . term-send-raw-meta)
   ("M-3"   . term-send-raw-meta)
   ("M-4"   . term-send-raw-meta)
   ("M-5"   . term-send-raw-meta)
   ("M-6"   . term-send-raw-meta)
   ("M-7"   . term-send-raw-meta)
   ("M-8"   . term-send-raw-meta)
   ("M-9"   . term-send-raw-meta)))

(defun switch-term-and-text ()
  "if current in `term-mode', switch to `text-mode', else switch to `term-mode'."
  (interactive)
  (if (equal major-mode 'term-mode)
      (text-mode)
    (enter-term-mode)))

(defun switch-term-and-line ()
  "if current in `term-mode', switch to `term-line-mode', else switch to `term-mode'."
  (interactive)
  (if (equal major-mode 'term-mode)
      (term-line-mode)
    (enter-term-mode)))

(defun enter-term-mode ()
  "Enter in `term-mode'."
  (interactive)
  (term-mode)
  (term-char-mode))
(defun enter-text-mode ()
  "Enter in `text-mode'."
  (interactive)
  (text-mode))

(defun enter-line-mode ()
  "Enter in `line-mode'."
  (interactive)
  (term-line-mode))

(apply-define-key
 global-map
 `(("C-x n" multi-term-next)
   ("C-x p" multi-term-prev)))

(apply-define-key
 text-mode-map
 `(("M-J"   switch-term-and-text)
   ("M-L"   switch-term-and-line)))

(provide 'multi-term-settings)
