;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-06 23:29:58 Tuesday by ahei>

(define-key global-map (kbd "C-x M") 'woman)

(defun man-settings ()
  "settings for `man'."
  (eal-define-keys
    'Man-mode-map
    `(("Q" Man-kill)
      ("u" scroll-down)
      ("." set-mark-command)
      ("'" switch-to-other-buffer))))

(eal-define-keys
  `(c-mode-base-map sh-mode-map)
  `(("C-c /" man-current-word)))

;;;###autoload
(defun man-current-word ()
  "查看当前光标所在的词的`man'"
  (interactive)
  (manual-entry (current-word)))

(eval-after-load "man"
  '(man-settings))

(require 'woman-settings)

(provide 'man-settings)
