;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-06 22:20:35 Tuesday by ahei>

(eal-define-keys
 'completion-list-mode-map
 `(("SPC" scroll-up)
   ("u"   scroll-down)
   ("n"   next-completion)
   ("p"   previous-completion)
   ("<"   beginning-of-buffer)
   (">"   end-of-buffer)
   ("."   set-mark-command)
   ("L"   count-brf-lines)))

(provide 'completion-list-mode-settings)
