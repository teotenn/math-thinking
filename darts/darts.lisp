;(in-package :teoten.maths)

(defun throw-dart ()
  "Simulates the randon throw of a dart. It can land anywhere in the square"
  (let ((x 0) 
	(y 0)
	(a 2))
    (list (* (+ -1 (* 2 (random 0.9999))) (+ x (/ a 2)))
	  (* (+ -1 (* 2 (random 0.9999))) (+ y (/ a 2))))))

(defun is-within-circle (x y)
  "Given the landing coordinates, determines if it fell inside the circle"
  (let ((a 2)
	(distance-from-center (sqrt (+ (expt x 2) (expt y 2)))))
    (if (< distance-from-center (/ a 2))
	T
	NIL)))

(defun compute-pi (n-throws)
  "Computes pi by throwing a bunch of darts at the square"
  (let* ((count-inside-circle 0)) ; LET* performs the bindings sequentially
    (dotimes (i n-throws)
      (let ((r (throw-dart)))
	(if (is-within-circle (first r) (second r))
	    (incf count-inside-circle))))
    (* 4.0 (/ count-inside-circle n-throws))))
