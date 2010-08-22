;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-12 08:15:14 Monday by ahei>

(require 'dired-lis)

(global-dired-lis-mode)
(define-key isearch-mode-map (kbd "C-h") 'dired-lis-isearch-up-directory)

(provide 'dired-lis-settings)
