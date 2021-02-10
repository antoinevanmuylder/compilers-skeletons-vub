#lang racket

(require rackunit)

(provide
   (all-defined-out))

;; 2.1 Hello world
;; ...

;; 2.2 Pattern matching
;; ...

;; ex2.3
;; Write an interpreter for bnf1
;; exp ::= int | + exp exp | - exp exp


(module+ test
  (check-eq? (eval 1) 1)
  (check-eq? (eval '(+ 1 2)) 3)
  (check-eq? (eval '(+ 10 (* 5 2))) 20))

;; ex2.4
;; Define a simple stack machine that understands the instructions: plus, times, push x
;; Then write a procedure execute that takes a list of instructions and a stack
;; and executes the instructions one by one for the stack.
;; Example:
;; - Instructions: '((push 1) (push 2) plus)
;; - Initial stack: '()
;; - Result: 3

(module+ test
  (check-eq? (exec   '( (push 1) )   empty   )   1)
  (check-eq? (exec '(plus) '(1 2)) 3)
  (check-eq? (exec '((push 1) (push 2) plus) '()) 3)
  (check-eq? (exec '((push 1) (push 2) (push 3) plus times) '()) 5))


;; ex2.5
;; Define a checker for your stack machine language.
;; The checker should return the given instructions if they are all valid and
;; raise an error otherwise.

(module+ test
  (define (check-stack-lang? instrs)
    (check-equal? (check-stack-lang instrs) instrs))

  (check-stack-lang? '(plus))
  (check-stack-lang? '(times))
  (check-stack-lang? '((push 1)))
  (check-stack-lang? '((push 1) (push 2) plus))
  (check-stack-lang? '(times plus times)))

;; ex2.6
;; Write a procedure ~compile~ that compiles bnf1 
;; to your stack machine language.

(module+ test
  (check-equal? (compile '1) '((push 1)))
  (check-equal? (compile '(+ 1 2)) '((push 1) (push 2) plus))
  (check-equal? (compile '(* 1 2)) '((push 1) (push 2) times))
  (check-equal? (compile '(+ (+ 1 2) (* 5 4))) '((push 1) (push 2) plus
						 (push 5) (push 4) times
						 plus)))

(module+ test
  (define (check-eval-compile? expr expected)
    (let ([res (eval expr)])
      (check-equal? res expected)
      (check-equal? (exec (compile expr) '()) res)))

  (check-eval-compile? '1 1)
  (check-eval-compile? '(+ 1 2) 3)
  (check-eval-compile? '(+ (+ 1 2) (* 5 4)) 23)
  (check-eval-compile? '(* (+ 10 (+ 9 8)) (+ 10 (* 9 8))) 2214))
