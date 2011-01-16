;; -*- Emacs-Lisp -*-

;; Time-stamp: <2011-01-16 15:13:05 Sunday by ssl>

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

(eval-after-load "mouse-drag"
  '(progn
     (setq mouse-throw-with-scroll-bar nil)))

(eal-define-keys-commonly
 global-map
 `(("<S-down-mouse-1>" mouse-drag-drag)
   ("<down-mouse-1>"  mouse-drag-region-sb)
   ;; 使终端支持鼠标
   ("C-x T"            xterm-mouse-mode)))

;; added by cgzheng, from http://emacser.com/torture-emacs.htm
;; use Ctrl+ mouse whell to increase or decrease text scale
;; For Linux
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
;; For Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(provide 'mouse-settings)
