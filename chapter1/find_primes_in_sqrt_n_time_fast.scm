;;; same as "find_primes_in_sqrt_n_time.scm", but skips even numbers > 2

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
    (= n (smallest-divisor n)))
(define (next n)
  (if (= n 2) 3 (+ n 2)))

(define (timed-prime-test n)
  (start-prime-test n (real-time-clock)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (real-time-clock) start-time) n)
      #f))
(define (report-prime elapsed-time n)
  (display (string-append (number->string n) " is prime"))
  (display " *** ")
  (display (string-append "time spent: " (number->string elapsed-time)))
  (newline)
  #t)

(define (search_for_primes start_with)
  (prime_search_iter start_with 3 0))
(define (prime_search_iter n num_of_primes num_found)
  (cond ((= num_of_primes num_found) (newline) (display "finished"))
        ((timed-prime-test n)
          (prime_search_iter (+ n 1) 3 (+ num_found 1)))
        (else (prime_search_iter (+ n 1) 3 num_found)))
  )

(search_for_primes 1000000000000)
