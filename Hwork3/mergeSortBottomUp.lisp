(defun make-sorted-pairs (lst)
  "partitions the list into sorted pairs."
  (cond ((null lst) '())
        ((null (cdr lst)) (list (list (car lst))))
        (t (cons (sort (list (car lst) (cadr lst)) #'<)
                 (make-sorted-pairs (cddr lst))))))

(defun merge-lists (lst1 lst2)
  "merges two sorted lists into a single sorted list"
  (cond ((null lst1) lst2)
        ((null lst2) lst1)
        ((<= (car lst1) (car lst2)) (cons (car lst1) (merge-lists (cdr lst1) lst2)))
        (t (cons (car lst2) (merge-lists lst1 (cdr lst2))))))

(defun merge-pass (lst)
  "merges adjacent lists in one pass."
  (cond ((null lst) '())
        ((null (cdr lst)) lst)
        (t (cons (merge-lists (car lst) (cadr lst))
                 (merge-pass (cddr lst))))))

(defun bottom-up-mergesort (lst)
  "sorts a list using bottom-up Mergesort."
  (let ((sorted-pairs (make-sorted-pairs lst)))
    (labels ((iter (lst)
               (if (null (cdr lst))
                   (car lst)
                   (iter (merge-pass lst)))))
      (iter sorted-pairs))))

;; example array:
(write "Input string:")
(print '(1 7 2 1 8 6 5 3 7 9 4))
(write-line "")
(write "Output srting:")
(print (bottom-up-mergesort '(1 7 2 1 8 6 5 3 7 9 4)))
(write-line "")
