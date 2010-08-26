;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-08-26 16:29:33 Thursday by ryebread>

(add-hook 'write-file-hooks 'time-stamp)

(eval-after-load "time-stamp"
  '(progn
     (setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S %:a by %U")))

(provide 'time-stamp-settings)
