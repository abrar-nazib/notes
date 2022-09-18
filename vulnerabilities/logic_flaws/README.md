# Logic Flaw Vulnerability

## Where To Find

* Shopping cart
  * could price/quantity be modified?
    * Does it accept negative value?
    * Can it be incremented beyond boundary?
  * Coupon code bypass?
    * Try using a coupon more than once, try using two coupons sequentially(don't really understand)

        ```Python
        #incrementing can lead to negative side of the bytes [x.....-x]
        ```

* User registration
  * n

* Password change
  * could current password be avoided?[delete corrent_pass param]

* 2FA logic
  * generates code on specfic parameter? parameter modifiable?
  * a

* Authentication bypass
  * Drop some requests [break the sequence of things]


## Techniques

## Helpful Writeups