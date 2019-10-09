;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.


(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(shell-scripts
     html
     yaml
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                       auto-completion-enable-snippets-in-popup 't
                       auto-completion-enable-help-tooltip 't
                       auto-completion-enable-sort-by-usage 't)

     better-defaults
     emacs-lisp
     git
     markdown
     (org :variables org-projectile-file "todo.org")
     bibtex
     (python :variables python-backend 'lsp)
     julia
     haskell
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     coq
     treemacs
     docker
     spacemacs-editing
     spacemacs-evil
     spacemacs-project
     tabbar
     swift
     lsp
     shell-scripts
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     pretty-mode
     jupyter
     ebib
     flycheck-mypy
     (lsp-sourcekit :after lsp)
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 10.0
                               :weight normal
                               :width normal
                               :powerline-scale 1.15)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ";"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "M-,"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 40
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs 't
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; fix annoying insertions in proof general
  (setq evil-want-abbrev-expand-on-insert-exit nil)

    )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; jk
  (setq-default
   evil-escape-key-sequence "jk"
   evil-escape-unordered-key-sequence 't
   )

  ;; doesn't work :/
  (setq auto-completion-complete-with-key-sequence "io")
  (setq global-visual-line-mode 't)

  (global-visual-line-mode t)

  ;; zg to add word to dictionary
  (defun my-save-word ()
    (interactive)
    (let ((current-location (point))
          (word (flyspell-get-word)))
      (when (consp word)
        (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))
  (define-key evil-normal-state-map (kbd "z g") 'my-save-word)

  ;; don't yank into regs; + still works
  (setq x-select-enable-clipboard nil)

  ;; movement
  (global-set-key (kbd "C-l") 'evil-window-right)
  (global-set-key (kbd "C-j") 'evil-window-down)
  (global-set-key (kbd "C-k") 'evil-window-up)
  (global-set-key (kbd "C-h") 'evil-window-left)
  (define-key evil-insert-state-map (kbd "C-l") 'evil-window-right)
  (define-key evil-insert-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-insert-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)

  ;; snippet dir
  (setq yas-snippet-dirs (append yas-snippet-dirs
                                 `(,(expand-file-name "~/.spacemacs.d/snippets"))))

  ;; remote host shortcuts
  (defun jhgilles-find-txe1 ()
    (interactive)
    (find-file "/ssh:jhgilles@txe1-login.mit.edu:/home/gridsan/jhgilles/6.338"))
  (defun jhgilles-find-tig-slurm ()
    (interactive)
    ;; kinit, since emacs doesn't understand krb auth in SSH
    (shell-command "bash -c 'if ! compgen -G /tmp/krb5cc_* >/dev/null; then echo ~~KINIT~~; cat ~/.spacemacs.d/secrets/csail.txt | kinit jhgilles@CSAIL.MIT.EDU >/dev/null; fi'")
    (find-file "/ssh:jhgilles@tig-slurm.csail.mit.edu:/data/scratch/jhgilles")
    )
  (spacemacs/set-leader-keys "oRt" 'jhgilles-find-txe1)
  (spacemacs/set-leader-keys "oRg" 'jhgilles-find-tig-slurm)

  ;; lsp-sourcekit
  (setenv "SOURCEKIT_TOOLCHAIN_PATH" "/")
  (setq lsp-sourcekit-executable (expand-file-name "/home/radical/dev/tensorflow-swift-docker/bin/tfs-sourcekit-lsp"))
  (require 'lsp-sourcekit)
  (setq spacemacs-jump-handlers-swift-mode '())
  (add-hook 'swift-mode-hook (lambda () (lsp)))
  (setq lsp-ui-flycheck-live-reporting nil)

  ;; pyls settings
  (setq flycheck-idle-change-delay 5.0)

  ;; org mode + jupyter integration
  (setq inferior-julia-program-name "/usr/bin/julia")
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (julia . t)
     (python . t)
     (jupyter . t)))
  (setq ob-async-no-async-languages-alist '("jupyter-python" "jupyter-julia"))
  ;; (org-babel-jupyter-override-src-block "python")
  ;; (org-babel-jupyter-override-src-block "julia")
  ;; ;; these don't work for some reason:
  ;; (setq org-babel-default-header-args:jupyter-julia '((:session . "jl") (:async . "yes")))
  ;; (setq org-babel-default-header-args:julia '((:session . "jl") (:async . "yes")))
  ;; (setq org-babel-default-header-args:jupyter-python '((:session . "py") (:async . "yes")))
  ;; (setq org-babel-default-header-args:python '((:session . "py") (:async . "yes")))
  (setq org-confirm-babel-evaluate nil)
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
  (add-hook 'org-mode-hook 'org-display-inline-images)
  ;; disable silly behavior on `o'
  (evil-define-key 'normal evil-org-mode-map
    (kbd "o") 'evil-open-below
    (kbd "O") 'evil-open-above)
  (setq org-src-preserve-indentation 't)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0))

  ;; org + tufte-latex
  (add-to-list 'load-path (expand-file-name "~/.spacemacs.d/packages/tufte-org-mode/"))
  (require 'ox-tufte-latex)
  ;; use latexmk
  (setq org-latex-pdf-process (list
                               "latexmk -shell-escape -pdf -f -lualatex  %f"))
  ;; enable tufte-handout
  (add-to-list 'org-latex-classes
              '("tufte-handout"
                "\\documentclass[nobib]{tufte-handout}
    [NO-DEFAULT-PACKAGES]"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")))
  ;; not sure what this does
  (setq org-latex-prefer-user-labels t)
  ;; minted
  (setq org-latex-listings 'minted
        org-latex-packages-alist '(("" "minted")))
  (setq org-latex-minted-options
        '(("frame" "lines") ("linenos=true") ("mathescape") ("breaklines=true")) )
  ;; inline latex links
  (org-add-link-type
   "latex" nil
   (lambda (path desc format)
     (when (eq format 'latex)
       (format "\\%s{%s}" path desc))))
  ;; inline latex links w/ options
  (org-add-link-type
   "latex-opt" nil
   (lambda (path desc format)
     (when (eq format 'latex)
       (let* ((desc-list (split-string desc ";"))
              (opt (nth 1 desc-list))
              (arg (nth 0 desc-list)))
         (format "\\%s%s{%s}" path
                 (if (equal "" opt) opt (format "[%s]" opt))
                 arg)))))


  ;; proof-general / company-mode
  (spacemacs/set-leader-keys-for-major-mode 'coq-mode "M-." 'company-coq-proof-goto-point)

  (setq debug-on-error t)

  ; https://www.gnu.org/software/emacs/manual/html_node/elisp/Symbol-Components.html
  ; https://www.gnu.org/software/emacs/manual/html_node/elisp/Function-Cells.html

  (defun get-string-from-file (filePath)
    "Return filePath's file content."
    (with-temp-buffer
      (insert-file-contents filePath)
      (buffer-string)))

  (defun copy-orig-function (symbol)
    (let ((symbol-orig (intern (format "%s-orig" (symbol-name symbol)))))
      (progn
        (if (not (fboundp symbol-orig))
            (fset symbol-orig (symbol-function symbol)))
        )))

  (copy-orig-function 'create-image)

  (if (not (file-exists-p "/tmp/emacs-upscaled"))
      (make-directory "/tmp/emacs-upscaled"))

  ;;; scale most images by 2
  (defun create-image-2x (oldfun file-or-data &optional type data-p &rest props)
    (progn
      (if (and (boundp 'file-or-data) file-or-data (stringp file-or-data) (string-suffix-p ".svg" file-or-data))
          (let*
              ((shortname (f-base file-or-data))
               (target (format "/tmp/emacs-upscaled/%s.svg" shortname)))
            (if (not (file-exists-p target))
                (call-process (expand-file-name "~/.spacemacs.d/double_svg.py") nil nil 't file-or-data target)
              )
            (setq file-or-data target))
        )
      (let ((original (apply oldfun (append (list file-or-data type data-p) props))))
        (if (memq type '(xpm xbm pbm imagemagick)) ;not sure about xbm,pbm,imagemagick
            original
          (let* ((width-height (image-size original t))
                 (width (car width-height))
                 (height (cdr width-height))
                 (width-2x (* 2 width))
                 (height-2x (* 2 height))
                 (newprops (plist-put props :format type))
                 (newprops (plist-put newprops :width width-2x))
                 (newprops (plist-put newprops :height height-2x))
                                        ;(newargs (append (list file-or-data 'imagemagick data-p) newprops)))
                 (newargs (append (list file-or-data type data-p) newprops)))
            (apply oldfun newargs))))))
  (fset 'create-image (symbol-function 'create-image-orig))
  (advice-add 'create-image :around #'create-image-2x)

  (defun risky-local-variable-p (sym &optional _ignored)
    nil)

  ;; pretty config: use fira code
  (global-pretty-mode t)
  (pretty-deactivate-groups
   '(:equality :ordering :ordering-double :ordering-triple
               :arrows :arrows-twoheaded :punctuation
               :logic :sets :function))
  (pretty-activate-groups
   '(:sub-and-superscripts :greek :arithmetic-nary))
  (defun my-correct-symbol-bounds (pretty-alist)
      "Prepend a TAB character to each symbol in this alist,
  this way compose-region called by prettify-symbols-mode
  will use the correct width of the symbols
  instead of the width measured by char-width."
      (mapcar (lambda (el)
                (setcdr el (string ?\t (cdr el)))
                el)
              pretty-alist))
  (defun my-ligature-list (ligatures codepoint-start)
      "Create an alist of strings to replace with
  codepoints starting from codepoint-start."
      (let ((codepoints (-iterate '1+ codepoint-start (length ligatures))))
        (-zip-pair ligatures codepoints)))

    (setq my-fira-code-ligatures
          (let* ((ligs '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
                        "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
                        "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
                        "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
                        ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
                        "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
                        "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
                        "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
                        ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
                        "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
                        "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
                        "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
                        "DONT USE THIS U FUCSKJFASKLJFAD"":" "+" "+" "*")))
          (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))
  (defun my-set-fira-code-ligatures ()
    "Add fira-code ligatures for use with prettify-symbols-mode."
    (setq prettify-symbols-alist
          (append my-fira-code-ligatures prettify-symbols-alist))
    (prettify-symbols-mode))
  (add-hook 'prog-mode-hook 'my-set-fira-code-ligatures)
  )



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (pretty-mode company-coq company-math math-symbol-lists proof-general xterm-color unfill smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim multi-term mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit transient git-commit with-editor eshell-z eshell-prompt-extras esh-help company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (insert-shebang helm-gtags ggtags flycheck-bashate fish-mode counsel-gtags counsel swiper company-shell pretty-mode company-coq company-math math-symbol-lists proof-general xterm-color unfill smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim multi-term mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit transient git-commit with-editor eshell-z eshell-prompt-extras esh-help company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(safe-local-variable-values
   (quote
    ((eval progn
           (message "running in adv-lth python")
           (pyvenv-activate
            (expand-file-name "/miniconda"))
           (setq exec-path
                 (append
                  (quote
                   ("/home/radical/dev/adv_lth/miniconda/bin"))
                  exec-path))
           (setenv "PYTHONPATH"
                   (concat "/home/radical/dev/adv_lth" ":"
                           (getenv "PYTHONPATH"))))
     (eval progn
           (message "running in adv-lth python")
           (pyvenv-activate
            (expand-file-name "/miniconda"))
           (setq exec-path
                 (append
                  (quote
                   ("/home/radical/dev/adv_lth/miniconda/bin"))
                  exec-path))
           (setenv "PYTHONPATH"
                   (concat "/home/radical/dev/adv_lth" ";"
                           (getenv "PYTHONPATH"))))
     (eval progn
           (message "running in adv-lth python")
           (pyvenv-activate
            (expand-file-name "/miniconda"))
           (setq exec-path
                 (append
                  (quote
                   ("/home/radical/dev/adv_lth/miniconda/bin"))
                  exec-path))
           (setenv "PYTHONPATH"
                   (concat "/home/radical/dev" ";"
                           (getenv "PYTHONPATH"))))
     (eval progn
           (message "running in adv-lth python")
           (pyvenv-activate
            (expand-file-name "/miniconda"))
           (setq exec-path
                 (append
                  (quote
                   ("/home/radical/dev/adv_lth/miniconda/bin"))
                  exec-path))
           (setenv "PYTHONPATH"
                   (append
                    (quote
                     ("/home/radical/dev"))
                    (getenv "PYTHONPATH"))))
     (eval progn
           (message "running in adv-lth python")
           (pyvenv-activate
            (expand-file-name "/miniconda"))
           (setq exec-path
                 (append
                  (quote
                   ("/home/radical/dev/adv_lth/miniconda/bin"))
                  exec-path)))
     (eval progn
           (message "running in adv-lth python")
           (pyvenv-activate
            (expand-file-name "/miniconda"))
           (setq exec-path
                 (append exec-path
                         (quote
                          ("/home/radical/dev/adv_lth/miniconda/bin")))))
     (eval progn
           (message "running in adv-lth")
           (defun jupyter-command
               (&rest args)
             (with-temp-buffer
               (when
                   (zerop
                    (apply
                     (function process-file)
                     "/home/radical/dev/adv_lth/miniconda/bin/jupyter" nil t nil args))
                 (string-trim-right
                  (buffer-string)))))
           (jupyter-available-kernelspecs
            (quote t)))
     (eval progn
           (message "running in adv-lth")
           (defun jupyter-command
               (&rest args)
             (with-temp-buffer
               (when
                   (zerop
                    (apply
                     (function process-file)
                     "/home/radical/dev/adv_lth/miniconda/bin/jupyter" nil t nil args))
                 (string-trim-right
                  (buffer-string))))))
     (lsp-pyls-server-command . "/home/radical/dev/adv_lth/miniconda/bin/pyls")
     (lsp-pyls-server-command . "/home/radical/dev/adv_lth/scripts/pyls")
     (lsp-pyls-server-command . "env PYTHONPATH=$PYTHONPATH;miniconda/lib/python3.7/site-packages/ /home/radical/dev/adv_lth/scripts/pyls")
     (lsp-pyls-server-command . "env PYTHONPATH=$PYTHONPATH;miniconda/lib/python3.7/site-packages/ /home/radical/dev/pyls-pypy/venv/bin/pyls")
     (eval progn
           (message "running in adv-lth python")
           (pyvenv-activate
            (expand-file-name "/miniconda"))
           (lsp))
     (lsp-pyls-server-command . "/home/radical/dev/pyls-pypy/venv/bin/pyls")
     (eval progn
           (message "running in adv-lth"))
     (python-backend . lsp)
     (eval require
           (quote ox-gfm))
     (org-inline-image-overlays)
     (org-latex-caption-above)
     (org-hide-macro-markers . t)
     (org-fontify-quote-and-verse-blocks . t)
     (eval org-sbe "latex-link")
     (eval org-sbe "latex-opt-link")
     (eval org-sbe "jk-keywords")
     (eval org-sbe "pdf-process-bibtex")
     (eval org-sbe "ngz-nbsp")
     (eval org-sbe "latex-filter-footcites")
     (eval org-sbe "biblatex-cite-link")
     (eval org-sbe "biblatex-textcite-link")
     (eval org-sbe "biblatex-parencite-link")
     (eval org-sbe "biblatex-sidecite-link")
     (eval org-sbe "biblatex-multicite-link")
     (eval org-sbe "biblatex-footcite-link")
     (eval org-sbe "tufte-ebib-setup")
     (eval org-sbe "tufte-handout")
     (eval org-sbe "tufte-book")
     (eval org-sbe "user-entities")
     (eval ox-extras-activate
           (quote
            (ignore-headlines)))
     (eval require
           (quote ox-extra))
     (eval require
           (quote ox-tufte-latex)))))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
