(in-package :teoten.maths)
(require 'cl-ana.plotting)

(defun walk (n)
  "Simulates a random walking event"
  (let* ((x (make-list n :initial-element 0))
	 (y (make-list n :initial-element 0)))
    (loop
       for i from 1 below n
       for random-4 = (random 4)
       if (= 0 random-4)
       do (setf (nth i y)(+ (nth (- i 1) y) 1)) ; y+1
       and do (setf (nth i x)(nth (- i 1) x)) ; x
       else if (= 1 random-4)
       do (setf (nth i y)(- (nth (- i 1) y) 1)) ; y-1
       and do (setf (nth i x)(nth (- i 1) x)) ; x
       else if (= 2 random-4)
       do (setf (nth i y)(nth (- i 1) y)) ; y
       and do (setf (nth i x)(+ (nth (- i 1) x) 1)) ; x+1
       else
       do (setf (nth i y)(nth (- i 1) y)) ; y
       and do (setf (nth i x)(- (nth (- i 1) x) 1))) ; x-1
    (mapcar #'cons x y)))

(defun draw-walk (n)
  "Plots a random walking event"
  (draw (walk n)
	:page-args
	(list :terminal (wxt-term))))
