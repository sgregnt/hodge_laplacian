%input: persistence parameters "R"; datagroup "datagroup"(including several datasets, such as squares of different sizes); 
function [firsteig]=firstnonzeroeig(datagroup,R, plotornot)
n = size(datagroup,2); % n: how many datasets in the datagroup
firsteig = cell(1,n); %firsteig: as a cell, for every dataset in the datagroup, there is a 3*size(R) matrix, the first row is persistence parameters R; the second row is first nonzero eigenvalue corresponding to every specific r in R; the third row indicates the actual rank/position of the first nonzero eigenvalue
for i=1:n
    firsteig{i} = zeros(2,size(R,2));
    firsteig{i}(1,:) = R;
    [eigvalue,~] = TDAVRHodgeL1(datagroup{i},R,3, plotornot); % dim of simplicial complex = 3
    for j=1:size(R,2)
        for k=1:1000  % here 1000 is just a large number to guarantee we can capture the nonzero eigenvalue.
            if(eigvalue{1,j}(k,k)>0.0000001)
                firsteig{i}(2,j)=eigvalue{1,j}(k,k);
                firsteig{i}(3,j)=k;
                break
            end
        end
        
    end
end
end