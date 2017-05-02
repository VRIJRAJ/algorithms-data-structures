require_relative 'node'

class Trie
  def initialize
    @root = Node.new
  end

  def add_word(word)
    node = @root

    word.each_char do |char|
      next_node = node.children.find { |n| n.val == char }

      unless next_node
        next_node = Node.new(char)
        node.add_child(next_node)
      end

      node = next_node
    end

    node.add_child(Node.new(:*))
  end

  def count_completions_for_partial(par)
    node = @root

    par.each_char do |char|
      node = node.children.find { |n| n.val == char }
      return 0 if node.nil?
    end

    node.count_complete_paths
  end

  def display
    @root.display
  end
end
