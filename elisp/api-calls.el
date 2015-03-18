(use-package request
  :ensure request)


(defun refresh-token ()
  (request
   "http://qbp.dev.up-next.com/oauth/token"
   :type "POST"
   :data '(("grant_type" . "refresh_token")
           ("client_id" . "86f9a841a37e8cc3853eaea0e6009db6cfae123a854006ee6cb1924af4b3d81b")
           ("client_secret" . "e00ba47f41c462ff5ac2a18c20b38faeb34083e30b1710e347971115483a41c2")
           ("refresh_token" . "139de6146209cbf4db0da5412ac3f6cca2cd1f3c1d9e2dc764218efc1879b057")
           )
   :parser 'json-read
   :success (function*
             (lambda (&key data &allow-other-keys)
               (insert "\n I sent: %S" (assoc-default 'form data))))
   :status-code '((401 . (lambda (&rest _) (insert "\n Got 401."))))))


(defun create-user ()
  (request
   "http://qbp.dev.up-next.com/api/v1/devices"
   :type "POST"
   :data (json-encode '(("access_token" . "7033562fe4ae516e4ffa2a3f2a1bffc0b7f1d68ee50077e68fecb4d3dd76318c")
                        ("device" . (("name" . "Devicecool") ("identifier" . "adfsjkfashkadjsfhaskj")))))
   :headers '(("Content-Type" . "application/json"))
   :parser 'json-read
   :success (function*
             (lambda (&key data &allow-other-keys)
               (insert "\n I sent: %S" (assoc-default 'form data))))
   :status-code '((401 . (lambda (&rest _) (insert "\n Got 401."))))))

;; (create-user)
;; (refresh-token)
