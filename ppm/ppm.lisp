(in-package :teoten.maths)

(defun proportion-to-unit (units x)
  "Convert proportion of a unit, unto full unit (i.e. mg to g)"
  (cond ((= (length units) 1) x)
	((is-prop units "m")(multiply-list x 1e-3))
	((is-prop units "c")(multiply-list x 1e-2))
	((is-prop units "d")(multiply-list x 1e-1))
	((is-prop units "u")(multiply-list x 1e-6))
	((is-prop units "n")(multiply-list x 1e-9))
	((is-prop units "K")(multiply-list x 1e3))
	(T (error "Proportion of unit not covered"))))

(defun unit-to-proportion (units x)
  "Convert a unit unto its proportion (i.e. cm to Km)"
  (cond ((= (length units) 1) x)
	((is-prop units "m")(multiply-list x 1e3))
	((is-prop units  "c")(multiply-list x 1e2))
	((is-prop units "d")(multiply-list x 10))
	((is-prop units "u")(multiply-list x 1e6))
	((is-prop units "K")(multiply-list x 1e-3))
	((is-prop units "n")(multiply-list x 1e9))
	(T (error "Proportion of unit not covered"))))
;; This 2 functions were defined first in the form:
;; (defun unit-to-proportion (units &rest x) body...)
;; Where if wished to be applied on a list:
;; (apply #'unit-to-proportion "cm" '(12 134.0 1323.2))
;; However the present form might be better for dealing with lists

(defun multiply-list (lst n)
  "Multiply elements of a list for a single value"
  (mapcar #'(lambda (x) (* x n))
	  lst))

(defun is-prop (unit symbol)
  "T/NILL if a unit (i.e. mg) matches the symbol of the proportion (i.e. m)"
  (string= (subseq (string unit) 0 1) symbol))

(defun is-unit (unit symbol)
  "T/NILL if a unit (i.e. mg) matches the symbol of the unit (i.e. gram)"
  (if (= (length unit) 1) (string= unit symbol)
      (string= (subseq (string unit) 1 2) symbol)))

(defun ppm (solid solution concentration
	    &key
	      (solid-u "g")
	      (solution-u "ml")
	      (concentration-u "mg")
	      (result-element "mg")
	      (result-sample "Kg")
	      (mol nil))
  "Returns ppm (mg/Kg), ppb (ug/Kg) or as desired"
  (let* ((concentration (if mol (multiply-list concentration mol)
			   concentration))
	(proportion (mapcar #'/
			    (proportion-to-unit solid-u solid)
			    (proportion-to-unit solution-u solution)))
	(concentration-g (proportion-to-unit concentration-u
					     concentration)))
    (mapcar #'/
	    (unit-to-proportion result-element concentration-g)
	    (unit-to-proportion result-sample proportion))))

