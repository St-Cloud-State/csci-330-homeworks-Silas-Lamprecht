(defun partition (lst)
  "splits a list into two nearly equal halves"
  (if (or (null lst) (null (cdr lst)))
      (values lst '())
      (multiple-value-bind (left right) (partition (cddr lst))
        (values (cons (car lst) left) (cons (cadr lst) right)))))

(defun merge-lists (lst1 lst2)
  "merges two sorted lists into a single sorted list"
  (cond ((null lst1) lst2)
        ((null lst2) lst1)
        ((<= (car lst1) (car lst2)) (cons (car lst1) (merge-lists (cdr lst1) lst2)))
        (t (cons (car lst2) (merge-lists lst1 (cdr lst2))))))

(defun mergesort (lst)
  "sorts a list using the Mergesort"
  (if (or (null lst) (null (cdr lst)))  ; Base case: empty or single-element list
      lst
      (multiple-value-bind (left right) (partition lst)
        (merge-lists (mergesort left) (mergesort right)))))

;; example list:
(write "Input string:")
(print '(3 1 4 1 5 9 2 6 5 3 5))
(write-line "")
(write "Output srting:")
(print (mergesort '(3 1 4 1 5 9 2 6 5 3 5)))
(write-line "")
