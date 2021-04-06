(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;(menu-bar-mode -1)
;;(toggle-scroll-bar -1)
(tool-bar-mode -1)

;;default background color
(set-background-color "misty rose")

;;set default font
(set-frame-font
 (cond
  ((string-equal system-type "windows-nt")
   (if (member "Consolas" (font-family-list)) "Consolas-12" nil))
  ((string-equal system-type "gnu/linux")
   (if (member "DejaVu Sans Mono" (font-family-list)) "DejaVu Sans Mono" nil))
  (t nil))
 t t)

;; set maximized screen at startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; dashboard configuration
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((recents . 5)
			(projects . 5)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (pyenv-mode anaconda-mode ## projectile org-bullets org ivy evil elpy elfeed doom-themes dashboard auto-complete-auctex auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ORG MODE
(require 'org-bullets)
(add-hook 'org-mode-hook #'org-bullets-mode)
(global-set-key (kbd "C-c a") 'org-agenda)

;; replace with org files to track
;;(setq org-agenda-files '("~/org/example.org")) 
