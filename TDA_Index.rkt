#lang racket
;TDA Index
(provide crear_Index es_Index agregar_Index)





(define crear_Index(lambda lista
                         (list "Index" 
                               lista)))
; (crear_Index "hola.c" "nose" "a")

(define es_Index(lambda (zonas)
                      (if (equal? "Index" (car (car (cdr zonas))))
                          #t
                          #f)))
; (es_Index zonas)


(define agregar_Index(lambda archivos
                           (lambda (zonas)
                             (if (es_Index zonas)
                                 (list  (car zonas) (list "Index" (append archivos (car (cdr (car (cdr zonas)))))) (car (cdr (cdr zonas))) (car (cdr (cdr (cdr zonas)))) (car (cdr (cdr (cdr (cdr zonas))))))
                                 (display "Index no valido")))))
; ((agregar_Index "nuevo.c" "otro.c")zonas)