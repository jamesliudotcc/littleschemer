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

(define multirember
  (lambda (a lat)
    (cond
      [(null? lat) '()]
      [else
       (cond
         [(eq? a (car lat)) (multirember a (cdr lat))]
         [else (cons (car lat) (multirember a (cdr lat)))])])))

(define rember*
  (lambda (a l)
    (cond
      [(null? l) '()]
      [(atom? (car l))
       (cond
         [(eq? a (car l)) (rember* a (cdr l))]
         [else l])]
      [else (cons (rember* a (car l)) (rember* a (cdr l)))])))

(check-expect (rember* "hi" '()) '())
(check-expect (multirember "hi" '("hi")) '())
(check-expect (multirember "cup" '("coffee" "cup" "tea" "cup" "and" "hick" "cup")) '("coffee" "tea" "and" "hick"))
(check-expect (rember* "cup"
                       '(("coffee") "cup" (("tea") "cup") ("and" ("hick")) "cup"))
              '(("coffee") (("tea")) ("and" ("hick"))))
(test)