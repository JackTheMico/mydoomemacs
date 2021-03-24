;;; private/jackdeng/config.el -*- lexical-binding: t; -*-

(defun toggle-env-http-proxy ()
  "set/unset the environment variable http_proxy which w3m uses"
  (interactive)
  (let ((proxy "http://127.0.0.1:2340"))
    (if (string= (getenv "HTTP_PROXY") proxy)
        ;; clear the proxy
        (progn
          (setenv "HTTP_PROXY" "")
          (message "env HTTP_PROXY is empty now"))
      ;; set the proxy
      (setenv "HTTP_PROXY" proxy)
      (message "env HTTP_PROXY is %s now" proxy)))
  (let ((proxys "https://127.0.0.1:2340"))
    (if (string= (getenv "HTTPS_PROXY") proxys)
        ;; clear the proxy
        (progn
          (setenv "HTTPS_PROXY" "")
          (message "env HTTPS_PROXY is empty now"))
      ;; set the proxy
      (setenv "HTTPS_PROXY" proxys)
      (message "env HTTPS_PROXY is %s now" proxys)))
  )

(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s :results output\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(defun +rime--posframe-display-content-a (args)
    "给 `rime--posframe-display-content' 传入的字符串加一个全角空
格，以解决 `posframe' 偶尔吃字的问题。"
  (cl-destructuring-bind (content) args
    (let ((newresult (if (string-blank-p content)
                           content
                         (concat content "　"))))
      (list newresult))))
