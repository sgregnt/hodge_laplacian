import sys
a = sys.path.append("C:\\javaplex_jar\\javaplex.jar")
print(a)
from edu.stanford.math.plex4 import *


print(1)


import edu.stanford.math.plex4
import edu.stanford.math.plex4.api
import edu.stanford.math.plex4.examples
import edu.stanford.math.plex4.io

## Manual construction

# get a new ExplicitSimplexStream
stream = edu.stanford.math.plex4.api.Plex4.createExplicitSimplexStream()

# construct a triangle
stream.addVertex(0)
stream.addVertex(1)
stream.addVertex(2)
stream.addElement([0, 1])
stream.addElement([0, 2])
stream.addElement([1, 2])
stream.addElement([0, 1, 2])


size = stream.getSize()
print size

d_1 = streams.utility.StreamUtility.createBoundaryMatrixAsDoubleSum(stream, 2)
print d_1
print type(d_1)


converter = api.Plex4.createHomMatrixConverter(stream, stream);
print type(converter)
d_1_array = converter.toArray(d_1)
print(d_1_array)

t = edu.stanford.math.plex4.streams.utility.StreamUtility.getBoundaryMatrixColumns(stream, 2)
a = streams.utility.StreamUtility.getBoundaryIds()
print a

#print t
#print type(t)
#converter = api.Plex4.createHomMatrixConverter(stream, stream);
#t_array = converter.toArray(t)
#print(t_array)

# look at this https://github.com/ogdet/primitive-lib/blob/master/src/edu/stanford/math/primitivelib/autogen/formal_sum/DoublePrimitiveFreeModule.java