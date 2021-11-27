(require 'epa-file)
(epa-file-enable)

;; windows/dos GNUPG setup
;; (if (memq system-type '(windows-nt ms-dos))
;;     (custom-set-variables
;;      '(epg-gpg-home-directory "c:/Users/jtebokkel/AppData/Roaming/gnupg")
;;      '(epg-gpg-program "c:/Program Files (x86)/GnuPG/bin/gpg.exe")
;;      '(epg-gpgconf-program "c:/Program Files (x86)/GnuPG/bin/gpgconf.exe")))

(define-minor-mode sensitive-mode
  "For sensitive files like password lists.
It disables backup creation and auto saving.

With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode."
  ;; The initial value.
  nil
  ;; The indicator for the mode line.
  " Sensitive"
  ;; The minor mode bindings.
  nil
  (if (symbol-value sensitive-mode)
      (progn
	      ;; disable backups
	      (set (make-local-variable 'backup-inhibited) t)
	      ;; disable auto-save
	      (if auto-save-default
	          (auto-save-mode -1)))
                                        ;resort to default value of backup-inhibited
    (kill-local-variable 'backup-inhibited)
                                        ;resort to default auto save setting
    (if auto-save-default
	      (auto-save-mode 1))))

(setq auto-mode-alist
      (append '(("\\.gpg\\'" . sensitive-mode))
              auto-mode-alist))

