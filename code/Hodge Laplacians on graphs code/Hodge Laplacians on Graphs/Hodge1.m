%Hodge 1-Laplacian.
%input:complex as a cell.
%output: eigenvalue, eignefunction and boundary matrix.
function [eigenvalue,eigenfunction,boundary]=Hodge1(complex,k) %k: order of simplex; for Hodge-1: k=3
addpath('AnalyzeComplex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Algorithm %%%%%%%%%%%%%%%%%%%%%%%%%%%%
boundary=ComputeBoundaryMatricies(complex,k);
%set(0,'RecursionLimit',1500)
A=boundary{1,2};
B=boundary{1,3};
%C=A'*A+B*B';
[E,D]=eig(A'*A+B*B');
eigenvalue=D;
eigenfunction=E;
end