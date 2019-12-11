;; how to run typescript-language-server with docker project
;; 1. run in eshell
;; git clone https://github.com/emacs-lsp/lsp-docker/ ~/
(add-to-list 'load-path "~/lsp-docker")
(require 'lsp-docker)

;; 2. run in multi-term
;;;;;;;;;
;; docker-compose run workspace
;; docker ps
;; =>
;; ac2736529d12        test-ts-lsp_workspace   "docker-entrypoint.s…"   31 seconds ago      Up 28 seconds                                  test-ts-lsp_workspace_run_5a93d2877899
;;;;;;;;;

;; 3. run in eshell
(lsp-docker-register-client
 :server-id 'ts-ls
 :priority 1
 :docker-server-id 'typescript-docker
 :docker-image-id "ac2736529d12"
 :docker-container-name "test-ts-lsp_workspace_run_5a93d2877899"
 :server-command "typescript-language-server --stdio --log-level 4 --tsserver-log-file /tmp/tslog.txt"
 :path-mappings '(("/home/meguru/Github/test-ts-lsp" . "/usr/app"))
 :launch-server-cmd-fn #'lsp-docker-launch-new-container)


;; for showing lsp log
;; (setq lsp-print-io t)






;; memo

;; (lsp-register-client
;;  (make-lsp-client :new-connection
;;                   (lsp-tramp-connection (list "typescript-language-server" "--stdio" "--log-level 4" " --tsserver-log-file /tmp/tslog.txt"))
;;                   :major-modes '(typescript-mode)
;;                   :remote? t
;;                   :server-id 'ts-ls))
