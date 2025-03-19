
(defun parse-I (str)
(cond ((eql (car str) 'i) (parse-EG (cdr str)))
      (t (write-line "Invaild - I"))
)
)
(defun parse-EG (str)
(cond ((or 
(eql (car str) 'x) 
(eql (car str) 'y) 
(eql (car str) 'z) 
(eql (car str) 'w)) 
(parse-EP (cdr str)))
(t (write-line "Invaild - EG"))
)
)

(defun parse-EP (str)

(
    cond(
        (eql (car str) 'o) 
        (parse-EG (cdr str)))
        (t (cond((and (eql (car str) 's) (not(eql (cdr str) nil)))
        (write-line "Invaild - EP"))
        (t(cond((eql (car str) 's)(write-line "valid"))(t(parse-S str))))))
        
)
)



(defun parse-S (str)
(
    cond(
        (eql (car str) 'd)
        (parse-L (cdr str))
    )
    (t (cond((eql (car str) 'b) 
        (parse-A (cdr str))
        )
        (t(cond((eql (car str) 's)(write-line "Valid"))
        (t (cond((eql (car str) nil) 
        (write-line "Valid")
        )
        (t (write-line "Invalid - S"))
        ))))
        )
    )
    
)
)

(defun parse-L (str)
(
    cond(
        (eql (car str) 's)
        (parse-L (cdr str))
        
    )
    (t (cond((eql (car str) 'b)
        (parse-S str))
        (t (write-line "Invalid - L"))
        ))
)
)

(defun parse-A (str)
(
    cond(
        (eql str nil) 
        (write-line "Valid")
    )
    (t (cond((eql (car str) 'e)
        (parse-S (cdr str)))
        (t (write-line "Invaild"))
        ))
)
)
(write-line "Valid strings:")
(write-line "i x o y d s s b e d s b")
(parse-I '(i x o y d s s b e d s b))

(write-line "i x o y d s s b")
(parse-I '(i x o y d s s b))

(write-line "i w o w d s b")
(parse-I '(i w o w d s b))

(write-line "i x o y d s s s b")
(parse-I '(i x o z d s s s b))

(write-line "i x o y s")
(parse-I '(i x o y s))

(write-line "i x o y d s s b e s")
(parse-I '(i x o y d s s b e s))

(write-line "i y o y s")
(parse-I '(i y o y s))

(write-line "invalid strings:")

(write-line "i x o d d s s b e d s b")
(parse-I '(i x o d d s s b e d s b))

(write-line "i x y y d s s b")
(parse-I '(i x y y d s s b))

(write-line "i w o d s b")
(parse-I '(i w o d s b))

(write-line "i x o y d z b")
(parse-I '(i x o z d z b))

(write-line "i x o y z")
(parse-I '(i x o y z))

(write-line "i x o y d s s e s")
(parse-I '(i x o y d s s e s))

(write-line "i y o y y")
(parse-I '(i y o y y))