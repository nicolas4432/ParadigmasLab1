#lang racket
;TDA Workspace
(provide crear_Workspace es_Workspace agregar_Workspace)





(define crear_Workspace(lambda lista
                         (list "Workspace" 
                               lista)))
; (crear_Workspace "hola.c" "nose" "a")

(define es_Workspace(lambda (zonas)
                      (if (equal? "Workspace" (car (car zonas)))
                          #t
                          #f)))
; (es_Workspace zonas)


(define agregar_Workspace(lambda archivos
                           (lambda (zonas)
                             (if (es_Workspace zonas)
                                 (list  (list "Workspace" (append archivos (car (cdr (car zonas))))) (car (cdr zonas)) (car (cdr (cdr zonas))) (car (cdr (cdr (cdr zonas)))) (car (cdr (cdr (cdr (cdr zonas))))))
                                 (display "Directorio no valido")))))
; ((agregar_Workspace "nuevo.c" "otro.c")zonas)