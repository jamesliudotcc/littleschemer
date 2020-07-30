#lang racket
(require test-engine/racket-tests)

(define atom?
  (λ (x)
    (and (not (pair? x)) (not (null? x)))))


(define lat?
  (λ (x)
    (cond
    [(null? x) #t]
    [(atom? (car x)) (lat? (cdr x)) #t]
    [else #f])))


(check-expect (lat? '()) #t)
(check-expect (lat? '("hi")) #t)
(check-expect (lat? '('())) #f)
(test)