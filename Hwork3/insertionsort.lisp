(defun insert-sorted (item sorted)
  (if (or (null sorted) (< item (car sorted)))
      (cons item sorted)  ; insert at the beginning
      (append (butlast sorted)  ; take all but last elements
              (list (if (< item (car (last sorted))) item (car (last sorted))))  ; choose last element
              (if (< item (car (last sorted))) (last sorted) (list item)))))  ; make sure list has correct order

(defun insertion-sort (lst)
  "sorts a list using insertion sort"
  (if (null lst)
      '() 
      (insert-sorted (car lst) (insertion-sort (cdr lst)))))  


;; example array:
(write "Input string:")
(print '(8 3 8 1 2 7 4 6))
(write-line "")
(write "Output srting:")
(print(insertion-sort '(8 3 8 1 2 7 4 6)))
(write-line "")