; add my customization
(require 'python-mode)
(add-hook 'python-mode-hook 'my-python-hook)
; this gets called by outline to deteremine the level. Just use the length of the whitespace
(defun py-outline-level ()
  (let (buffer-invisibility-spec)
    (save-excursion
      (skip-chars-forward "\t ")
      (current-column))))
; this get called after python mode is enabled
(defun my-python-hook ()
  ; outline uses this regexp to find headers. I match lines with no indent and indented "class"
  ; and "def" lines.
  ;(setq outline-regexp "^\\([ \t]*\\)\\(def\\|class\\|if\\|elif\\|else\\|while\\|for\\|try\\|except\\|with\\)")
  (setq outline-regexp "[^ \t]\\|[ \t]*\\(def\\|class\\) ")
  ; enable our level computation
  (setq outline-level 'py-outline-level)
  ; do not use their \C-c@ prefix, too hard to type. Note this overides some python mode bindings
  (setq outline-minor-mode-prefix "\C-o")
  ; turn on outline mode
  (outline-minor-mode t)
  ; initially hide all but the headers
  ;; (hide-body)
  ; I use CUA mode on the PC so I rebind these to make the more accessible
  (local-set-key [?\C-\t] 'py-shift-region-right)
  (local-set-key [?\C-\S-\t] 'py-shift-region-left)
  ; make paren matches visible
  (show-paren-mode 1)
) 
(provide 'cg-python-folding)
