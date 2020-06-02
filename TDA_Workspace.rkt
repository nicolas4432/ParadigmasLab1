#lang racket
;TDA Workspace
(provide crear_Workspace es_Workspace agregar_Workspace)

;FUNCION DE CONSTRUCCION
;Desc: Si la lista de Workspace no a sido creada, la funcion inicia la lista con archivos
;Dom: Lista
;Rec: Lista
(define crear_Workspace(lambda lista
                         (list "Workspace" 
                               lista)))
;FUNCION DE PERTENENCIA
;Desc: Funcion que me entrega un booleano si esta bien o no la zona de Workspace dentro de mi directorio
;Dom: Lista
;Rec: Booleano
(define es_Workspace(lambda (zonas)
                      (if (equal? "Workspace" (car (car zonas)))
                          #t
                          #f)))
;FUNCION DE MODIFICACION
;Desc: Funcion que modifica mi zona actual de Workspace para añadir mas archivos
;Dom: Lista
;Rec: Lista
(define agregar_Workspace(lambda archivos
                           (lambda (zonas)
                             (if (es_Workspace zonas)
                                 (list  (list "Workspace" (append archivos (car (cdr (car zonas))))) (car (cdr zonas)) (car (cdr (cdr zonas))) (car (cdr (cdr (cdr zonas)))) (car (cdr (cdr (cdr (cdr zonas))))))
                                 (display "Directorio no valido")))))
;EJEMPLOS

;(crear_Workspace "hola.c" "nose" "a")
;(crear_Workspace)
;(crear_Workspace "hola.c")

;(es_Workspace '(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;(es_Workspace '(("WorkspaEce" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;(es_Workspace '(("Workspace" ()) ("InEEEEex" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))

;((agregar_Workspace "nuevo.c" "otro.c")'(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;((agregar_Workspace "nuevo.c")'(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;((agregar_Workspace "nuevo.c" "otro.c")'(("Workspace" ("hola.c")) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))