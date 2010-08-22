;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-10 22:26:29 Saturday by ahei>

(require 'rails)
(require 'two-mode-mode)
(require 'rhtml-mode)
(require 'rhtml-minor-mode)

(eal-define-keys
 `(rhtml-mode-map)
 `(("TAB" complete-or-indent-for-ruby)))

(defun rhtml-modes ()
  (two-mode-mode)
  (rhtml-minor-mode))
(setq auto-mode-alist (cons '("\\.rhtml$" . rhtml-modes) auto-mode-alist))

(define-key compilation-mode-map "u" 'View-scroll-page-backward)

(setq auto-mode-alist (cons '("\\.jsp$" . java-mode) auto-mode-alist))

(autoload 'css-mode "css-mode")
(setq auto-mode-alist (cons '("\\.css\\'" . css-mode) auto-mode-alist))

(provide 'rails-settings)
