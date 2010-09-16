;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-09-16 17:33:49 Thursday by ryebread>

(eal-define-keys
 `(emacs-lisp-mode-map lisp-interaction-mode-map completion-list-mode-map help-mode-map
                       debugger-mode-map)
 `(("C-h o s" describe-symbol-at-point)
   ("C-h o v" describe-variable-at-point)
   ("C-h o f" describe-function-at-point)
   ("C-h o a" describe-face-at-point)
   ("C-h j s" find-symbol-at-point)
   ("C-h j b" find-symbol-go-back)
   ("C-h j v" find-symbol-var-at-point)
   ("C-h j f" find-symbol-fun-at-point)
   ("C-h j a" find-symbol-face-at-point)
   ("C-h W"   where-is-at-point)))

(eal-define-keys-commonly
 global-map
 `(("C-h o k" Info-goto-emacs-key-command-node)
   ("C-h o m" describe-mode)
   ("C-h o a" describe-face)
   ("C-h A"   apropos)
   ("C-h a"   apropos-command)
   ("C-h j S" find-symbol)
   ("C-h j k" find-symbol-fun-on-key)
   (,(if window-system "C-x C-/" "C-x C-_") describe-symbol)))

(defun find-symbol-settings ()
  "Settings for `find-symbol'.")

(defun describe-symbol-settings ()
  "Settings for `describe-symbol'.")

(eval-after-load "find-symbol"
  `(find-symbol-settings))

(eval-after-load "describe-symbol"
  `(describe-symbol-settings))

(provide 'describe-find-symbol-settings)
