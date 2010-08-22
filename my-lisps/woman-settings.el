;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-20 16:06:16 Tuesday by ahei>

(defun woman-settings ()
  "Settings for `woman-mode'."
  (setq woman-use-own-frame nil)

  (defun woman-mode-hook-settings ()
    "Settings for `woman-mode'."
    (setq truncate-lines nil))

  (am-add-hooks 'woman-mode-hook 'woman-mode-hook-settings))

(eval-after-load "woman"
  '(woman-settings))

(provide 'woman-settings)
