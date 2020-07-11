#lang racket
(require test-engine/racket-tests)

(define (minus1 n) (- n 1))

(define (zero? n) (= 0 n))

(define >
  (lambda (n m)
    (cond
      [(zero? n) #f]
      [(zero? m) #t]
      [else (> (minus1 n) (minus1 m))])))

(check-expect (> 2 1) #t)
(check-expect (> 1 2) #f)
(check-expect (> 1 1) #f)
(test)