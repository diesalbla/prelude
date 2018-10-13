(defun sbt-compile () (interactive) (sbt-command "compile"))
(defun sbt-test-compile () (interactive) (sbt-command "test:compile"))
(defun sbt-test () (interactive) (sbt-command "test"))

(add-hook 'sbt-mode-hook (lambda ()
  ;; compilation-skip-threshold tells the compilation minor-mode
  ;; which type of compiler output can be skipped. 1 = skip info
  ;; 2 = skip info and warnings.
  (setq compilation-skip-threshold 2)
  ;; Bind C-a to 'comint-bol when in sbt-mode. This will move the
  ;; cursor to just after prompt.
  (local-set-key (kbd "C-a") 'comint-bol)
  ;; Bind M-RET to 'comint-accumulate. This will allow you to add
  ;; more than one line to scala console prompt before sending it
  ;; for interpretation. It will keep your command history cleaner.
  (local-set-key (kbd "M-RET") 'comint-accumulate)
))


(add-hook 'scala-mode-hook ( lambda ()
 (subword-mode)
 (setq prettify-symbols-alist scala-prettify-symbols-alist)
 (setq require-final-newline nil)
))

(setq
 sbt:program-name "~/.sdkman/candidates/sbt/current/bin/sbt"
)
