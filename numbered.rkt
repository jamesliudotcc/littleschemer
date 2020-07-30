#lang racket
(require test-engine/racket-tests)

(define atom?
  (λ (x)
    (and (not (pair? x)) (not (null? x)))))

(define (minus1 n) (- n 1))

(define (zero? n) (= 0 n))

(define <
  (λ (n m)
    (cond
      [(zero? m) #f]
      [(zero? n) #t]
      [else (< (minus1 n) (minus1 m))])))

(define >
  (λ (n m)
    (cond
      [(zero? n) #f]
      [(zero? m) #t]
      [else (> (minus1 n) (minus1 m))])))

(define numbered?
  (λ (aexp)
    (cond
      [(atom? aexp) (number? aexp)]
      [else
       (and
        (numbered? (car aexp))
        (numbered? (car (cdr (cdr aexp)))))])))