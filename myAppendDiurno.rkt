#lang racket

(provide myAppend max)


;desc: juntar dos listas
;dom: Lista X Lista
;rec: Lista
;t. rec: Natural
(define myAppend (lambda (L1 L2)
  (if (null? L1)
      L2
      (if (null? L2)
          L1
          (cons (car L1) (myAppend (cdr L1) L2))))))

(define max 100)


