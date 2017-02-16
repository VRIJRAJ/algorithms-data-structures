require_relative 'graph'
require_relative 'heap2'

# O(|V|**2 + |E|).
def dijkstra1(start)
  paths = {}
  possible_paths = {
    start => { cost: 0, prev_edge: nil }
  }

  until possible_paths.empty?
    vertex = min_path(possible_paths)

    paths[vertex] = possible_paths[vertex]
    possible_paths.delete(vertex)

    update_possible_paths(vertex, paths, possible_paths)
  end

  paths
end

def min_path(possible_paths)
  vertex, _ = possible_paths.min_by { |_, data| data[:cost] }
  vertex
end

def update_possible_paths(vertex, paths, possible_paths)
  path_to_vertex_cost = paths[vertex][:cost]

  vertex.out_edges.each do |edge|
    to_vertex = edge.to_vertex

    next if paths.key?(to_vertex)

    path_cost = path_to_vertex_cost + edge.cost
    next if possible_paths.key?(to_vertex) &&
            possible_paths[to_vertex][:cost] <= path_cost

    possible_paths[to_vertex] = { cost: path_cost, prev_edge: edge }
  end
end
