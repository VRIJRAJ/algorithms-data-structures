require_relative 'graph'
require_relative 'priority_map'

# O(|V| + |E|*log(|V|)).
def dijkstra2(start)
  paths = {}
  possible_paths = PriorityMap.new { |x, y| x[:cost] <=> y[:cost] }
  possible_paths[start] = { cost: 0, prev_edge: nil }

  until possible_paths.empty?
    vertex, data = possible_paths.extract

    paths[vertex] = data

    update_possible_paths(vertex, paths, possible_paths)
  end

  paths
end

def update_possible_paths(vertex, paths, possible_paths)
  path_to_vertex_cost = paths[vertex][:cost]

  vertex.out_edges.each do |edge|
    to_vertex = edge.to_vertex

    next if paths.key?(to_vertex)

    path_cost = path_to_vertex_cost + edge.cost
    next if possible_paths.has_key?(to_vertex) &&
            possible_paths[to_vertex][:cost] <= path_cost

    possible_paths[to_vertex] = { cost: path_cost, prev_edge: edge }
  end
end
