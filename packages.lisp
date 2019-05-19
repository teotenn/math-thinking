;;; Files defining a package MUST start with the cl package
(in-package :cl-user)

;;; Then we can define our package for this work
(defpackage :teoten.maths
  (:use :common-lisp)
  (:export :multiply-list
	   :is-prop
	   :is-unit
	   :unit-to-proportion
	   :proportion-to-unit
	   :ppm))
