;;(set-background-color "black") ;; 使用黑色背景
;;(set-foreground-color "white") ;; 使用白色前景
;;(set-face-foreground 'region "green")  ;; 区域前景颜色设为绿色
;;(set-face-background 'region "blue") ;; 区域背景色设为蓝色


(when (eq system-type 'windows-nt)
(setq gc-cons-threshold (* 512 1024 1024))
(setq gc-cons-percentage 0.5)
(run-with-idle-timer 5 t #'garbage-collect)
;; 显示垃圾回收信息，这个可以作为调试用
;; (setq garbage-collection-messages t)
)

;;配置要点（1）
 (create-fontset-from-fontset-spec
   "-*-Consolas-normal-normal-normal-mono-14-*-*-*-c-*-fontset-mono"
 )
;;配置要点（2）
(dolist (charset '(chinese-gbk cjk-misc))
    (set-fontset-font
     "fontset-mono" charset
     "-*-仿宋-normal-normal-normal-mono-16-*-*-*-c-*-iso8859-1" nil 'prepend
))
;;配置要点（3）
(set-fontset-font "fontset-default" 'han "BabelStone Han")
;;配置要点（4）
(setq default-frame-alist
      (append
       '((font . "fontset-mono")) default-frame-alist))

(add-to-list 'custom-theme-load-path "~/.emacs.d/site-lisp/emacs-color-theme-solarized-master")
(load-theme 'solarized t)
(set-frame-parameter nil 'background-mode 'dark)    ;;选择solarized dark
(enable-theme 'solarized)
