iterator = stream.iterator();


ins_matrix = zeros(stream.getSize());
simplex = stream.getSize();
while (iterator.hasNext())
  % the next line will print the current simplex
  simplex = iterator.next();
  if size(simplex) == 1
      simplex
  end
  
end