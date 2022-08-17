clear; 
clc;

A = labeled_dense_matrix({'A','B'},{'A','B'},zeros(2)); 

fprintf(print(A));

A.set_entry('B', 'B', -2.0); 
A.set_entry('A', 'C', 57.0); 

fprintf(print(A));
