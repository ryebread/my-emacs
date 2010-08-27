;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-08-28 00:04:13 Saturday by ryebread>

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

(define-key global-map (kbd "C-x M-n") 'next-buffer)
(define-key global-map (kbd "C-x M-p") 'previous-buffer)

;; 按下C-x k立即关闭掉当前的buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; ibuffer
(if is-before-emacs-21 (require 'ibuffer-for-21))
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; 非常方便的切换buffer和打开文件
(require 'ido-settings)

;; 像linux系统下alt-tab那样选择buffer, 但是更直观, 更方便
;;(require 'select-buffer)

;; 窗口模式下用这种更美观稳定
(require 'tabbar)
(tabbar-mode t)

(set-face-attribute
 'tabbar-default nil
  :background "gray60")
 (set-face-attribute
  'tabbar-unselected nil
  :background "gray85"
  :foreground "gray30"
  :box nil)
 (set-face-attribute
  'tabbar-selected nil
  :background "#f2f2f6"
  :foreground "black"
  :box nil)
 (set-face-attribute
  'tabbar-button nil
  :box '(:line-width 1 :color "gray72" :style released-button))
 (set-face-attribute
  'tabbar-separator nil
  :height 0.7)

;; 分组方式
;; (setq tabbar-buffer-groups-function
;;     (lambda (b) (list "All Buffers")))
;; (setq tabbar-buffer-list-function
;;     (lambda ()
;;         (remove-if
;;           (lambda(buffer)
;;              (find (aref (buffer-name buffer) 0) " *"))
;;           (buffer-list))))

;; (define-key global-map [(alt j)] 'tabbar-backward)
;; (define-key global-map [(alt k)] 'tabbar-forward)


;; 删除一些临时的buffers
(defvar my-clean-buffers-names
  '("\\*Completions" "\\*Compile-Log" "\\*.*[Oo]utput\\*$"
    "\\*Apropos" "\\*compilation" "\\*Customize" "\\*Calc""\\keywiz-scores"
    "\\*BBDB\\*" "\\*trace of SMTP" "\\*vc" "\\*cvs" "\\*keywiz"
    "\\*WoMan-Log" "\\*tramp" "\\*desktop\\*" "\\*Async Shell Command"
    "\\*Backtrace\\*"
     )  "List of regexps matching names of buffers to kill.")

(defvar my-clean-buffers-modes
  '(help-mode Info-mode)
  "List of modes whose buffers will be killed.")

(defun my-clean-buffers ()
  "Kill buffers as per `my-clean-buffer-list' and `my-clean-buffer-modes'."
  (interactive)
  (let (string buffname)
    (mapc (lambda (buffer)
              (and (setq buffname (buffer-name buffer))
                   (or (catch 'found
                         (mapc '(lambda (name)
                                    (if (string-match name buffname)
                                        (throw 'found t)))
                                 my-clean-buffers-names)
                         nil)
                       (save-excursion
                         (set-buffer buffname)
                         (catch 'found
                           (mapc '(lambda (mode)
                                      (if (eq major-mode mode)
                                          (throw 'found t)))
                                   my-clean-buffers-modes)
                           nil)))
                   (kill-buffer buffname)
                   (setq string (concat string
                                        (and string ", ") buffname))))
            (buffer-list))
    (if string (message "Deleted: %s" string)
      (message "No buffers deleted"))))

(global-set-key (kbd "C-c k") 'my-clean-buffers)

(provide 'all-buffer-settings)
