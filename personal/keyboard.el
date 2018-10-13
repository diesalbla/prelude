;; Configurations involving the keyboard.

;; Stop at the end of the file, not just add lines
(defalias 'yes-or-no-p 'y-or-n-p)

;; both regular delete and  keypad delete character under the cursor and to the right
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; Disable keys of arrows
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<C-down>"))
(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))

;; Dead keys for accents in Spanish Keyboard.
(define-key key-translation-map [dead-grave] (lookup-key key-translation-map "\C-x8`"))
(define-key key-translation-map [dead-acute] (lookup-key key-translation-map "\C-x8'"))
(define-key key-translation-map [dead-circumflex] (lookup-key key-translation-map "\C-x8^"))
(define-key key-translation-map [dead-diaeresis] (lookup-key key-translation-map "\C-x8\""))
(define-key key-translation-map [dead-tilde] (lookup-key key-translation-map "\C-x8~"))
(define-key isearch-mode-map [dead-grave] nil)
(define-key isearch-mode-map [dead-acute] nil)
(define-key isearch-mode-map [dead-circumflex] nil)
(define-key isearch-mode-map [dead-diaeresis] nil)
(define-key isearch-mode-map [dead-tilde] nil)

;;
;; Add Buffer Scrolling keys: 
;;
(defun scroll-one-line-up (&optional arg)
  "Scroll the selected window up (forward in the text) one line (or N lines)."
  (interactive "p")
  (scroll-up (or arg 1)))

(defun scroll-one-line-down (&optional arg)
  "Scroll the selected window down (backward in the text) one line (or N)."
  (interactive "p")
  (scroll-down (or arg 1)))

;; Use Ctrl-Z and Alt-Z for scrolling buffer up-down.
(global-set-key "\C-z" 'scroll-one-line-up)
(global-set-key "\M-z" 'scroll-one-line-down)
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;; Use Alt-P and Alt-N for scrolling buffer up-down
(global-set-key "\M-n" 'scroll-one-line-up)
(global-set-key "\M-p" 'scroll-one-line-down)

(global-unset-key "\M-m")
(global-set-key (kbd "M-m M-s") 'magit-status)
(global-set-key (kbd "M-m M-c") 'magit-checkout)

(global-unset-key (kbd "<C-DEL>"))
(global-set-key (kbd "<C-DEL>") 'backward-kill-word)
;; Use Ctrl-Tab and Ctrl-Shift-Tab to move back-and-forth
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "C-S-<iso-lefttab>") 'previous-buffer)


(global-unset-key "\M-s")
