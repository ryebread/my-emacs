;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-22 18:16:15 Thursday by ahei>

(defun view-mode-settings ()
  "settings for `view-mode'."
  (eal-define-keys
   'view-mode-map
   `(("U"           View-scroll-page-backward)
     ("/"           describe-symbol-at-point)
     ("\C-j"        goto-line)
     ("'"           switch-to-other-buffer)
     ("m"           back-to-indentation)
     ("p"           previous-line-or-backward-button)
     ("Q"           delete-current-window)
     ("L"           count-brf-lines)
     ("1"           delete-other-windows)
     ("t"           sb-toggle-keep-buffer)
     ("<backspace>" c-electric-backspace)
     (","           find-symbol-go-back)
     ("B"           eval-buffer)))

  (defun previous-line-or-backward-button ()
    "`major-mode'为`help-mode'时, 执行`backward-button', 否则执行`previous-line'."
    (interactive)
    (if (equal major-mode 'help-mode)
        (call-interactively 'backward-button)
      (call-interactively 'previous-line))))

(eval-after-load "view-mode"
  `(view-mode-settings))

(provide 'view-mode-settings)
