#lang racket
(require test-engine/racket-tests)

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define lat?
  (lambda (x)
    (cond
    [(null? x) #t]
    [(atom? (car x)) (lat? (cdr x)) #t]
    [else #f])))

(define firsts
  (lambda (l)
    (cond
      [(null? l) '()]
      [else (cons (car (car l)) (firsts (cdr l)))])))


(check-expect (firsts '())
              '())
(check-expect (firsts '(("apple" "peach" "pumpkin")
                        ("plum" "pear" "cherry")
                        ("grape" "raisin" "pea")
                        ("bean" "carrot" "eggplant")))
              '("apple" "plum" "grape" "bean"))
(test)