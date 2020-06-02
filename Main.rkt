#lang racket
(require "TDA_Directorio.rkt")
(require "TDA_Workspace.rkt")
(require "TDA_Index.rkt")
(require "TDA_Local_Repository.rkt")
(require "TDA_Remote_Repository.rkt")
(require "TDA_Comandos.rkt")

;Desc: Funcion push, que copia todos los commits del Local Repository al Remote Repository
;Dom: Lista
;Rec: Lista
(define push(lambda (zonas)
              (if (es_Directorio zonas)
                  (agregar_Remote_Repository zonas)
                  (display "Comando no valido"))))

;Desc: Funcion pull que fusiona todos los archivos de los commits hechos y los archivos del workpace, para entregar un workspace con todos los archivos.
;Dom: Lista
;Rec: Lista
;T. rec: Cola
(define pull(lambda (zonas)
              (if (es_Directorio zonas)
                  (if (null? (cdr (cdr (cdr (cdr (cdr zonas))))))
                      (pull (append (list  (car zonas) (car (cdr zonas)) (car (cdr (cdr zonas))) (car (cdr (cdr (cdr zonas)))) (car (cdr (cdr (cdr (cdr zonas)))))) (cdr(car (cdr (cdr (cdr zonas))))))) 
                      (if (null? (cdr (cdr (car (cdr (cdr (cdr zonas)))))))
                          (list  (list "Workspace" (comparar_contenido (car (cdr (car zonas))) (cdr (car (cdr(car (cdr (cdr (cdr zonas))))))))) (car (cdr zonas)) (car (cdr (cdr zonas))) (append (list "Remote_Repository") (cdr (cdr (cdr (cdr (cdr zonas)))))) (car (cdr (cdr (cdr (cdr zonas))))))
                          (pull (append (list  (list "Workspace" (comparar_contenido (car (cdr (car zonas))) (cdr (car (cdr(car (cdr (cdr (cdr zonas))))))))) (car (cdr zonas)) (car (cdr (cdr zonas))) (append (list "Remote_Repository") (cdr (cdr (car (cdr (cdr (cdr zonas))))))) (car (cdr (cdr (cdr (cdr zonas)))))) (cdr (cdr (cdr (cdr (cdr zonas)))))))))
                  (display "Comando no valido"))))

;Desc: Funcion add, que agrega una lista de archivos al index
;Dom: Lista X Lista
;Rec: Lista
(define add(lambda (lista_archivos_nuevos)
             (lambda (zonas)
               (if (es_Directorio zonas)
                  ((agregar_Index lista_archivos_nuevos) zonas)
                  (display "Comando no valido")))))

;Desc: Funcion que genera un commit con los archivos actuales del index y el comentario ingresado
;Dom: String x Lista
;Rec: Lista 
(define commit(lambda (comentario)
                (lambda (zonas)
                  (if (es_Directorio zonas)
                      (if (string? comentario)
                          ((agregar_Local_Repository comentario (car (cdr (car (cdr zonas)))))zonas)
                          (display "Comentario no valido"))
                      (display "Comando no valido")))))

;Desc: Funcion git que ejecuta todos los comandos (add, push, commit, pull)
;Dom: Funcion X (Lista o String) X Lista
;Rec: Lista
(define git (lambda (comando)
              (lambda (variable)
                (cond
                  [(es_Directorio variable)
                   (comando variable)]
                  [(string? variable)
                   (lambda (variable2)
                            ((comando variable)variable2))]
                  [(number? variable)
                   (display "Comando no valido")]
                  [else (lambda (variable2)
                          (((comando variable)variable2)))]))))

;EJEMPLOS

;(push '(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ("tercer commit" "222.c")) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))
;(push '(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ()) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))
;(push '(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c")) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))

;(pull '(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ("tercer commit" "222.c")) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))
;(pull '(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ()) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))
;(pull '(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c")) ("Local_Repository" ()) ("Remote_Repository" ()) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))

;((add (list "hola.c" "nuevo.c" "racket.rkt"))'(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ("tercer commit" "222.c")) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))
;((add '())'(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ("tercer commit" "222.c")) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))
;((add (list "hola.c" "nuevo.c" "racket.rkt"))'(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ()) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ("tercer commit" "222.c")) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))

;((commit "holas comentario 3")'(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c" "2")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ("tercer commit" "222.c")) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))
;((commit "holas comentario 3")'(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ()) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ("tercer commit" "222.c")) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))
;((commit "holas comentario 3")'(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("archivoUnico.txt")) ("Local_Repository" ()) ("Remote_Repository" ("tercer commit" "222.c")) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))

;((git push)'(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c" "2")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ("tercer commit" "222.c")) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))
;((git pull)'(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c" "2")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ("tercer commit" "222.c")) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))
;(((git commit)"comentario")'(("Workspace" ("ola.c" "ss.c" "archi.srt")) ("Index" ("cambio.ts" "ss.c" "2")) ("Local_Repository" ("Primer commit" "hola.c") ("segundo commit" "hola.c" "ss.c")) ("Remote_Repository" ("tercer commit" "222.c")) ("Comandos"  ("12/25/2020" "Push") ("12/25/2020" "Commit"))))
