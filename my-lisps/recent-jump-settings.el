;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-08-27 13:19:19 Friday by ryebread>

(require 'recent-jump)
(require 'recent-jump-small)

(setq rj-mode-line-format nil)
(setq rjs-mode-line-format nil)

(recent-jump-mode)
(recent-jump-small-mode)

(let ((map global-map)
      (key-pairs
       `(("C-,"   recent-jump-backward)
         ("C-."   recent-jump-forward)
         ("C-x ," recent-jump-small-backward)
         ("C-x ." recent-jump-small-forward))))
  (apply-define-key map key-pairs))

(provide 'recent-jump-settings)
