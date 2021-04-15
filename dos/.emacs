(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;(menu-bar-mode -1)
;;(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; line numbering
(global-display-line-numbers-mode)

;;set default theme
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-molokai t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


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
 '(custom-safe-themes
   (quote
    ("1ed5c8b7478d505a358f578c00b58b430dde379b856fbcb60ed8d345fc95594e" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" default)))
 '(elfeed-feeds
   (quote
    ("https://www.opennet.ru/opennews/opennews_all_utf.rss" "https://www.linux.org.ru/section-rss.jsp?section=1" "https://www.pravda.com.ua/rss/view_news/" "https://www.pravda.com.ua/rss/view_pubs/" "https://notrelated.xyz/rss" "https://lukesmith.xyz/rss.xml" "https://censor.net/includes/news_ru.xml" "https://censor.net/ru/feed?utm_source=website&utm_medium=header&utm_content=headerlink&utm_campaign=feed")))
 '(package-selected-packages
   (quote
    (jedi zenburn-theme pyenv-mode anaconda-mode ## projectile org-bullets org ivy evil elpy elfeed doom-themes dashboard auto-complete-auctex auctex))))


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
(elpy-enable)
;(prefer-coding-system 'cp1251)

(setenv "WORKON_HOME" (concat (getenv "HOME") "/python-virtual-environments"))
(pyvenv-mode 1)
(add-hook 'python-mode-hook 'jedi:setup)
