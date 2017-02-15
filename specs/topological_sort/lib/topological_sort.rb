require_relative 'graph'

# Look for vertices with no in_edges to do first
# Then delete all edges coming out of those vertices
# Repeat until there are no vertices left

# Khan's
# Queue all vertices with no in_edges
# Remove queued vertices and their edges from graph
# Push vertex into results array
# Look at each destination node and push onto queue if it has no in_edges
def topological_sort(vertices)
  result = []
  queue = []
  edge_counts = {}

  vertices.each do |vertex|
    edge_counts[vertex] = vertex.in_edges.count
    queue << vertex if vertex.in_edges.empty?
  end

  until queue.empty?
    vertex = queue.shift
    result << vertex

    vertex.out_edges.each do |edge|
      edge_counts[edge.to_vertex] -= 1
      queue << edge.to_vertex if edge_counts[edge.to_vertex] == 0
    end
  end

  result
end

# Tarian's
def topological_sort(vertices)
  result = []
  visited = Set.new

  vertices.each do |vertex|
    dfs!(vertex, visited, result) unless visited.include?(vertex)
  end

  result
end

def dfs!(vertex, visited, result)
  visited.add(vertex)

  vertex.out_edges.each do |edge|
    unless visited.include?(edge.to_vertex)
      dfs!(edge.to_vertex, visited, result)
    end
  end

  result.unshift(vertex)
end
