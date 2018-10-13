(defun sbt-compile () (interactive) (sbt-command "compile"))
(defun sbt-test-compile () (interactive) (sbt-command "test:compile"))
(defun sbt-test () (interactive) (sbt-command "test"))

;; Add melpa to your packages repositories
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Enable defer and ensure by default for use-package
(setq use-package-always-defer t
      use-package-always-ensure t)

;; Enable scala-mode and sbt-mode
(use-package scala-mode
             :mode "\\.s\\(cala\\|bt\\)$")

(use-package sbt-mode
             :commands sbt-start sbt-command
             :config
             ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
             ;; allows using SPACE when in the minibuffer
             (substitute-key-definition
              'minibuffer-complete-word
              'self-insert-command
              minibuffer-local-completion-map))

;; Enable nice rendering of diagnostics like compile errors.
(use-package flycheck
             :init (global-flycheck-mode))

;; (use-package lsp-mode)
;;
;; (use-package lsp-ui
;;              :hook (lsp-mode . lsp-ui-mode))
;;
;; (use-package lsp-scala
;;              :after scala-mode
;;              :demand t
;;              ;; Optional - enable lsp-scala automatically in scala files
;;              :hook (scala-mode . lsp))


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
 (prettify-symbols-mode)
 (setq prettify-symbols-alist scala-prettify-symbols-alist)
 (setq require-final-newline nil)
))

(setq
 sbt:program-name "~/.sdkman/candidates/sbt/current/bin/sbt"
)

;
;(use-package sbt-mode
;  :bind (:map scala-mode-map
;              ("C-c C-c p" . sbt-compile)
;              ("C-c C-c o" . sbt-test-compile))
;)

