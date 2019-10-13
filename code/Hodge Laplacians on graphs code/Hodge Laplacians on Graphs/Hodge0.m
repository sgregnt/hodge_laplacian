%Hodge 0-Laplacian.
%input:complex as a cell.
%output: eigenvalue, eignefunction and boundary matrix.
function [eigenvalue,eigenfunction]=Hodge0(complex,k) %k: order of simplex
addpath('AnalyzeComplex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Algorithm %%%%%%%%%%%%%%%%%%%%%%%%%%%%
boundary=ComputeBoundaryMatricies(complex,k);
%set(0,'RecursionLimit',1500)
A=boundary{1,2};
[E,D]=eig(A*A');
eigenvalue=D;
eigenfunction=E;
end