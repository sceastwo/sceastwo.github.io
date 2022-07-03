clear;
clc;
format long;

A(1).x = 5;
A(1).foo = '56';


A(2).x = 7;
A(2).foo = '12';


B(1).p = 3;
B(2).q = 4;

C(45).foo = 3;
for i = 1:45
    C(i).foo = i;
end

D(3,4).boo = 't';

E(2,3).boo = [6 8 0];

