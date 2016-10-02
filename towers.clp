; Goal: to move 3 disks from Left to Right peg (using Center peg as temporary storage)
(deffacts disks-and-towers 
  (goal 3 Left Right Center)
)

; move one disks directly from peg ?from to peg ?to
(defrule one-disk
  ?old-goals <- (goal 1 ?from ?to ?)
  =>
  (retract ?old-goals)
  (printout t "move top disk from " ?from " to " ?to crlf)
)

; move ?number disks from peg ?from to peg ?to using peg ?spare as a temporary storage
(defrule multiple-disks
  ?old-goals <- (goal ?number ?from ?to ?spare)
  (test (>= ?number 2))
  =>
  (retract ?old-goals)
  (assert (goal =(- ?number 1) ?spare ?to ?from))
  (assert (goal 1 ?from ?to ?spare))
  (assert (goal =(- ?number 1) ?from ?spare ?to))
)
