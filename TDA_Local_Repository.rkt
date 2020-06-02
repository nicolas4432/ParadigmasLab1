#lang racket
;TDA Local Repository
(provide crear_Local_Repository es_Local_Repository agregar_Local_Repository)

;FUNCION DE CONSTRUCCION
;Desc: Si la lista de Local Repository no a sido creada, la funcion inicia la lista con el primer comentario
;Dom: Lista
;Rec: Lista
(define crear_Local_Repository(lambda lista
                         (list "Local_Repository" 
                               lista)))
;FUNCION DE PERTENENCIA
;Desc: Funcion que me entrega un booleano si esta bien o no la zona de Local Repository dentro de mi directorio
;Dom: Lista
;Rec: Booleano
(define es_Local_Repository(lambda (zonas)
                      (if (equal? "Local_Repository" (car (car (cdr (cdr zonas)))))
                          #t
                          #f)))
;FUNCION DE MODIFICACION
;Desc: Funcion que modifica mi zona actual de Local Repository para añadir mas Commits con los archivos del actual index
;Dom: Lista
;Rec: Lista
(define agregar_Local_Repository(lambda (commit lista)
                           (lambda (zonas)
                             (if (es_Local_Repository zonas)
                                 (if (null? (car (cdr (car (cdr (cdr zonas))))))
                                     (list  (car zonas) (car (cdr zonas)) (append (list "Local_Repository") (list (append (list commit) lista))) (car (cdr (cdr (cdr zonas)))) (car (cdr (cdr (cdr (cdr zonas))))))
                                     (list  (car zonas) (car (cdr zonas)) (append (list "Local_Repository") (list (append (list commit) lista)) (cdr (car (cdr (cdr zonas))))) (car (cdr (cdr (cdr zonas)))) (car (cdr (cdr (cdr (cdr zonas)))))))
                                 (display "Local_Repository no valido")))))

;EJEMPLOS

;(crear_Local_Repository "Primer commit" "hola.c")
;(crear_Local_Repository "Primer commit" "hola.c" "otroArchivo.rkt")
;(crear_Local_Repository "Primer commit")

;(es_Local_Repository '(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;(es_Local_Repository '(("Workspace" ()) ("Index" ()) ("Local_Reposietory" ()) ("Remote_Repository" ()) ("Comandos" ())))
;(es_Local_Repository '(("Workeeeeeeeeeeeeespace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))

;((agregar_Local_Repository "este es mi commit" (car (cdr (car (cdr '(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))))))'(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;((agregar_Local_Repository "este es mi commit" (car (cdr (car (cdr '(("Workspace" ()) ("Index" ("hola.c" "otro.rkt")) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))))))'(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;((agregar_Local_Repository "este es mi commit" (car (cdr (car (cdr '(("Workspace" ()) ("Index" ("hola.c" "otro.rkt" "blabla.txt")) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))))))'(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))