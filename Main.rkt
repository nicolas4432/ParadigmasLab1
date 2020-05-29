#lang racket
(require "TDA_Directorio.rkt")
(require "TDA_Workspace.rkt")
(require "TDA_Index.rkt")
(require "TDA_Local_Repository.rkt")
(require "TDA_Remote_Repository.rkt")
(require "TDA_Comandos.rkt")


(define zonas '(("Workspace" ("hola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ()) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))


;((agregar_Local_Repository "este es mi commit" (car (cdr (car (cdr zonas)))))zonas)
;((((git agregar_Local_Repository)"comentario")zonas)(list 5 7 8 9 5))

(define git (lambda (comando)
              (lambda (variable1)
                (if (es_Directorio variable1)
                    #t
                    (if (string? variable1)
                        (lambda (variable2)
                          (lambda (variable3)
                            ((comando variable1 variable3)variable2)))
                        #f)))))
