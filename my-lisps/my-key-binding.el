;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-09-10 10:49:56 Friday by ryebread>
;; Copyright (C) 2010 ryebread

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

;; 本文件包含自己习惯的一些键盘绑定调置
;; 键盘绑定原则:
;; 1.使用频率高的键定义尽可能使用emacs原始定义
;; 2.c-x:定义全局性功能调用
;; 3.c-c:定义模式相关功能调用
;; 4.s:定义使用频率低的功能调用
;; 5.键定义和特性功能设置归并在同一文件中设置(与ahei一致),无明显特性类型在本文件中设置

(eal-define-keys-commonly
 global-map
 `(("s-t t" tabbar-local-mode)
   ("s-t s" semantic-stickyfunc-mode) ;与tabbar-mode有冲突
   ("s-t w" toggle-truncate-lines)
   ("s-t m" menu-bar-mode)
   ))

(provide 'my-key-binding)
