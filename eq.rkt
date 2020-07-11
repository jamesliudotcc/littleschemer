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

(define >
  (lambda (n m)
    (cond
      [(zero? n) #f]
      [(zero? m) #t]
      [else (> (minus1 n) (minus1 m))])))

(define eq?
  (lambda (n m)
    (cond
      [(< n m) #f]
      [(> n m) #f]
      [else #t])))

(check-expect (eq? 2 1) #f)
(check-expect (eq? 1 2) #f)
(check-expect (eq? 1 1) #t)
(test)