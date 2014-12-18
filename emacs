(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )
( global-set-key [C-tab] 'dabbrev-expand)
( global-set-key [C-backtab] 'dabbrev-completion)
;;Chargement du module latex
(require 'tex-site)
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
        '("PDFLaTeX" "pdflatex %s" TeX-run-command nil t :help "Run PDFLaTeX") t))
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
        '("Visualize" "evince %s.pdf" TeX-run-command t t :help "Visualise PDF") t))
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
        '("Index Style" "makeindex %s -s index.ist" TeX-run-command t t :help "Make index with a style file") t))
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
        '("Glossary" "makeindex -s glossary.ist %s.glo -o %s.glx" TeX-run-command t t :help "Visualise PDF") t))
;; (add-hook 'LaTeX-mode-hook
;;    (function
;;     (lambda ()
;;       (add-to-list 'TeX-command-list
;;            (list "PDFLaTeX" "pdflatex %s.tex"
;;              'TeX-run-command nil t))
;;       (add-to-list 'TeX-command-list
;;            (list "Visualize PDF" "evince %s.pdf"
;;              'TeX-run-command nil t)))))

