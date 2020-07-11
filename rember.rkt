#lang racket
(require test-engine/racket-tests)

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))


(define (lat? x)
  (cond
    [(null? x) #t]
    [(atom? (car x)) (lat? (cdr x)) #t]
    [else #f]))

(define (rember a lat)
  (cond
    [(null? lat) lat]
    [(eq? (car lat) a) (cdr lat)]
    [else (cons (car lat) (rember a (cdr lat)))]))

(check-expect (lat? '()) #t)
(check-expect (lat? '("hi")) #t)
(check-expect (lat? '("hi")) #t)
(check-expect (lat? '('())) #f)
(test)