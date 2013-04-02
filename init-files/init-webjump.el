(require 'webjump)

(setq webjump-sites
        (append '(
                  ("localhost:300" . "localhost:3000")
                  ("Axle test"   . "axle-test.heroku.com")
                  ("Clojure Docs" . "clojuredocs.org/search?q=")
                  )
                webjump-sample-sites))


(global-set-key (kbd "C-c j") 'webjump)

(provide 'init-webjump)
