;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-09-24 23:34:03 Friday by taoshanwen>

;; 这句话必须放到(require 'rails)前面, 否则在`flymake-mode-map'里面
;; 定义的按键就无效
(defvar flymake-mode-map (make-sparse-keymap))

(require 'rails)
(require 'two-mode-mode)
(require 'rhtml-mode)

(eal-define-keys
 `(rhtml-mode-map)
 `(("TAB" complete-or-indent-for-ruby)))

(autoload 'rhtml-minor-mode "rhtml-minor-mode"
  "Minor mode for .rhtml files"
  t)
(defun rhtml-modes ()
  (two-mode-mode)
  (rhtml-minor-mode))
(setq auto-mode-alist (cons '("\\.rhtml$" . rhtml-modes) auto-mode-alist))

(eal-define-keys
 'compilation-mode-map
 `(("u" 'View-scroll-page-backward)))

(setq auto-mode-alist (cons '("\\.jsp$" . java-mode) auto-mode-alist))

(autoload 'css-mode "css-mode"
  "Major mode for editing CSS style sheets.
\\{cssm-mode-map}"
  t)
(setq auto-mode-alist (cons '("\\.css\\'" . css-mode) auto-mode-alist))

(provide 'rails-settings)
