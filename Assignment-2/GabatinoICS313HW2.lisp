;;; Compose function
(defun compose (f1 f2)
  (lambda (x) (funcall f1 (funcall f2 x))))

;;; Map function
(defun my-map (f lst)
  (cond ((null lst) NIL)
        ((atom lst) (funcall f lst))
        (T (cons (funcall f (car lst))
                 (my-map f (cdr lst))))))

;;; Reduce function
(defun my-reduce (f lst)
  (cond ((null lst) (error "Empty list"))
        ((null (cdr lst)) (car lst))
        (T (funcall f (car lst) (my-reduce f (cdr lst))))))

;;; Map-reduce function
(defun my-map-reduce (f1 f2 lst)
  (let ((mapped (my-map f1 lst)))
    (if mapped (my-reduce f2 mapped)
        (error "Empty list"))))

;;; Compose2 function
(defun compose2 (f1 f2)
  (lambda (x y) (funcall f1 (funcall f2 x y))))

;;; Dot product function
(defun dot-product (l1 l2)
  (cond ((null l1) 0)
        ((null l2) (error "List length mismatch"))
        (T (+ (* (car l1) (car l2))
              (dot-product (cdr l1) (cdr l2))))))

;;; Map2 function
(defun my-map2 (f lst1 lst2)
  (cond ((null lst1) NIL)
        ((atom lst1) (funcall f lst1 lst2))
        ((atom lst2) (funcall f lst1 lst2))
        (T (cons (funcall f (car lst1) (car lst2))
                 (my-map2 f (cdr lst1) (cdr lst2))))))

;;; Map2-reduce function
(defun my-map2-reduce (f1 f2 lst1 lst2)
  (let ((mapped (my-map2 f1 lst1 lst2)))
    (if mapped (my-reduce f2 mapped)
        (error "Empty list"))))

;;; Copy-without-nils function
(defun copy-without-nils (lst)
  (cond ((null lst) NIL)
        ((null (car lst)) (copy-without-nils (cdr lst)))
        ((atom (car lst)) (cons (car lst) (copy-without-nils (cdr lst))))
        (T (cons (copy-without-nils (car lst))
                 (copy-without-nils (cdr lst))))))

;;; Sort function
(defun my-sort (lst)
  (labels ((quicksort (lst)
             (cond ((null lst) NIL)
                   (T (let ((pivot (first lst)))
                        (append (quicksort (remove-if-not (lambda (x) (< x pivot)) lst))
                                (remove pivot (quicksort (remove-if-not (lambda (x) (>= x pivot)) lst)))
                                ))))))
    (quicksort lst)))

;;; Sample usage
(defun sample-usage ()
  (let ((lst1 '(1 2 3))
        (lst2 '(4 5 6)))
    (format t "Map-reduce: ~a~%" (my-map-reduce (lambda (x) (+ x 1)) #'+ lst1))
    (format t "Map2: ~a~%" (my-map2 #'* lst1 lst2))
    (format t "Map2-reduce: ~a~%" (my-map2-reduce #'* #'+ lst
