;; If argument (a string) is provided, the region is commented out with this
;; string. If the argument is not provided, the user is asked for it.
(defun comment-ask-region (S)
  "Make the region a comment block..."
  (interactive "sComment with:")
  (save-excursion
    (if (< (mark) (point)) (exchange-point-and-mark))
    (if (= (current-column) 0) (insert S))
    (while (progn
         (forward-line)
         (< (point) (mark)))
      (insert S))))
(global-set-key "\C-c?" 'comment-ask-region)

;; Comments the current region. The string used to comment is decided by the
;; function comment-from-major-mode, and passed to comment-ask-region.
(defun flex-comment-region ()
  "Make the region a comment block. Comment prefix is decided based on the major mode"
  (interactive)
  (comment-ask-region (comment-prefix-from-mode))
  )

;; Returns comment prefix string according to current major mode.
(defun comment-prefix-from-mode ()
  (cond
   ((eq major-mode 'LaTeX-mode) "%% ")
   ((eq major-mode 'LaTeX2e-mode) "%% ")
   ((eq major-mode 'TeX-mode) "%% ")
   ((eq major-mode 'bibtex-mode) "%% ")
   ((eq major-mode 'c-mode) "* ")               ;; Only to highlight
   ((eq major-mode 'emacs-lisp-mode) ";; ")
   ((eq major-mode 'haskell-mode) "-- ")
   ((eq major-mode 'latex-mode) "%% ")
   ((eq major-mode 'mail-mode) " > ")
   ((eq major-mode 'pdbs-mode) "%% ")
   ((eq major-mode 'prolog-mode) "%% ")
   ((eq major-mode 'rmail-edit-mode) " > ")
   ((eq major-mode 'scala-mode) "//")
   ((eq major-mode 'sql-mode) "/* ")
   ((eq major-mode 'tex-mode) "%% ")
   ((eq major-mode 'text-mode) "# ")             ;; Usually scripts
   (t (error (format "Unknown comment symbol for %s mode!" mode-name) "")))
  )

(defun comment-out-region (S)
  "Make the region a comment block..."
  (interactive "sComment with:")
  (save-excursion
    (if (< (mark) (point)) (exchange-point-and-mark))
    (if (= (current-column) 0) (insert S))
    (while (progn
	     (forward-line)
	     (< (point) (mark)))
      (insert S))))

;; Key Bindings
(global-set-key "\C-c;" 'comment-out-region)
(global-set-key "\C-c;" 'flex-comment-region)
