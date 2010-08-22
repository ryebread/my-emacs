;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-07-13 09:01:31 Tuesday by taoshanwen>

(when (and window-system is-after-emacs-23)
  (require 'my-fontset-win)
  (if mswin
      ;; (huangq-fontset-courier 17)
      (huangq-fontset-consolas 17)
    ;; (huangq-fontset-dejavu 17)))
    (huangq-fontset-fixedsys 17)))

(provide 'font-settings)
