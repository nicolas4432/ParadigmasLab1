#lang racket

(require "myAppendDiurno.rkt")

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



(define crear_Index(lambda lista
                         (list "Index" 
                               lista)))
; (crear_Index "hola.c" "nose" "a")

(define es_Index(lambda (zonas)
                      (if (equal? "Index" (car (car (cdr zonas))))
                          #t
                          #f)))
; (es_Index zonas)


(define agregar_Index(lambda archivos
                           (lambda (zonas)
                             (if (es_Index zonas)
                                 (list  (car zonas) (list "Index" (append archivos (car (cdr (car (cdr zonas)))))) (car (cdr (cdr zonas))) (car (cdr (cdr (cdr zonas)))) (car (cdr (cdr (cdr (cdr zonas))))))
                                 (display "Index no valido")))))
; ((agregar_Index "nuevo.c" "otro.c")zonas)



(define crear_Local_Repository(lambda lista
                         (list "Local_Repository" 
                               lista)))
; (crear_Local_Repository "Primer commit" "hola.c")

(define es_Local_Repository(lambda (zonas)
                      (if (equal? "Local_Repository" (car (car (cdr (cdr zonas)))))
                          #t
                          #f)))
; (es_Local_Repository zonas)


(define agregar_Local_Repository(lambda (commit lista)
                           (lambda (zonas)
                             (if (es_Index zonas)
                                 (list  (car zonas) (crear_Index) (append (list "Local_Repository") (list (append (list commit) lista)) (cdr (car (cdr (cdr zonas))))) (car (cdr (cdr (cdr zonas)))) (car (cdr (cdr (cdr (cdr zonas))))))
                                 (display "Local_Repository no valido")))))
; ((agregar_Local_Repository "este es mi commit" (car (cdr (car (cdr zonas)))))zonas)



;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


(define crear_Remote_Repository(lambda lista
                         (list "Remote_Repository" 
                               lista)))
; (crear_Remote_Repository "Primer commit" "hola.c")

(define es_Remote_Repository(lambda (zonas)
                      (if (equal? "Remote_Repository" (car (car (cdr (cdr (cdr zonas))))))
                          #t
                          #f)))
; (es_Remote_Repository zonas)


(define agregar_Remote_Repository(lambda (zonas)
                             (if (es_Index zonas)
                                 (list  (car zonas) (car (cdr zonas)) (car (cdr (cdr zonas))) (append (list "Remote_Repository") (cdr (car (cdr (cdr zonas))))) (car (cdr (cdr (cdr (cdr zonas))))))
                                 (display "Remote_Repository no valido"))))

; (agregar_Remote_Repository zonas)




(define crear_Comandos(lambda lista
                         (list "Comandos" 
                               lista)))
; (crear_Comandos "HORA" "FECHA" "COMANDO")

(define es_Comandos(lambda (zonas)
                      (if (equal? "Comandos" (car (car (cdr (cdr (cdr (cdr zonas)))))))
                          #t
                          #f)))
; (es_Comandos zonas)




                     
