;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-09-08 17:13:04 Wednesday by ryebread>

;; 方便记忆，改变ahei的键
(eal-define-keys-commonly
 global-map
 `(("s-t d e" toggle-debug-on-error)
   ("s-t d q" toggle-debug-on-quit)))

(eval-after-load "edebug"
  '(progn
     (define-key edebug-mode-map (kbd "C-c C-d") nil)))

(defun edebug-clear-global-break-condition ()
  "Clear `edebug-global-break-condition'."
  (interactive)
  (setq edebug-global-break-condition nil))

(provide 'edebug-settings)
