#lang racket
;TDA Local Repository
(require "TDA_Index.rkt")
(provide crear_Local_Repository es_Local_Repository agregar_Local_Repository)




(define crear_Local_Repository(lambda lista
                         (list "Local_Repository" 
                               lista)))
; (crear_Local_Repository "Primer commit" "hola.c")

(define es_Local_Repository(lambda (zonas)
                      (if (equal? "Local_Repository" (car (car (cdr (cdr zonas)))))
                          #t
                          #f)))
; (es_Local_Repository zonas)


(define agregar_Local_Repository(lambda (commit lista)
                           (lambda (zonas)
                             (if (es_Local_Repository zonas)
                                 (if (null? (car (cdr (car (cdr (cdr zonas))))))
                                     (list  (car zonas) (crear_Index) (append (list "Local_Repository") (list (append (list commit) lista))) (car (cdr (cdr (cdr zonas)))) (car (cdr (cdr (cdr (cdr zonas))))))
                                     (list  (car zonas) (crear_Index) (append (list "Local_Repository") (list (append (list commit) lista)) (cdr (car (cdr (cdr zonas))))) (car (cdr (cdr (cdr zonas)))) (car (cdr (cdr (cdr (cdr zonas)))))))
                                 (display "Local_Repository no valido")))))
; ((agregar_Local_Repository "este es mi commit" (car (cdr (car (cdr zonas)))))zonas)