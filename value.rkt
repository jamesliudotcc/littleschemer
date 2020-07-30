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

(define value
  (λ (nexp)
    (cond
      [(atom? nexp) nexp]
      [(eq? (car (cdr nexp)) '+) (+ (value (car nexp)) (value (car (cdr (cdr nexp)))))]
      [(eq? (car (cdr nexp)) '×) (* (value (car nexp)) (value (car (cdr (cdr nexp)))))]
      [(eq? (car (cdr nexp)) '↑) (expt (value (car nexp)) (value (car (cdr (cdr nexp)))))]
      )))

(check-expect (value '(5 × (2 ↑ 3))) 41)
(test)