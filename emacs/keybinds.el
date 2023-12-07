(use-package general
  :ensure t
  :config
  (general-create-definer sam/leader-key
    :prefix "C-c")

  (general-define-key
   "C-<return>" '(lambda () (interactive)
		    (let ((oldpos (point)))
		      (end-of-line)
		      (newline-and-indent)))
   
   "C-S-<return>" '(lambda () (interactive)
		      (let ((oldpos (point)))
			(beginning-of-line)
			(newline-and-indent)
			(previous-line)
			(indent-according-to-mode)))
   
   "M-p" '(lambda () (interactive)
	    (transpose-lines 1)
	    (forward-line -2))
   
   "M-n" '(lambda () (interactive)
	    (forward-line 1)
	    (transpose-lines 1)
	    (forward-line -1)))
  
  (sam/leader-key
   "f c" '((lambda () (interactive) (find-file "~/.config/emacs/init.el")) :wk "Edit emacs config")
   "TAB TAB" '(comment-line :wk "Comment lines")
   "b i" '(ibuffer :wk "Ibuffer")
   "e s" '(eshell :wk "Eshell")
   "t v" '(vterm-toggle :wk "Toggle vterm")
   "h f" '(describe-function :wk "Describe function")
   "h v" '(descrive-variable :wk "Describe variable")
   "h r r" '((lambda () (interactive)
	       (load-file "~/.config/emacs/init.el")
	       (load-file "~/.config/emacs/init.el"))
	     :wk "Reload emacs config"))

  (sam/leader-key
    "l u" '(lsp-ui-imenu :wk "Show imenu entries"))
  )

(use-package sudo-edit
  :ensure t
  :config
  (sam/leader-key
   "f u" '(sudo-edit-find-file :wk "Sudo find file")
   "f U" '(sudo-edit :wk "Sudo edit file")))

(use-package harpoon
  :ensure t
  :config (setq harpoon-project-package 'projectile)
  (sam/leader-key
    "h a" '(harpoon-add-file :wk "Harpoon Add File")
    "h m" '(harpoon-quick-menu-hydra :wk "Harpoon Menu")
    "h c" '(harpoon-clear :wk "Harpoon Clear")
    "h h" '(harpoon-toggle-quick-menu :wk "Harpoon Quick Menu")
    "h t" '(harpoon-toggle-file :wk "Harpoon Toggle File")
    "1" '(harpoon-go-to-1 :wk "Harpoon File 1")
    "2" '(harpoon-go-to-2 :wk "Harpoon File 2")
    "3" '(harpoon-go-to-3 :wk "Harpoon File 3")
    "4" '(harpoon-go-to-4 :wk "Harpoon File 4")
    "5" '(harpoon-go-to-5 :wk "Harpoon File 5")
    "6" '(harpoon-go-to-6 :wk "Harpoon File 6")
    "7" '(harpoon-go-to-7 :wk "Harpoon File 7")
    "8" '(harpoon-go-to-8 :wk "Harpoon File 8")
    "9" '(harpoon-go-to-9 :wk "Harpoon File 9")))
