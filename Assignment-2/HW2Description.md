# Homework 2

**3.1 my-map-reduce**

Create a my-map-reduce function which maps a single-parameter function to every element of a linked list, then reduces the resulting list using a two-parameter function. For example,
(my-map-reduce (lambda (x) (+ x 1)) #'+ '(1 2 3)) ==> 9
For this assignment, you must implement my-map-reduce by using compose (defined above) to combine my-reduce with my-map. To be clear,
	•	the first argument to my-map-reduce is the function to be used with my-map, the second argument is the function to be used with my-reduce
	•	my-map processes the list first, and my-reduce reduces the result of the call to my-map (this is the normal sequence of map-reduce).
Summary: write the code of the my-map-reduce function which takes two functions (one with a single parameter, the other a binary operator) along with a list, and returns a single value.

**3.2 Dot product with my-map-reduce**

The inner product or dot product of two vectors (a1 a2 ... an) and (b1 b2 ... bn) is the sum of the products of the paired elements, so a1*b1 + a2*b2 + ... + an*bn. Since this is lisp, we are representing the two vectors as lists of numbers that can be used with my-map-reduce.
The dot product can be easily expressed as a map-reduce problem. Implement a function dot-product of two arguments (the two lists). You first must implement a compose2 and a my-map2 functions that take two list parameters instead of one, and then you must implement the corresponding my-map2-reduce function using compose2 and my-map2.
So for example,
(my-map2 #'* '(1 2 3) '(4 5 6)) ==> (4 10 18)
(my-map2-reduce #'* #'+ '(1 2 3) '(4 5 6)) ==> 32
There is no need to worry about the case where the list parameters to my-map2 have different lengths.
Summary: use the my-map-reduce from step 1 to write the inner-product of two vectors.