(package-initialize)

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)


(add-to-list 'load-path "~/.emacs.d/local-lisp/tuareg")

(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(windmove-default-keybindings)

(require 'org-install)
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(require 'org-habit)

;(add-to-list 'load-path "/opt/local/share/emacs/site-lisp/w3m/")
;(require 'w3m-e21)
;(provide 'w3m-e23)
;(require 'w3m-load)


;; ;; Added 06 Dec 2010 for g-calendar in org-mode
;; (add-to-list 'load-path "/Users/mark/Binaries/emacspeak/lisp/g-client")
;; (load-library "g")
;; (setq g-user-email "reitblatt@gmail.com")
;(gcal-emacs-calendar-setup)
;(setq g-html-handler 'w3m)
(put 'shell-resync-dirs 'disabled nil)

(autoload 'promela-mode "promela-mode" "PROMELA mode" nil t)
(setq auto-mode-alist
      (append
       (list (cons "\\.promela$"  'promela-mode)
	     (cons "\\.spin$"     'promela-mode)
	     (cons "\\.pml$"      'promela-mode)
	     ;; (cons "\\.other-extensions$"     'promela-mode)
       	     )
       auto-mode-alist))

;(setq load-path (cons  "/opt/local/lib/erlang/lib/tools-2.6.6/emacs/"
;      load-path))
;(setq erlang-root-dir "/opt/local/lib/erlang")
;(setq exec-path (cons "/opt/local/lib/erlang" exec-path))
;(require 'erlang-start)

(add-to-list 'load-path "~/.emacs.d/local-lisp")
;; (require 'org-mac-protocol)
(server-start)

;; (setq org-remember-templates
;;       '( ("AppleScript remember" ?y "* %:shortdesc\n  %:initial\n   Source: %u, %c\n\n  %?" (concat org-directory "inbox.org") "Remember")
;;          ("AppleScript note" ?z "* %?\n\n  Date: %u\n" (concat org-directory "inbox.org") "Notes")))

;; Added 09 June 2011 for commenting lines
(require 'newcomment)
(setq comment-auto-fill-only-comments 1)
;; (setq-default auto-fill-function 'do-auto-fill)

;; Added 24 Aug 2011 for Datalog
(load "~/.emacs.d/des.el")
(add-to-list 'auto-mode-alist '("\\.logic$" . des-mode))

;; Added 02 Sept 2012 for Haskell
;;(load "~/.emacs.d/local-lisp/haskell-mode/haskell-site-file")
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Added 10 June 2013 for Markdown
(load "~/.emacs.d/local-lisp/markdown-mode.el")
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex")
 '(TeX-PDF-mode t)
 '(TeX-engine (quote xetex))
 '(TeX-view-program-list (quote (("preview" "open %o"))))
 '(TeX-view-program-selection
   (quote
    (((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "preview")
     (output-html "xdg-open"))))
 '(coq-load-path (quote (".")))
 '(inhibit-startup-screen t)
 '(ns-command-modifier (quote meta)))

;; Added 15 June 2013 for NetCore
;; (load "~/Projects/Cornell/frenetic/frenetic/tools/netcore-mode.el")
;; (add-to-list 'auto-mode-alist '("\\.nc$" . netcore-mode))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(cond 
 ((eq window-system 'ns) ; macosx
  ;; Invoke login shells, so that .profile or .bash_profile is read
  (setq shell-command-switch "-lic")))


;; (defvar acl2-skip-shell nil)

;; ; Start up a shell.  This also loads in comint-mode, used below.
;; (if (not acl2-skip-shell)
;;     (shell)
;; ; Otherwise load the shell package in case it's used somewhere.
;;   (load "shell"))

;; ; Do meta-x new-shell to start a new shell.
;; (defvar number-of-other-shells 0)
;; (defun new-shell ()
;;   "Start up another shell."
;;   (interactive)
;;   (switch-to-buffer
;;    (make-comint (concat "shell-" 
;; 			(number-to-string
;; 			 (setq number-of-other-shells
;; 			       (+ 1 number-of-other-shells))))
;; 		(or (getenv "SHELL")
;; 		    "csh")))
;;   (shell-mode))

;; ; Avoid killing shell buffers by accident:
;; (defun kill-buffer-without-process (name)
;;   "Kill a buffer unless there's a process associated with it."
;;   (interactive
;;    (let (val
;;          (default-name (buffer-name (current-buffer)))
;;          (table
;;           (mapcar (function (lambda (x) (cons (buffer-name x) x))) (buffer-list))))
;;      (setq val (completing-read (format "Kill buffer: (default: %s) "
;;                                         default-name)
;;                                 table
;;                                 nil
;;                                 t))
;;      (list (if (equal val "")
;;                default-name val))))
;;   (if (get-buffer-process name)
;;       (error "Process is active in the indicated buffer.  Use meta-x kill-buffer instead.")
;;     (kill-buffer name)))

;; (define-key (current-global-map) "\C-Xk" 'kill-buffer-without-process)


(load "~/acl2/current-version/acl2-sources/emacs/emacs-acl2.el")
;; (setq twelf-root "/Applications/Twelf/")
;; (load (concat twelf-root "emacs/twelf-init.el"))
;;(setq load-path (cons "~/.emacs.d/local-lisp/ocaml.emacs" load-path))
;;(load "~/.emacs.d/local-lisp/ocaml.emacs/ocaml.emacs")
;;(load-file "/usr/local/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")  

(setq special-display-regexps nil)

; (one-buffer-one-frame-mode -1)

;; ;; Added 25 June 2013 for Marmalade package support
;; (require 'package)
(setq package-archives 
    '(("marmalade" . "http://marmalade-repo.org/packages/")
      ("melpa" . "http://melpa.milkbox.net/packages/")
      ("gnu" . "http://elpa.gnu.org/packages/")))

;; (package-initialize)

(column-number-mode 1)

(setq-default indent-tabs-mode nil)

(setq tramp-default-method "ssh")

(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(show-paren-mode 1)

(require 'writegood-mode)
(global-set-key "\C-cg" 'writegood-mode)

;; ;; Added 15 Dec 2013
;; (require 'erc)

;; ;; Load authentication info from an external source.  Put sensitive
;; ;; passwords and the like in here.
     
;; ;; This causes ERC to connect to the Freenode network upon hitting
;; ;; C-c e f.  Replace MYNICK with your IRC nick.
;; (global-set-key "\C-cef" (lambda () (interactive)
;;                            (erc-tls :server "chat.freenode.net" :port "6697"
;;                                 :nick "reitblatt")))
     
;; ;;; Options
     
;; ;; Join the #emacs and #erc channels whenever connecting to Freenode.
;; (setq erc-autojoin-channels-alist '(("freenode.net" "#frenetic" "#hyperdex" "#syslab")))
     
;; Interpret mIRC-style color commands in IRC chats
(setq erc-interpret-mirc-color t)

(require 'tls)

;; (require 'erc-services)
;; (erc-services-mode 1)

;; (setq erc-prompt-for-nickserv-password nil)
;; (load "~/.emacs.d/ercpass")
;; (setq erc-nickserv-passwords
;;       `((freenode.net     (("reitblatt" . ,freenode-pass)))))

(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

;; Added 04 Feb 2014 for color!
(setq ns-use-srgb-colorspace t)


(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Added 07 Feb 2014
(require 'cl) ; If you don't have it already

(defun* get-closest-pathname (&optional (file "Makefile"))
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
    (expand-file-name file
		      (loop 
			for d = default-directory then (expand-file-name ".." d)
			if (file-exists-p (expand-file-name file d))
			return d
			if (equal d root)
			return nil))))

(require 'compile)
 (add-hook 'tuareg-mode-hook (lambda () (set (make-local-variable 'compile-command) (format "cd %s && make " (file-name-directory (get-closest-pathname))))))


;; Added 27 Feb 2014 for ocamlspotter
; load-path
(setq load-path (cons "~/.opam/system/lib/ocamlspot/" load-path))

(require 'ocamlspot)

; tuareg mode hook (use caml-mode-hook instead if you use caml-mode)
(add-hook 'tuareg-mode-hook
  '(lambda ()
    (local-set-key "\C-c;" 'ocamlspot-query)
    (local-set-key "\C-c:" 'ocamlspot-query-interface)
    (local-set-key "\C-c'" 'ocamlspot-query-uses)
    (local-set-key "\C-c\C-t" 'ocamlspot-type)
    (local-set-key "\C-c\C-i" 'ocamlspot-xtype)
    (local-set-key "\C-c\C-y" 'ocamlspot-type-and-copy)
    (local-set-key "\C-ct" 'caml-types-show-type)
    (local-set-key "\C-cp" 'ocamlspot-pop-jump-stack)))

; set the path of the ocamlspot binary. If you did make opt, ocamlspot.opt is recommended.
(setq ocamlspot-command "~/.opam/system/bin/ocamlspot.opt")

; Optional: You can also change overlay colors as follows:
;  (set-face-background 'ocamlspot-spot-face "#660000")
;  (set-face-background 'ocamlspot-tree-face "#006600")

;; Added 27 Feb 2014 for better OPAM integration
; Set OPAM environment variables
(dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
  (setenv (car var) (cadr var)))

;; Added 27 Feb 2014 for better OCaml integration
;; make OCaml-generated files invisible to filename completion
(mapc #'(lambda (ext) (add-to-list 'completion-ignored-extensions ext))
  '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi" ".cmxs" ".cmt" ".annot"))

;; Use ocp-indent to indent instead of Tuareg's default
(eval-after-load "tuareg"
  (let ((opamdir (car (split-string (shell-command-to-string "opam config var prefix")))))
    (load-file (concat opamdir "/share/emacs/site-lisp/ocp-indent.el"))))
