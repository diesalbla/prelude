(set-face-attribute 'default nil
                    :family "Hack" :height 100 :weight 'normal)

(load-theme 'deeper-blue)


(setq auto-fill-mode -1)
(setq column-number-mode t)
(setq indent-tabs-mode nil)
(setq inhibit-startup-screen t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq mark-even-if-inactive t)
(setq next-line-add-newlines nil)
(setq require-final-newline nil)
(setq scroll-bar-mode nil)
(setq size-indication-mode t)
(setq tool-bar-mode nil)
(setq truncate-lines t)
(setq visible-bell 0)
(setq prelude-whitespace nil)

(setq json-reformat:indent-width 2)


;; DIRED: No permissions/ owner info, and use subtree view.
(add-hook 'dired-mode-hook
          (lambda ()
            (dired-hide-details-mode)
            (dired-sort-toggle-or-edit)))
(define-key dired-mode-map "i" 'dired-subtree-insert)
(define-key dired-mode-map ";" 'dired-subtree-remove)


;; RecentF - See recently opened files.
(setq recentf-max-saved-items 100)
(setq recentf-max-menu-items 100)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Helm-projectile
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(add-hook 'helm-mode 'helm-autoresize-mode)

(global-prettify-symbols-mode +1)
(helm-projectile-on)
(setq projectile-indexing-method 'native)
(global-set-key (kbd "s-s") 'helm-projectile-ag)
(add-to-list 'projectile-globally-ignored-directories "target")
(add-to-list 'projectile-globally-ignored-directories "project/target")
(add-to-list 'projectile-globally-ignored-directories "project/project/target")
(add-to-list 'projectile-globally-ignored-directories ".sass-cache")
(add-to-list 'projectile-globally-ignored-directories "apiDocs")
(add-to-list 'projectile-globally-ignored-files "*.class")
