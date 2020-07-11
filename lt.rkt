#lang racket
(require test-engine/racket-tests)

(define (minus1 n) (- n 1))

(define (zero? n) (= 0 n))

(define <
  (lambda (n m)
    (cond
      [(zero? m) #f]
      [(zero? n) #t]
      [else (< (minus1 n) (minus1 m))])))

(check-expect (< 2 1) #f)
(check-expect (< 1 2) #t)
(check-expect (< 1 1) #f)
(test)