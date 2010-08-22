;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-07-17 22:28:25 Saturday by ahei>

(auto-insert-mode 1)

(defun auto-insert-settings ()
  "Settings for `auto-insert'."
  (setq auto-insert-query nil)
  (setq auto-insert-directory my-emacs-templates-path)
  (define-auto-insert "build.properties" "build.properties.tpl")

  (defun expand-template (template)
    "Expand template."
    (template-expand-template (concat my-emacs-templates-path template)))

  ;; (define-auto-insert
  ;;   '("\\.\\([Hh]\\|hh\\|hxx\\|hpp\\)$" . "C/C++ header")
  ;;   (lambda ()
  ;;     (expand-template "h.tpl")))
  ;; (define-auto-insert
  ;;   '("\\.c$" . "C")
  ;;   (lambda ()
  ;;     (expand-template "c.tpl")))
  ;; (define-auto-insert
  ;;   '("\\.cpp$" . "Cpp")
  ;;   (lambda ()
  ;;     (expand-template "cpp.tpl")))

  (defun expand-elisp-template ()
    "Expand elisp template when create a new elisp file."
    (insert-abbrev "headx"))

  (defun expand-html-template ()
    "Expand html template when create a new html file."
    (insert "headx")
    (yas/expand))

  (defun expand-headx-template ()
    "Expand headx template."
    (insert "headx")
    (yas/expand))

  (define-auto-insert "\\.el$"          'expand-elisp-template)
  (define-auto-insert "\\.sh$"          'expand-elisp-template)
  (define-auto-insert "\\.htm\\(l\\)?$" 'expand-html-template)
  (define-auto-insert "\\.org$"         'expand-headx-template)
  (define-auto-insert "\\.pl$"          'expand-headx-template)
  (define-auto-insert "\\.py$"          'expand-headx-template)

  (defun insert-abbrev (abbrev-name)
    "Insert abbrev ABBREV-NAME"
    (interactive "s")
    (insert abbrev-name)
    (expand-abbrev)))

(eval-after-load "autoinsert"
  `(auto-insert-settings))

(provide 'auto-insert-settings)
