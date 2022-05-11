;; SubWord mode for all programming modes
(add-hook 'prog-mode-hook (lambda () (subword-mode t)))
;; Disable transient mark mode by default
(transient-mark-mode 0)

(spacemacs|use-package-add-hook lsp-ui
  :post-config
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-imenu-window-width 45)
  )
