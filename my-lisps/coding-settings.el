;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-11-21 04:22:45 Sunday by work>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.

;; mule-gbk
(unless is-after-emacs-23
  (require 'mule-gbk "my-mule-gbk"))

;; 设置默认编码
(defun set-default-coding-system ()
  "Set the default-coding-system"
  (when (not (and is-after-emacs-23 window-system))
    (set-language-environment "UTF-8"))
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

(defun revert-buffer-with-coding-system-no-confirm (coding-system)
  "Call `revert-buffer-with-coding-system', but when `revert-buffer' do not need confirm."
  (interactive "zCoding system for visited file (default nil): ")
  (let ((coding-system-for-read coding-system))
    (revert-buffer-no-confirm)))

(defun revert-buffer-with-gbk ()
  "Call `revert-buffer-with-coding-system-no-confirm' with gbk."
  (interactive)
  (revert-buffer-with-coding-system-no-confirm 'gbk))

(defun set-default-coding-system-again ()
  "Call `set-default-coding-system' with interactively."
  (interactive)
  (set-default-coding-system))


;; 设置默认编码为gb18030
(defun set-default-coding-system-gb18030 ()
  "Set the default-coding-system to gb18030"
  (interactive)
  (set-language-environment "Chinese-GB18030")
  (set-terminal-coding-system 'gb18030)
  (set-keyboard-coding-system 'gb18030)
  (prefer-coding-system 'gb18030)
  (setq default-buffer-file-coding-system 'gb18030))


;; 设置默认编码为utf-8
(defun set-default-coding-system-utf8 ()
  "Set the default-coding-system to gb18030"
  (interactive)
  (set-language-environment "UTF-8")
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

(if mswin
    (set-default-coding-system-gb18030)
  (set-default-coding-system))

(provide 'coding-settings)
