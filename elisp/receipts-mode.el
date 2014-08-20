(define-generic-mode 'receipt-mode
  '(?#)
  '( ;; core
   "DATE/TIME" "PAYMENT TYPE" "STATION" "CASHIER"
   "CHECK" "GRAND TOTAL"
)
  '(("c[[:digit:]]+\.[[:digit:]]+" . font-lock-type-face)
    ("Subtotal" . 'font-lock-variable-name-face)
    )
  '(".receipt\\'")
  nil
  "Gneric mode for Apache interceptor receipt files.")


(provide 'receipts-mode)
