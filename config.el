;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.

;; 用来找拖慢启动的代码，将配置夹在这两行中间
(setq start (current-time))

(load! "+misc")
(load! "+bindings")

(setq! user-full-name "Jack Deng"
       user-mail-address "dlwxxxdlw@gmail.com"
       dash-docs-docsets-path "/mnt/d/zealdocs"
       exec-path (append '("/home/dlwxxxdlw/go/bin") exec-path)
       shrface-toggle-bullets nil
       shrface-href-versatile t
       org-roam-directory "/mnt/d/Jack Deng/Dropbox/org/"
       )

;; pyim 输入法设置
;; (setq! pyim-default-scheme 'xiaohe-shuangpin)
;; (setq! pyim-page-tooltip 'posframe)
;; (setq! pyim-page-length 10)
;; (setq! pyim-title "pyim")
;; (setq! pyim-isearch-mode t)
;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
;; 我自己使用的中英文动态切换规则是：
;; 1. 光标只有在注释里面时，才可以输入中文。
;; 2. 光标前是汉字字符时，才能输入中文。
;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
;; (setq-default pyim-english-input-switch-functions
;;               '(pyim-probe-dynamic-english
;;                 pyim-probe-isearch-mode
;;                 pyim-probe-program-mode
;;                 pyim-probe-org-structure-template))

;; (setq-default pyim-punctuation-half-width-functions
;;               '(pyim-probe-punctuation-line-beginning
;;                                   pyim-probe-punctuation-after-punctuation))
;; (add-hook! 'pyim-active-hook (pyim-basedict-enable))
;; (add-hook! 'pyim-active-hook (bind-key "M-[" #'pyim-convert-string-at-point))

;; org-mode export pdf config
(after! ox-latex
  (add-to-list 'org-latex-classes '("ctexart" "\\documentclass[11pt]{ctexart}
                                  [NO-DEFAULT-PACKAGES]
                                  \\usepackage[utf8]{inputenc}
                                  \\usepackage[T1]{fontenc}
                                  \\usepackage{fixltx2e}
                                  \\usepackage{graphicx}
                                  \\usepackage{longtable}
                                  \\usepackage{float}
                                  \\usepackage{wrapfig}
                                  \\usepackage{rotating}
                                  \\usepackage[normalem]{ulem}
                                  \\usepackage{amsmath}
                                  \\usepackage{textcomp}
                                  \\usepackage{marvosym}
                                  \\usepackage{wasysym}
                                  \\usepackage{amssymb}
                                  \\usepackage{booktabs}
                                  \\usepackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black]{hyperref}
                                  \\tolerance=1000
                                  \\usepackage{listings}
                                  \\usepackage{xcolor}
                                  \\lstset{
                                  %行号
                                  numbers=left,
                                  %背景框
                                  framexleftmargin=10mm,
                                  frame=none,
                                  %背景色
                                  %backgroundcolor=\\color[rgb]{1,1,0.76},
                                  backgroundcolor=\\color[RGB]{245,245,244},
                                  %样式
                                  keywordstyle=\\bf\\color{blue},
                                  identifierstyle=\\bf,
                                  numberstyle=\\color[RGB]{0,192,192},
                                  commentstyle=\\it\\color[RGB]{0,96,96},
                                  stringstyle=\\rmfamily\\slshape\\color[RGB]{128,0,0},
                                  %显示空格
                                  showstringspaces=false
                                  }
                                  "
                                  ("\\section{%s}" . "\\section*{%s}")
                                  ("\\subsection{%s}" . "\\subsection*{%s}")
                                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (setq! org-latex-default-class "ctexart")
  (setq! org-latex-pdf-process
      '(
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "rm -fr %b.out %b.log %b.tex auto"))
  (setf org-latex-default-packages-alist
              (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))
  )

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; test
(setq! doom-font (font-spec :family "DejaVu Sans Mono for Powerline" :size 15) ;; default monospace
      doom-variable-pitch-font (font-spec :family "sans")) ;; default sans

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq! doom-theme 'doom-moonlight
      +doom-dashboard-banner-dir "~/.doom.d/banners"
      +doom-dashboard-banner-file "Amadeus.png")

;; If you intend to use org, it is recommended you change this!
(setq! org-directory "/mnt/d/Jack Deng/Dropbox/org"
       org-download-image-dir "/mnt/d/Jack Deng/Dropbox/org/screenshots"
       )

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq! display-line-numbers-type 'relative)

;; company
(setq! company-idle-delay 0.5
       company-minimum-prefix-length 1
       company-tooltip-idle-delay 0.8
       which-key-idle-delay 0.5
       anaconda-mode-use-posframe-show-doc t
      )
