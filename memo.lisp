(lsp-register-client
 (make-lsp-client :new-connection
                  (lsp-tramp-connection (list "typescript-language-server" "--stdio" "--log-level 4" " --tsserver-log-file /tmp/tslog.txt"))
                  :major-modes '(typescript-mode)
                  :remote? t
                  :server-id 'typescript-remote))

;; for showing lsp log
(setq lsp-print-io t)
