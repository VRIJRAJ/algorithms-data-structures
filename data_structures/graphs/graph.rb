class Vertex
  def initialize(data)
    @data = data
  end
end

class Edge
  def initialize(a, b, weight = 1)
    @vertices = [a, b]
    @wieght = weight
  end
end

class Graph
  def initialize
    @vertices = []
    @edges = []
  end
end

# Other ways to store edges:
# an adjacency matrix in the graph class
# an instance variable in each vertex that stores the connected vertices
