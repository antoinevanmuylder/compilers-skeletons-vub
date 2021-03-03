#lang racket

(require cpsc411/info-lib
	 cpsc411/graph-lib)

(define (TODO) (error "complete exercise"))

(define counter (TODO))
(define step (TODO))

(define (get) (TODO))

(define (increment) (TODO))

;; Parameterized Counter
(module+ test
  (require rackunit)

  (check-equal? (get) 0)
  (increment)
  (check-equal? (get) 1)
  (parameterize ([counter 100]
                 [step     10])
                 (check-equal? (get) 100)
                 (increment)
                 (check-equal? (get) 110)
                 (check-equal? (counter) 110)))

;; Info Needed
(module+ test
  (require cpsc411/info-lib)

  (check-equal? (info? '()) (TODO))
  (check-equal? (info? '((apples . 10))) (TODO))
  (check-equal? (info? '((apples 10))) (TODO))
  (check-equal? (info-ref (TODO) 'students) 120)

  (let ([data (TODO)])
    (check-true (info? data))
    (check-equal? (info-ref data 'compilers) 'thursday)
    (check-equal? (info-ref data 'hop) 'monday)
    (check-equal? (info-ref (TODO) 'hop) 'never)
    (check-false (info-ref (TODO) 'hop #f))))

;; Extract Vertices
(define example-graph
  (add-edge
    (add-edge 
      (add-edges (new-graph '(a b c d)) 'a '(b d))
      'b 'c)
      'c 'd))

(module+ test
  (require racket/dict
           cpsc411/graph-lib)

  (check-equal? ((TODO) example-graph) '(d c b a)))

;; Subgraphs
(define (subgraph? g1 g2) (TODO))

(module+ test
    (check-true (subgraph? (new-graph '(v)) (new-graph '(v))))
    (check-false (subgraph? (new-graph) (new-graph '(v))))
    (check-true (subgraph? (add-edge (new-graph '(v w)) 'v 'w)
                           (add-edges (new-graph '(v w x)) 'v '(w x)))))
(module+ test
    (define g1 (TODO))
    (define g2 (TODO))
    (check-true (subgraph? g1 g2)))

;; Outputting Graphs
(define (print-graph graph) (TODO))
