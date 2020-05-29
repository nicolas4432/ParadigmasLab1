#lang racket
;TDA Comandos
(provide crear_Comandos es_Comandos agregar_Comando)





(define crear_Comandos(lambda lista
                         (list "Comandos" 
                               lista)))
; (crear_Comandos "HORA" "FECHA" "COMANDO")

(define es_Comandos(lambda (zonas)
                      (if (equal? "Comandos" (car (car (cdr (cdr (cdr (cdr zonas)))))))
                          #t
                          #f)))
; (es_Comandos zonas)


(define agregar_Comando(lambda (fecha comando)
                           (lambda (zonas)
                             (if (es_Comandos zonas)
                                 (list  (car zonas) (car (cdr zonas)) (car (cdr (cdr zonas))) (car (cdr (cdr (cdr zonas)))) (append (list "Commando") (list (append (list fecha) (list comando))) (cdr (car (cdr (cdr (cdr (cdr zonas))))))))
                                 (display "Comando no valido")))))

; ((agregar_Comando "28/05/2020" "Pull")zonas)