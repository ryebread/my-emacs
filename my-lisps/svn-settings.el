;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-07-19 11:46:45 Monday by taoshanwen>

(require 'psvn)
(require 'svn)
(require 'svn-misc)
(require 'util)

(eal-define-keys-commonly
 global-map
 `(("C-x C-v" svn-status-hide)
   ("C-x M-u" svn-update-current-file)
   ("C-x V"   visit-svn-status)
   ("C-x M-V" svn-status-use-history)
   ("C-x M-v" svn-status-my-emacs-dir)))

(eal-define-keys
 `(emacs-lisp-mode-map c-mode-base-map text-mode-map)
 `(("C-c M-c" svn-status-commit)))

(apply-args-list-to-fun
 `(def-execute-command-on-file-command
    def-execute-command-on-current-file-command
    def-execute-command-on-current-dir-command)
  `("svn add" "svn revert" "svn rm" "svn update" "svn resolved"))

(eal-define-keys
 `(emacs-lisp-mode-map c-mode-base-map sgml-mode-map
                       sh-mode-map text-mode-map conf-javaprop-mode-map
                       c++-mode-map image-mode-map nxml-mode-map python-mode-map)
 `(("C-c l" svn-status-show-svn-log)))

(defun svn-settings ()
  "Settings for `svn'."
  (defun svn-status-toggle-hide-unmodified-unknown ()
    "隐藏/不隐藏没有修改的文件和没加入版本控制的文件"
    (interactive)
    (let ((unmodified svn-status-hide-unmodified) (unknown svn-status-hide-unknown))
      (unless (or (and unmodified unknown) (not (or unmodified unknown)))
        (setq svn-status-hide-unmodified nil)
        (setq svn-status-hide-unknown nil))
      (svn-status-toggle-hide-unmodified)
      (svn-status-toggle-hide-unknown)))

  (defun svn-status-commit-all ()
    "Commit all files."
    (interactive)
    (call-interactively 'svn-status-mark-changed)
    (call-interactively 'svn-status-commit))

  (eal-define-keys
   'svn-status-mode-map
   `(("M"       svn-status-make-directory)
     ("M-a"     svn-status-commit-all)
     ("n"       svn-status-next-line)
     ("j"       svn-status-next-line)
     ("p"       svn-status-previous-line)
     ("k"       svn-status-previous-line)
     ("<"       beginning-of-buffer)
     (">"       end-of-buffer)
     ("G"       svn-status-update-cmd)
     ("U"       svn-status-unset-all-usermarks)
     ("M"       svn-status-mark-changed)
     ("SPC"     scroll-up)
     ("E"       svn-status-toggle-edit-cmd-flag)
     ("e"       svn-status-ediff-with-revision)
     ("C-h"     svn-status-examine-parent)
     ("t"       svn-status-toggle-hide-unmodified-unknown)
     ("K"       kill-this-buffer)
     ("r"       svn-status-revert)
     ("f"       svn-status-goto-first-line)
     ("'"       switch-to-other-buffer)
     ("C-c C-j" ant)
     ("d"       svn-status-rm)
     ("C-k"     svn-delete-files)
     ("1"       delete-other-windows)
     ("J"       svn-dired-jump)
     ("C"       svn-status-cleanup)
     ("Q"       kill-this-buffer)
     ("o"       other-window)
     ("C-c M-r" svn-status-resolved)))

  (eal-define-keys
   'svn-log-view-mode-map
   `(("j"   next-line)
     ("k"   previous-line)
     ("h"   backward-char)
     ("l"   forward-char)
     ("u"   View-scroll-half-page-backward)
     ("SPC" View-scroll-page-forward)
     ("d"   svn-log-view-diff)
     ("E"   svn-log-edit-log-entry)
     ("e"   svn-log-ediff-specific-revision)
     ("o"   other-window)
     ("G"   end-of-buffer)
     (">"   end-of-buffer)
     ("<"   beginning-of-buffer)
     ("1"   delete-other-windows)
     ("'"   switch-to-other-buffer)
     ("q"   delete-current-window)))

  (defsubst svn-status-interprete-state-mode-color (stat)
    "Interpret vc-svn-state symbol to mode line color"
    (case stat
      ('up-to-date "GreenYellow")
      ('edited     "tomato")
      ('unknown    "gray")
      ('added      "blue")
      ('deleted    "magenta")
      ('unmerged   "purple")
      ('conflict   "red")
      (t           "black"))))

(eval-after-load "psvn"
  `(svn-settings))

(provide 'svn-settings)
