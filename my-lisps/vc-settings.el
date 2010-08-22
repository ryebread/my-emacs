;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-08-04 15:14:48 Wednesday by taoshanwen>

(require 'vc+)

;;;###autoload
(defun vc-update-and-revert-buffer ()
  (interactive)
  (vc-update)
  (revert-buffer-no-confirm))

(eal-define-keys
 `(emacs-lisp-mode-map c-mode-base-map sgml-mode-map
                       sh-mode-map text-mode-map conf-javaprop-mode-map
                       c++-mode-map image-mode-map makefile-gmake-mode-map
                       org-mode-map nxml-mode-map python-mode-map)
 `(("C-c L"   vc-print-log)
   ("C-c C-u" vc-update-and-revert-buffer)
   ("C-c C-b" vc-annotate)
   ("C-c C-r" vc-rename)
   ("C-c M-D" vc-delete)
   ("C-c U"   vc-revert)
   ("C-c C-a" svn-add-current-file)
   ("C-c M-r" svn-resolved-current-file)
   ("C-c M-u" vc-update)
   ("C-c M-U" svn-update-current-dir)
   ("C-c v"   svn-status-this-dir-hide)
   ("C-c C-e" vc-ediff-with-prev-rev)
   ("C-c C-v" ,(if is-after-emacs-23 `vc-revision-other-window `vc-version-other-window))))

(eal-define-keys
 (if is-after-emacs-23 'vc-svn-log-view-mode-map 'log-view-mode-map)
 '(("u"   scroll-down)
   ("SPC" View-scroll-half-page-forward)
   ("q"   delete-current-window)
   ("."   set-mark-command)
   ("'"   switch-to-other-buffer)
   ("j"   next-line)
   ("k"   previous-line)
   ("<"   beginning-of-buffer)
   ("1"   delete-other-windows)
   ("2"   split-window-vertically)
   ("3"   split-window-horizontally)
   (">"   end-of-buffer)))

(provide 'vc-settings)
