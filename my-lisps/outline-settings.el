;; Copyright (C) 2010 ahei

;; Author: ahei <ahei0802@gmail.com>
;; URL: http://code.google.com/p/dea/source/browse/trunk/my-lisps/outline-settings.el
;; Time-stamp: <2010-11-20 02:10:36 Saturday by work>

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

(eal-define-keys
 'outline-mode-map
 `(("C-M-h"   outline-mark-subtree)
   ("C-c u"   outline-up-heading)))

(defun outline-settings ()
  "Settings for `outline'."
  (setq outline-minor-mode-prefix [(control o)])
  (local-set-key (kbd "C-o a") 'show-all)
  (local-set-key (kbd "C-o t") 'hide-body)
)

(eval-after-load "outline"
  `(outline-settings))

(provide 'outline-settings)
