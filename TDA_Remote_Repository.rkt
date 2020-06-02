#lang racket
;TDA Remote Repository
(provide crear_Remote_Repository es_Remote_Repository agregar_Remote_Repository)

;FUNCION DE CONSTRUCCION
;Desc: Si la lista de Remote Repository no a sido creada, la funcion inicia la lista con un Commit o lista vacia
;Dom: Lista
;Rec: Lista
(define crear_Remote_Repository(lambda lista
                         (list "Remote_Repository" 
                               lista)))
;FUNCION DE PERTENENCIA
;Desc: Funcion que me entrega un booleano si esta bien o no la zona de Remote Repository dentro de mi directorio
;Dom: Lista
;Rec: Booleano
(define es_Remote_Repository(lambda (zonas)
                      (if (equal? "Remote_Repository" (car (car (cdr (cdr (cdr zonas))))))
                          #t
                          #f)))
;FUNCION DE MODIFICACION
;Desc: Funcion que modifica mi zona actual de Remote Repository para añadir los commits del Local Repository
;Dom: Lista
;Rec: Lista
(define agregar_Remote_Repository(lambda (zonas)
                             (if (es_Remote_Repository zonas)
                                 (list  (car zonas) (car (cdr zonas)) (car (cdr (cdr zonas))) (append (list "Remote_Repository") (cdr (car (cdr (cdr zonas))))) (car (cdr (cdr (cdr (cdr zonas))))))
                                 (display "Remote_Repository no valido"))))
;EJEMPLOS

;(crear_Remote_Repository "Commit" "hola.c")
;(crear_Remote_Repository "Primer commit")
;(crear_Remote_Repository)

;(es_Remote_Repository '(("Workspace" ()) ("Index" ()) ("Local_Repository" ("Comint1" "archivo.c" "archivo.txt")) ("Remote_Repository" ()) ("Comandos" ())))
;(es_Remote_Repository '(("Workspace" ()) ("Index" ()) ("Local_Reprrrrrrrrrository" ("Comint1" "archivo.c" "archivo.txt")) ("Remote_Repository" ()) ("Comandos" ())))
;(es_Remote_Repository '(("Workspace" ()) ("Index" ()) ("Local_Repository" ("Comint1" "archivo.c" "archivo.txt")) ("Remote_Rrepository" ()) ("Comandos" ())))

;(agregar_Remote_Repository '(("Workspace" ()) ("Index" ()) ("Local_Repository" ("Comint1" "archivo.c" "archivo.txt")) ("Remote_Repository" ()) ("Comandos" ())))
;(agregar_Remote_Repository '(("Workspace" ()) ("Index" ()) ("Local_Repository" ("Comint1" "archivo.c" "archivo.txt") ("Commit2" "hola.c")) ("Remote_Repository" ("Comint1" "archivo.c" "archivo.txt")) ("Comandos" ())))
;(agregar_Remote_Repository '(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))