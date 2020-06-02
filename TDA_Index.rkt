#lang racket
;TDA Index
(provide crear_Index es_Index agregar_Index)

;FUNCION DE CONSTRUCCION
;Desc: Si la lista de Index no a sido creada, la funcion inicia la lista con el primer una lista de archivos
;Dom: Lista
;Rec: Lista
(define crear_Index(lambda lista
                         (list "Index" 
                               lista)))
;FUNCION DE PERTENENCIA
;Desc: Funcion que me entrega un booleano si esta bien o no la zona de index dentro de mi directorio
;Dom: Lista
;Rec: Booleano
(define es_Index(lambda (zonas)
                      (if (equal? "Index" (car (car (cdr zonas))))
                          #t
                          #f)))
;FUNCION DE MODIFICACION
;Desc: Funcion que modifica mi zona actual de index para añadir mas archivos
;Dom: Lista
;Rec: Lista
(define agregar_Index(lambda (archivos)
                           (lambda (zonas)
                             (if (es_Index zonas)
                                 (list  (car zonas) (list "Index" (append archivos (car (cdr (car (cdr zonas)))))) (car (cdr (cdr zonas))) (car (cdr (cdr (cdr zonas)))) (car (cdr (cdr (cdr (cdr zonas))))))
                                 (display "Index no valido")))))
;EJEMPLOS

;(crear_Index "hola.c" "nose" "a")
;(crear_Index)
;(crear_Index "hola.c")

;(es_Index '(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;(es_Index '(("Workspace" ()) ("InSdex" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;(es_Index '(("WorkspWace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))

;((agregar_Index '("nuevo.c" "otro.c"))'(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;((agregar_Index '("nuevo.c" "otro.c"))'(("Workspace" ()) ("Index" ("nuevo.c" "otro.c")) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;((agregar_Index '("blabla.c"))'(("Workspace" ()) ("Index" ("nuevo.c" "otro.c")) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))