function VRboundaryMatricies=getVRboundaryMatricies(data,simplexDimension,R,plotOn)
dim=size(data,2);

D=pdist2(data,data,'euclidean');

%1) Build Simplicial Complex
[graph,complex]=getVRComplex(D,R,simplexDimension);

%Plotting
if plotOn==1 
    figure
    for k=1:size(complex,2)
        fprintf('#%1d-Simplicies: %1d\n',k-1,size(complex{k},1));
    end
    hold on
    gplot(graph,data,'bo-') %Plot NeighbourhoodGraph      data(landmarks,:)
       if dim==3
        plot3(data(:,1),data(:,2),data(:,3),'o','Color','b');
    elseif dim<=2
        plot(data(:,1),data(:,2),'o','Color','b')
    end
end

%2) Create a "Boundary Matrix" for each order k.
%for k=1:simplexDimension
    VRboundaryMatricies=computeBoundaryMatricies(complex,simplexDimension);
    set(0,'RecursionLimit',1500)
%end

end