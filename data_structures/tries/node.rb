class Node
  attr_accessor :val, :children

  def initialize(val = :root)
    @val = val
    @children = []
  end

  def add_child(node)
    @children << node
  end

  def display(lvl = 0)
    puts "-" * lvl + @val.to_s
    @children.each do |child|
      child.display(lvl + 1)
    end
  end

  def count_complete_paths
    count = 0
    queue = [self]

    until queue.empty?
      node = queue.pop
      count += 1 if node.val == :*

      queue += node.children
    end

    count
  end
end
