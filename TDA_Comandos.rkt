#lang racket
;TDA Comandos
(provide crear_Comandos es_Comandos agregar_Comando)

;FUNCION DE CONSTRUCCION
;Desc: Si la lista de comandos no a sido creada, la funcion inicia la lista con el primer comando la fecha y hora
;Dom: Lista
;Rec: Lista
(define crear_Comandos(lambda lista
                         (list "Comandos" 
                               lista)))
;FUNCION DE PERTENENCIA
;Desc: Funcion que me entrega un booleano si esta bien o no la zona de comandos dentro de mi directorio
;Dom: Lista
;Rec: Booleano
(define es_Comandos(lambda (zonas)
                      (if (equal? "Comandos" (car (car (cdr (cdr (cdr (cdr zonas)))))))
                          #t
                          #f)))
;FUNCION DE MODIFICACION
;Desc: Funcion que modifica mi zona actual de comandos para añadir mas comandos
;Dom: Lista
;Rec: Lista
(define agregar_Comando(lambda (fecha comando)
                           (lambda (zonas)
                             (if (es_Comandos zonas)
                                 (list  (car zonas) (car (cdr zonas)) (car (cdr (cdr zonas))) (car (cdr (cdr (cdr zonas)))) (append (list "Commando") (list (append (list fecha) (list comando))) (cdr (car (cdr (cdr (cdr (cdr zonas))))))))
                                 (display "Comando no valido")))))
;Ejemplo

;(crear_Comandos "HORA" "FECHA" "COMANDO")
;(crear_Comandos "18:36" "01-06-2020" "push")
;(crear_Comandos "18:37" "01-06-2020" "pull")

;(es_Comandos '(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;(es_Comandos '(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Coms" ())))
;(es_Comandos '(("Workspace" ()) ("Indeeeeeeeex" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))

; ((agregar_Comando "28/05/2020" "Pull")'(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))