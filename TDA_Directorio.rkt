#lang racket

(require "TDA_Workspace.rkt")
(require "TDA_Index.rkt")
(require "TDA_Local_Repository.rkt")
(require "TDA_Remote_Repository.rkt")
(require "TDA_Comandos.rkt")
(provide crear_Directorio es_Directorio)


(define zonas '(("Workspace" ("hola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ()) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))
;para llegar a la zona de workspace (car zonas)
;para llegar a "Workpace" (car (car zonas))   (car +
;para legar a la lista de workspace (car (cdr (car zonas)))  (cdr (car (cdr +

;para llegar a la zona de index (car (cdr zonas))
;para llegar a "index" (car (car (cdr zonas)))
;para legar a la lista de index (car (cdr (car (cdr zonas))))

;para llegar a la zona del local repository (car (cdr (cdr zonas)))
;para llegar a "local_repositori" (car (car (cdr (cdr zonas))))
;para llegar a la lista de commit de local repositori (cdr (car (cdr (cdr zonas))))

;para llegar a la zona de remote repositori (car (cdr (cdr (cdr zonas))))
;para llegar a "remoter_repositori" (car (car (cdr (cdr (cdr zonas)))))
;para llegar a la lista de commit de remote (cdr(car (cdr (cdr (cdr zonas)))))

;para llegar a la zona de comandos (car (cdr (cdr (cdr (cdr zonas)))))
;para llegar a "caomandos" (car (car (cdr (cdr (cdr (cdr zonas))))))
;para llegar a lista de comandos comandos (cdr (car (cdr (cdr (cdr (cdr zonas))))))



(define crear_Directorio( list (crear_Workspace) (crear_Index) (crear_Local_Repository) (crear_Remote_Repository) (crear_Comandos)))

;(crear_Directorio)

(define es_Directorio(lambda (zonas)
                       (if (list? zonas)
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
; (es_Directorio zonas)



                   
