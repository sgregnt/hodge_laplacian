%persistence Hodge 1-Laplacian
%input:data point cloud "data", persistence parameters "R" (as array) , dimension of the
%simplicial complex "k"
%output: eigenvalue cell "eigenvalue"(for every value r in R, there is an eigenvalue diag matrix corresponding to r.)
%boundary matricies cell "BoundaryMatricies"(including three boundary matricies for every persistence parameter)
function [eigenvalue,BoundaryMatricies]=TDAVRHodgeL1(data,R,k,plotornot) %k: order of simplex; data: data point cloud; R: persistence parameter
n=size(R,2);  %n: number of R's values
eigenvalue=cell(1,n);
BoundaryMatricies=cell(1,n);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Algorithm %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for j=1:n
        j  %indicate which persistence parameter
        boundaryMatricies=getVRboundaryMatricies(data,k,R(j),plotornot);
        A=boundaryMatricies{1,2};
        B=boundaryMatricies{1,3}; % B matrix maybe not available when persistence parameter r is small
        [~,eigenvalue{j}]=eig(A'*A+B*B');
        BoundaryMatricies{j}=boundaryMatricies;
    end
end