(in-package :cl-user)

(defpackage :teoten.maths
  (:use :common-lisp :cl-ana.plotting)
  (:export :multiply-list
	   :is-prop
	   :is-unit
	   :unit-to-proportion
	   :proportion-to-unit
	   :ppm
	   :throw-dart
	   :walk
	   :draw-walk))