(after! pyenv-mode
  (set-company-backend! 'python-mode '(:separate company-dabbrev company-anaconda company-files)))

;; doom mode line
(setq! doom-modeline--vcs-icon t)


;; python
(setq! python-shell-interpreter "/home/dlwxxxdlw/.pyenv/shims/python"
       python-indent-offset 4
       )

(use-package! python-yapf
  :defer t)

;; deft
(setq! deft-directory "/mnt/d/Jack Deng/Dropbox/org/")

;; nyan-mode
(use-package! nyan-mode
  :defer t
  :config
  (setq! nyan-animate-nyancat t
        nyan-wavy-trail t)
  )

(add-hook! 'emacs-startup-hook
  (nyan-mode)
  (nyan-start-animation))

;; mu4e
;; (use-package! mu4e
;;   :defer t
;;   :config
;;     ;;; Set up some common mu4e variables
;;   (setq! mu4e-maildir "~/mail"
;;         mu4e-drafts-folder "/Drafts"
;;         mu4e-sent-folder   "/Sent"
;;         ;; mu4e-refile-folder "/Archive"
;;         mu4e-trash-folder "/Trash"
;;         mu4e-get-mail-command "mbsync -a"
;;         mu4e-update-interval nil
;;         mu4e-compose-signature-auto-include nil
;;         mu4e-view-show-images t
;;         mu4e-view-show-addresses t)
;;   ;;; Mail directory shortcuts
;;   (setq! mu4e-maildir-shortcuts
;;         '(("/INBOX" . ?i)
;;           ("/Sent Messages" . ?s)
;;           ("/Junk" . ?j)
;;           ("/Deleted Messages" . ?d)
;;           ))

;;   (setq! mu4e-get-mail-command "offlineimap")

;;   ;; something about ourselves
;;   (setq! user-mail-address "denglw@si-tech.com.cn"
;;         user-full-name  "邓量文"
;;         mu4e-compose-signature
;;         (concat
;;          "MIOS-邓量文\n"
;;          "Email: denglw@si-tech.com.cn\n"
;;          "祝工作生活愉快！"
;;          "\n")
;;         mu4e-compose-signature-auto-include t
;;         )
;;   (setq! mu4e-view-show-images t)

;;   ;; save attachment to my desktop (this can also be a function)
;;   (setq! mu4e-attachment-dir "/mnt/d/Jack Deng/Documents/sitech-doc")

;;   ;; sync email from imap server
;;   (setq! mu4e-get-mail-command "offlineimap"
;;         mu4e-update-interval 60)
;;   ;; notifcation
;;   (setq! mu4e-enable-notifications t)
;;   ;; send email
;;   (setq! message-send-mail-function 'smtpmail-send-it
;;          smtpmail-default-smtp-server "smtp.si-tech.com.cn"
;;          smtpmail-smtp-server "smtp.si-tech.com.cn"
;;          smtpmail-smtp-service 25
;;          smtpmail-smtp-user "denglw@si-tech.com.cn"
;;          sendmail-program "msmtp"
;;          smtpmail-debug-info t
;;          smtpmail-debug-verb t
;;          )
;;   )


;; lsp
(setq! lsp-ui-doc-mode t)


(add-hook! 'python-mode-hook #'dap-mode)
(add-hook! 'dap-mode-hook (dap-register-debug-template "Python apimonitor"
                             (list :type "python"
                                   :args "runserver 0.0.0.0:8001 --noreload"
                                   :cwd nil
                                   :target-module (expand-file-name "/mnt/d/code/python/ApiMonitor/adminew/manage.py")
                                   ;; :module "django"
                                   :program nil
                                   :request "launch"
                                   :name "Python apimonitor")))
(add-hook! 'dap-mode-hook (dap-register-debug-template "Python spectrum"
                             (list :type "python"
                                   :args "runserver 0.0.0.0:8001 --noreload"
                                   :cwd "/mnt/d/code/python/opstools/spectrum"
                                   ;; :target-module (expand-file-name "/mnt/d/code/python/opstools/spectrum/manage.py")
                                   :module nil
                                   :console "integratedTerminal"
                                   :program "/mnt/d/code/python/opstools/spectrum/manage.py"
                                   :request "launch"
                                   :name "Python spectrum"
                                   :django t)))
(add-hook! 'dap-mode-hook (dap-register-debug-template "Python apimonitor guard"
                             (list :type "python"
                                   :cwd nil
                                   :target-module (expand-file-name "/mnt/d/code/python/ApiMonitor/adminew/guard.py")
                                   ;; :module "django"
                                   :program nil
                                   :request "launch"
                                   :name "Python apimonitor guard")))
