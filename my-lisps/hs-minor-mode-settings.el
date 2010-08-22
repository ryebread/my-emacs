;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-08-09 00:22:48 Monday by taoshanwen>

(am-add-hooks
 `(c-mode-common-hook lisp-mode-hook emacs-lisp-mode-hook java-mode-hook)
 'hs-minor-mode)

(defun hs-minor-mode-settings ()
  "settings of `hs-minor-mode'."
  (defvar hs-headline-max-len 30 "*Maximum length of `hs-headline' to display.")

  (setq hs-isearch-open t)

  (defun hs-display-headline ()
    (let* ((len (length hs-headline))
           (headline hs-headline)
           (postfix ""))
      (when (>= len hs-headline-max-len)
        (setq postfix "...")
        (setq headline (substring hs-headline 0 hs-headline-max-len)))
      (if hs-headline (concat headline postfix " ") "")))

  (setq-default mode-line-format
                (append '((:eval (hs-display-headline))) mode-line-format))

  (setq hs-set-up-overlay 'hs-abstract-overlay)

  (defun hs-abstract-overlay (ov)
    (let ((str (format "[%d...]" (count-lines (overlay-start ov) (overlay-end ov)))) text)
      (if window-system
          (setq text (propertize str 'face 'yellow-forestgreen-face))
        (setq text (propertize str 'face 'white-red-face)))
      (overlay-put ov 'display text)))

  (defvar hs-hide-all nil "Current state of hideshow for toggling all.")
  (make-local-variable 'hs-hide-all)
  
  (defun hs-toggle-hiding-all ()
    "Toggle hideshow all."
    (interactive)
    (setq hs-hide-all (not hs-hide-all))
    (if hs-hide-all
        (hs-hide-all)
      (hs-show-all)))

  (defvar fold-all-fun nil "Function to fold all.")
  (make-variable-buffer-local 'fold-all-fun)
  (defvar fold-fun nil "Function to fold.")
  (make-variable-buffer-local 'fold-fun)
  
  (defun toggle-fold-all ()
    "Toggle fold all."
    (interactive)
    (if fold-all-fun
        (call-interactively fold-all-fun)
      (hs-toggle-hiding-all)))

  (defun toggle-fold ()
    "Toggle fold."
    (interactive)
    (if fold-fun
        (call-interactively fold-fun)
      (hs-toggle-hiding)))
  
  (defun hs-minor-mode-4-emaci-settings ()
    "Settings of `hs-minor-mode' for `emaci'."
    (eal-define-keys
     'emaci-mode-map
     `(("s" toggle-fold)
       ("S" toggle-fold-all))))

  (eval-after-load "emaci"
    '(hs-minor-mode-4-emaci-settings))
  
  (define-key-list
    hs-minor-mode-map
    `(("C-c h" hs-hide-block)
      ("C-c H" hs-hide-all)
      ("C-c e" hs-show-block)
      ("C-c E" hs-show-all))))

(eval-after-load "hideshow"
  '(hs-minor-mode-settings))

(provide 'hs-minor-mode-settings)
