function [graph,complex,kMax]=getVRComplex(D,R,k)
tic
n=size(D,1);
graph=zeros(n,n);

%1) Get Edges
edges=zeros(0,2);   %????????????????????????zeros(0,0) to (0,2)
for v1=1:n-1
    for v2=(v1+1):n
        edge=[v1,v2];
        if (D(v1,v2)<=R)
            edges(end+1,:)=edge;     %??end+1??????????????????
            graph(v1,v2)=1;
            graph(v2,v1)=1;
        end
    end
end

%2) Build Higher Simplicies from edges (Using Fast Rips Implementation from Zomorodian).
[complex,kMax]=computeVRComplex(graph,k);
end