function matrix = get_boundary_k(stream, n1, n2)
import edu.stanford.math.plex4.*;
% compute boundary
d_1 = streams.utility.StreamUtility.createBoundaryMatrixAsDoubleSum(stream, 1);

% convert from sparse form to array
converter = api.Plex4.createHomMatrixConverter(stream, stream);
tmp_matrix = converter.toArray(d_1);


row_s = n1 + 1;
row_f = row_s + n2 - 1;
col_s = 1;
col_f = col_s + n1 - 1;

matrix = tmp_matrix(row_s:row_f, col_s:col_f);




