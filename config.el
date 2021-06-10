;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Allen Sue"
      user-mail-address "123365031@qq.com")

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
(setq doom-font (font-spec :family "Fira Code" :size 15)
      doom-variable-pitch-font (font-spec :family "monospace" :size 15)
      doom-unicode-font (font-spec :family "monospace" :size 15)
      doom-big-font (font-spec :family "monospace" :size 18)
      )

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

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

;; Include underscores in word motions.
(add-hook 'c-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'c++-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'emacs-lisp-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))

(toggle-frame-maximized)

(after! company
  (setq company-idle-delay 0)
  (setq company-show-numbers t)
  )

(after! which-key
  (setq which-key-idle-delay .4)
  )

(after! treemacs
  (setq treemacs-follow-mode t)
  )

(after! lsp
  (lsp-headerline-breadcrumb-mode 1)
  ;; (map! :map lsp-mode-map
  ;;       )
  )

;; (after! lsp-mode
;;   (setq lsp-headerline-breadcrumb-enable-symbol-numbers t)
;;   )

(after! ccls
  ;; Modify ccls cache path.
  (setq ccls-initialization-options `(:cache (:directory ,(expand-file-name "~/tools/ccls/ccls-cache"))))
  (setq ccls-sem-highlight-method 'font-lock)
  (ccls-use-default-rainbow-sem-highlight)
  )

(with-eval-after-load 'lsp-mode
  (lsp-headerline-breadcrumb-mode t)
  )

(map!
 "C-/" #'comment-line
 :ne "gr" #'+lookup/references
 :ne "gD" #'xref-find-definitions-other-window
 :leader "ff" #'lsp-format-buffer ; format file
 :leader "fo" #'find-file         ; file open
 :leader "SPC" #'counsel-M-x
 )
