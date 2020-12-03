;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.

;; 用来找拖慢启动的代码，将配置夹在这两行中间
(setq start (current-time))

(setq! load-path luna-dumped-load-path)
(load! "+misc")
(load! "+bindings")
(global-font-lock-mode)
(transient-mark-mode)
;;修改windows版本的PATH路径。
(if (eq system-type 'windows-nt)
    (setenv "PATH"
            (concat
             "C:/Users/Jack Deng/scoop/shims" ";"
             (getenv "PATH")
             )
            )
  nil)

(setq! user-full-name "Jack Deng"
       user-mail-address "dlwxxxdlw@gmail.com"
       dash-docs-docsets-path "/mnt/d/zealdocs"
       exec-path (append '("/home/dlwxxxdlw/go/bin") exec-path)
       shrface-toggle-bullets nil
       shrface-href-versatile t
       org-roam-directory "/mnt/d/Jack Deng/Dropbox/org/"
       rainbow-fart-voice-model "JustKowalski"
       )
;; org-mode export pdf config
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
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq! doom-font (font-spec :family "DejaVu Sans Mono for Powerline" :size 15) ;; default monospace
;;        doom-variable-pitch-font (font-spec :family "sans")
;;        ) ;; default sans
(setq! doom-theme 'misterioso
      +doom-dashboard-banner-dir "~/.doom.d/banners"
      +doom-dashboard-banner-file "Amadeus.png")
(set-fontset-font t nil "Symbola" nil 'prepend)
(set-face-attribute
 'default nil
 :font (font-spec :name "Monaco"
                  :weight 'normal
                  :slant 'normal
                  :size 15))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
   (frame-parameter nil 'font)
   charset
   (font-spec :name "KaiTi"
              :weight 'normal
              :slant 'normal
              :size 11.0)))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq! org-directory "d:/Jack Deng/Dropbox/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq! display-line-numbers-type 'relative)

(setq! package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("org-cn". "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; youdao dict config
(use-package! youdao-dictionary
  :defer t
  :config
  (setq! url-automatic-caching t)
  (setq! youdao-dictionary-search-history-file "~/.emacs.d/.youdao")
  )

;; wucuo

(use-package! wucuo
  :defer t
  )
(add-hook! 'prog-mode-hook #'wucuo-start)
(add-hook! 'text-mode-hook #'wucuo-start)
(add-hook! 'after-init-hook
                (lambda ()
                  (save-excursion
                    (switch-to-buffer "*scratch*")
                    (lisp-interaction-mode))))

;; 用来找拖慢启动的代码，将配置夹在这两行中间
(message "Startup Time: %.04fs" (float-time (time-subtract (current-time) start)))

;; java
(setq! lsp-java-java-path "d:/Program Files/AdoptOpenJDK/jdk-11.0.4.11-hotspot/bin/java.exe")

;; (setenv "JAVA_HOME" "d:/Program Files/Java/jdk1.6.0_45")
;; (setq! meghanada-maven-path "d:/maven/bin/mvn.bat"
       ;; meghanada-maven-local-repository "d:/maven/repository"
       ;; meghanada-java-path "d:/Program Files/Java/jdk1.6.0_45/bin/java.exe"
       ;; )
;; (add-hook! 'java-mode-hook
;;           (lambda ()
;;             ;; meghanada-mode on
;;             (meghanada-mode t)
;;             (flycheck-mode +1)
;;             (setq c-basic-offset 2)
;;             ;; use code format
;;             (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))

;; (cond
;;    ((eq system-type 'windows-nt)
;;     (setq! meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
;;     )
;;    (t
;;     (setq! meghanada-java-path "java")
;;     (setq! meghanada-maven-path "mvn")))
