;;color
'(font-lock-builtin-face ((t (:foreground "blue"))))
 '(font-lock-comment-face ((t (:foreground "tomato"))))
 '(font-lock-doc-face ((t (:inherit default))))
 '(font-lock-keyword-face ((t (:foreground "cyan"))))
 '(font-lock-string-face ((t (:foreground "red1"))))
 '(font-lock-type-face ((t (:foreground "green"))))
'(font-lock-variable-name-face ((t (:foreground "magenta")))))


;; line numberの表示
;;(require 'linum)
(global-linum-mode 1)

;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)

;;highlight
(global-hl-line-mode t)

;; メニューバーを非表示
(menu-bar-mode 0)

;; ツールバーを非表示
(tool-bar-mode 0)

;; 対応する括弧をハイライト
(show-paren-mode 1)

;; タイトルにフルパス表示
(setq frame-title-format "%f")


;; スタートアップメッセージを表示させない
(setq inhibit-startup-message 1)

;; ターミナルで起動したときにメニューを表示しない
(if (eq window-system 'x)
    (menu-bar-mode 1) (menu-bar-mode 0))
(menu-bar-mode nil)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; スクロールは1行ごとに
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))

;; スクロールの加速をやめる
(setq mouse-wheel-progressive-speed nil)

;; 分割したウィンドウ間を Shift + 矢印キー で移動
(windmove-default-keybindings)
(setq windmove-wrap-around t)


;;
;; key bind
;;
(define-key esc-map (kbd "g") 'goto-line)
(global-set-key "\M-n" 'find-file-other-frame) ;;M-nで別窓でファイルを開く
(add-hook 'c++-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'c-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
