;;; private/jackdeng/config.el -*- lexical-binding: t; -*-

(setq! doom-localleader-key ",")

(map!
  (:after python
    :localleader
    :map python-mode-map
    (:prefix ("f" . "format")
      :desc "format region or buffer" "b" #'python-yapf-region
      :desc "format file" "f" #'python-yapf-file
      :desc "format dir" "d" #'python-yapf-directory
      :desc "undo format" "u" #'python-yapf-revert-python-buffers
      )
    (:prefix ("d" . "dap")
      :desc "start dap debugger" "d" #'dap-debug
      "b" #'dap-breakpoint-toggle
      "h" #'dap-hydra
      "l" #'dap-ui-locals
      "r" #'dap-ui-repl
      "S" #'dap-ui-sessions
      "m" #'dap-ui-breakpoints
      "k" #'dap-delete-session
      "K" #'dap-delete-all-sessions
      "i" #'dap-step-in
      "o" #'dap-step-out
      "n" #'dap-next
      "c" #'dap-continue
      "C" #'dap-breakpoint-condition
      "L" #'dap-breakpoint-log-message
      )
    )
  )


(map!
 (:after org
   :localleader
   :map org-mode-map
   (:prefix ("l". "+links")
     "i" #'org-insert-src-block
     )
   )
 )


(map! :leader
      (:prefix ("z" . "custom")
        "h" #'toggle-env-http-proxy
        "y" #'youdao-dictionary-search-at-point+
        "i" #'youdao-dictionary-search-from-input)
      (:prefix-map ("b" . "buffer")
        "h" #'+doom-dashboard/open)
      (:prefix ("p" . "project")
        "S" #'+ivy/project-search
        "R" #'projectile-replace)
      (:prefix ("c" . "code")
        "R" #'query-replace)
      (:prefix ("f" . "file")
        "o" #'org-save-all-org-buffers)
      (:prefix ("n" . "notes")
       )
      (:prefix ("g" . "git")
       "c" #'counsel-git-checkout
       )
      )

(define-key! evil-insert-state-map "\C-j" 'next-line)
(define-key! evil-insert-state-map "\C-k" 'previous-line)
(define-key! evil-insert-state-map "\C-h" 'backward-char)
(define-key! evil-insert-state-map "\C-l" 'forward-char)
(define-key! evil-insert-state-map "\C-f" 'forward-word)
(define-key! evil-insert-state-map "\C-b" 'backward-word)
(define-key! evil-insert-state-map "\C-a" 'beginning-of-line)
(define-key! evil-insert-state-map "\C-e" 'end-of-line)
;; (define-key! evil-insert-state-map "\C-m" 'company-complete-common)