(add-hook! 'dap-mode-hook (dap-register-debug-template "Python opsobj main newproport"
                             (list :type "python"
                                   :cwd nil
                                   :args "run -m newproport"
                                   :target-module (expand-file-name "/mnt/d/code/python/opstools/opsobj/main.py")
                                   ;; :module "django"
                                   :program nil
                                   :request "launch"
                                   :name "Python opsobj main newproport")))
(add-hook! 'dap-mode-hook (dap-register-debug-template "Python opsobj main order_ex_control"
                             (list :type "python"
                                   :cwd nil
                                   :args "run -m order_ex_control"
                                   :target-module (expand-file-name "/mnt/d/code/python/opstools/opsobj/main.py")
                                   ;; :module "django"
                                   :program nil
                                   :request "launch"
                                   :name "Python opsobj main order_ex_control")))
(add-hook! 'dap-mode-hook (dap-register-debug-template "Python opsobj main payment_control"
                             (list :type "python"
                                   :cwd nil
                                   :args "run -m payment_control"
                                   :target-module (expand-file-name "/mnt/d/code/python/opstools/opsobj/main.py")
                                   ;; :module "django"
                                   :program nil
                                   :request "launch"
                                   :name "Python opsobj main payment_control")))
(add-hook! 'dap-mode-hook (dap-register-debug-template "Python opsobj main ticket_control"
                             (list :type "python"
                                   :cwd nil
                                   :args "run -m ticket_control"
                                   :target-module (expand-file-name "/mnt/d/code/python/opstools/opsobj/main.py")
                                   ;; :module "django"
                                   :program nil
                                   :request "launch"
                                   :name "Python opsobj main ticket_control")))
(add-hook 'dap-stopped-hook (lambda (arg) (call-interactively #'dap-ui-locals)))
;; (add-hook 'dap-stopped-hook (lambda (arg) (call-interactively #'dap-ui-sessions)))
(add-hook 'dap-stopped-hook (lambda (arg) (call-interactively #'dap-hydra)))


;; youdao dict config
(use-package! youdao-dictionary
  :defer t
  :config
  (setq! url-automatic-caching t)
  (setq! youdao-dictionary-search-history-file "~/.emacs.d/.youdao")
  )

;; pomodoro clock config
(setq! org-pomodoro-format "Po~%s"
       org-pomodoro-long-break-length 15
       org-pomodoro-long-break-frequency 3)

;; emacs-rime
(use-package! rime
  :custom
  (default-input-method "rime")
  )

(setq!
 rime-user-data-dir "~/.config/fcitx/rime"
 rime-show-candidate 'posframe
 rime-inline-ascii-trigger 'shift-l
 rime-disable-predicates '(
                           rime-predicate-after-alphabet-char-p
                           rime-predicate-evil-mode-p
                           rime-predicate-current-uppercase-letter-p
                           rime-predicate-punctuation-after-space-cc-p
                           rime-predicate-space-after-cc-p
                           )
 )

(if (fboundp 'rime--posframe-display-content)
    (advice-add 'rime--posframe-display-content
                :filter-args
                #'+rime--posframe-display-content-a)
  (error "Function `rime--posframe-display-content' is not available."))


;; org-roam
;; (use-package! org-roam
;;   :custom
;;   (org-roam-directory "/mnt/d/Jack Deng/Dropbox/org/")
;;   :bind (:map org-roam-mode-map
;;               (("C-c n l" . org-roam)
;;                ("C-c n f" . org-roam-find-file)
;;                ("C-c n g" . org-roam-graph-show))
;;               :map org-mode-map
;;               (("C-c n i" . org-roam-insert))
;;               (("C-c n I" . org-roam-insert-immediate)))
;;   )

;; (use-package! org-roam-server)
;; (add-hook! 'org-mode-hook
;;            (org-roam-server-mode))


(setq! org-roam-server-host "127.0.0.1"
        org-roam-server-port 9090
        org-roam-server-export-inline-images t
        org-roam-server-authenticate nil
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20)

(add-hook! 'auto-save-hook 'org-save-all-org-buffers)

(after! org-roam
  (add-to-list 'org-roam-capture-ref-templates
               '("a" "Annotation" plain (function org-roam-capture--get-point)
                 "%U ${body}\n"
                 :file-name "${slug}"
                 :head "#+title: ${title}\n#+roam_key: ${ref}\n#+roam_alias:\n"
                 :immediate-finish t
                 :unnarrowed t)
               '("r" "ref" plain (function org-roam-capture--get-point)
                 ""
                 :file-name "${slug}"
                 :head "#+title: ${title}\n#+roam_key: ${ref}\n"
                 :unnarrowed t)
               ))

;; 用来找拖慢启动的代码，将配置夹在这两行中间
(message "Startup Time: %.04fs" (float-time (time-subtract (current-time) start)))

;; here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
