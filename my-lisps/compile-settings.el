;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-30 16:46:26 Friday by ahei>

(require 'util)

;; 智能编译
(require 'my-smart-compile)

(defalias 'cpl 'compile)

(defvar makefile-mode-map-list nil "the list of `makefile-mode-map'")
(if is-before-emacs-21
    (setq makefile-mode-map-list '(makefile-mode-map))
  (setq makefile-mode-map-list '(makefile-gmake-mode-map makefile-automake-mode-map)))

(eal-define-keys
 (append makefile-mode-map-list
         '(c-mode-base-map svn-status-mode-map sh-mode-map
                           compilation-mode-map ruby-mode-map))
 `(("C-c C-m"  make)
   ("C-c m"    make-check)
   ("C-c M"    make-clean)
   ("C-c c"    compile-buffer)
   ("C-c r"    run-program)
   ("C-c C"    smart-compile)))

(eal-define-keys
 'java-mode-map
 `(("C-c C-m" ant)
   ("C-c M"	  ant-clean)
   ("C-c m"	  ant-test)))

(require 'compile-misc)

(eal-define-keys-commonly
 global-map
 `(("M-n" next-error)
   ("M-p" previous-error)))

(defun compile-settings ()
  "Settings for `compile'."
  ;; 设置编译命令
  (setq compile-command "make -k")

  (eal-define-keys
   makefile-mode-map-list
   `(("M-p"	  previous-error)
     ("M-n"	  next-error)
     ("C-c p" makefile-previous-dependency)
     ("C-c n" makefile-next-dependency)))

  (setq compilation-scroll-output t))

(eal-define-keys
 'compilation-mode-map
 `(("n" compilation-next-error)
   ("1" delete-other-windows)
   ("2" split-window-vertically)
   ("3" split-window-horizontally)
   ("p" compilation-previous-error)))

(eval-after-load "compile"
  '(compile-settings))

(provide 'compile-settings)
