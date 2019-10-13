function boundaryMatricies=ComputeBoundaryMatricies(kSkeletonOfVRComplex,simplexDimension)

for k=1:simplexDimension
    boundaryMatricies{k}=ComputeBoundaryMatrix(kSkeletonOfVRComplex,k);
end

end
