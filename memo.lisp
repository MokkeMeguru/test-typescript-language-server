(lsp-register-client
 (make-lsp-client :new-connection
                  (lsp-tramp-connection (list "typescript-language-server" "--stdio"))
                  :major-modes '(typescript-mode)
                  :remote? t
                  :server-id 'typescript-remote))
