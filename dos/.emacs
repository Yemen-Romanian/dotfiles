(package-initialize)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;;(menu-bar-mode -1)
;;(toggle-scroll-bar -1)
(tool-bar-mode -1)

;;default background color
(set-background-color "honeydew")

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
