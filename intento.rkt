#lang racket
(require "TDA_Directorio.rkt")
(require "TDA_Workspace.rkt")
(require "TDA_Index.rkt")
(require "TDA_Local_Repository.rkt")
(require "TDA_Remote_Repository.rkt")
(require "TDA_Comandos.rkt")

;Desc:
;Dom: 
;Rec:
;T. rec:

(define zonas '(("Workspace" ("ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c" "2")) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))


(define comparar_contenido2(lambda (lista1 lista2)
                            (if (null? lista2)
                                (append lista1 lista2)
                                (if (null? lista1)
                                    (append lista1 (car lista2))
                                    (if (equal? (car lista1) (car lista2))
                                        (comparar_contenido (cdr lista1) (cdr lista2))
                                        (comparar_contenido (cdr lista1) lista2))))))
;recursion de cola
(define comparar_contenido(lambda (lista1 lista2)
                            (if (null? lista2)
                                (append lista1 lista2)
                                (if (ormap (lambda (x) (equal? (car lista2) x))
                                           lista1)
                                    (comparar_contenido lista1 (cdr lista2))
                                    (comparar_contenido (append lista1 (list (car lista2))) (cdr lista2))))))
                                
;(comparar_contenido lista1 lista2)

;(cdr (cdr (cdr (cdr (cdr zonas))))) 
(define pull2(lambda (zonas)
              (if (es_Directorio zonas)
                  (if (null? (cdr (cdr (car (cdr (cdr (cdr zonas)))))))
                      (list  (list "Workspace" (comparar_contenido (car (cdr (car zonas))) (cdr (car (cdr(car (cdr (cdr (cdr zonas))))))))) (car (cdr zonas)) (car (cdr (cdr zonas))) (append (list "Remote_Repository") (cdr (car (cdr (cdr zonas))))) (car (cdr (cdr (cdr (cdr zonas))))))
                      (pull (list  (list "Workspace" (comparar_contenido (car (cdr (car zonas))) (cdr (car (cdr(car (cdr (cdr (cdr zonas))))))))) (car (cdr zonas)) (car (cdr (cdr zonas))) (append (list "Remote_Repository") (cdr (cdr (car (cdr (cdr (cdr zonas))))))) (car (cdr (cdr (cdr (cdr zonas))))))))
                  (display "Comando no valido"))))


(define pull(lambda (zonas)
              (if (es_Directorio zonas)
                  (if (null? (cdr (cdr (cdr (cdr (cdr zonas))))))
                      (pull (list  (car zonas) (car (cdr zonas)) (car (cdr (cdr zonas))) (car (cdr (cdr (cdr zonas)))) (car (cdr (cdr (cdr (cdr zonas))))) (cdr(car (cdr (cdr (cdr zonas))))))) 
                      (if (null? (cdr (cdr (car (cdr (cdr (cdr zonas)))))))
                          (list  (list "Workspace" (comparar_contenido (car (cdr (car zonas))) (cdr (car (cdr(car (cdr (cdr (cdr zonas))))))))) (car (cdr zonas)) (car (cdr (cdr zonas))) (append (list "Remote_Repository") (cdr (cdr (cdr (cdr (cdr zonas)))))) (car (cdr (cdr (cdr (cdr zonas))))))
                          (pull (list  (list "Workspace" (comparar_contenido (car (cdr (car zonas))) (cdr (car (cdr(car (cdr (cdr (cdr zonas))))))))) (car (cdr zonas)) (car (cdr (cdr zonas))) (append (list "Remote_Repository") (cdr (cdr (car (cdr (cdr (cdr zonas))))))) (car (cdr (cdr (cdr (cdr zonas)))))))))
                  (display "Comando no valido"))))





(define lista1 (list "hola.c" "ss.c" "archi.srt"))
(define lista2 (list "ss.c" "2" "cambio.ts"))


;( ormap ( lambda ( x ) ( and ( real ? x ) ( positive ? x ) ) )
;        ( list " Sólo complejos :" -1+1 i 0+8 i ( sqrt -4) -9 -5 i ) )

;(ormap (lambda (x) (equal? "hola.c" x))
;       '("hola.c" "ss.c" "archi.srt"))

(define archivos_commit(lambda (lista_Archivos)
                         (lambda (lista)
                           (if (null? (cdr lista_Archivos))
                               (append lista (cdr (car lista_Archivos)))
                               ((archivos_commit (cdr lista_Archivos))(append lista (cdr (car lista_Archivos))))))))

;((archivos_commit (cdr (car (cdr (cdr zonas)))))'())
                         
;(comparar_contenido (car (cdr (car zonas))) ((archivos_commit (cdr (car (cdr (cdr zonas)))))'()))
                                