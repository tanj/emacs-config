;; wkenyon https://github.com/emacs-lsp/lsp-mode/issues/2241#issuecomment-815116012
(defun w/disable-doc ()
  (interactive)
  (setq lsp-ui-doc-enable nil)
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (lsp-ui-doc-mode -1))))

(defun w/enable-doc ()
  (interactive)
  (setq lsp-ui-doc-enable 1)
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (lsp-ui-doc-mode 1))))

;; literal replace-regexp
(defun jt/literal-replace-regexp ()
  "Wraps replace-regexp with case-fold-search and case-replace set to nil"
  (interactive)
  (let ((case-replace nil) (case-fold-search nil))
    ;(w/disable-doc)
    (call-interactively 'replace-regexp)
    ;(w/enable-doc)
    )
  )

;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
(defun jt/unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))
