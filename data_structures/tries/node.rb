class Node
  attr_accessor :val, :children, :completions_count

  def initialize(val = :root, parent = nil)
    @val = val
    @children = []
    @parent = parent
    @completions_count = 0
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

  def inc_parents
    return if @parent.nil?

    @parent.completions_count += 1
    @parent.inc_parents
  end

  def find(partial)
    node = self

    partial.each_char do |char|
      node = node.children.find { |child| child.val == char }
      return nil unless node
    end

    node
  end
end
