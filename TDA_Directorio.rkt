#lang racket
;TDA Directorio
(require "TDA_Workspace.rkt")
(require "TDA_Index.rkt")
(require "TDA_Local_Repository.rkt")
(require "TDA_Remote_Repository.rkt")
(require "TDA_Comandos.rkt")
(provide crear_Directorio es_Directorio comparar_contenido)

;FUNCION DE CONSTRUCCION
;Desc: Si el directorio ingresado no es valido crea un nuevo direcotorio
;Dom: Lista
;Rec: Lista 
(define crear_Directorio(lambda (zonas)
                          (if (es_Directorio zonas)
                              (display "Directorio bien implementado")
                              ( list (crear_Workspace) (crear_Index) (crear_Local_Repository) (crear_Remote_Repository) (crear_Comandos)))))
;FUNCION DE PERTENENCIA
;Desc: Entra un direcotirio y me devuelve un booleano si esta bien implementado
;Dom: Lista
;Rec: Booleano
(define es_Directorio(lambda (zonas)
                       (if (and (list? zonas) (not (null? zonas)))
                           (if (es_Workspace zonas)
                               (if (es_Index zonas)
                                   (if (es_Local_Repository zonas)
                                       (if (es_Remote_Repository zonas)
                                           (if (es_Comandos zonas)
                                               #t
                                               #f)
                                           #f)
                                       #f)
                                   #f)
                               #f)
                           #f)))
;FUNCION DE SELECTOR
;Desc: Entran 2 listas donde me retornara 1 con todos los archivos de ambas listas sin repetirse
;Dom: Lista X Lista
;Rec: Lista
;T. rec: Cola
(define comparar_contenido(lambda (lista1 lista2)
                            (if (null? lista2)
                                (append lista1 lista2)
                                (if (ormap (lambda (x) (equal? (car lista2) x))
                                           lista1)
                                    (comparar_contenido lista1 (cdr lista2))
                                    (comparar_contenido (append lista1 (list (car lista2))) (cdr lista2))))))

;EJEMPLOS

;(crear_Directorio '())
;(crear_Directorio 3)
;(crear_Directorio '(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))

;(es_Directorio '(("Workspace" ()) ("Index" ()) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos" ())))
;(es_Directorio 3)
;(es_Directorio '())

;(comparar_contenido '("HOLA" "2" "5") '("HOLA" "2" "5"))
;(comparar_contenido '("HOLA" "2" "5") '("HOLA" "2" "5" "3"))
;(comparar_contenido '("HOLA" "2" "5" "7") '("HOLA" "2" "5" "3"))


                   
