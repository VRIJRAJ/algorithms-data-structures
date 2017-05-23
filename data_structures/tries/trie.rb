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
        next_node = Node.new(char, node)
        node.add_child(next_node)
      end

      node = next_node
    end

    star_node = Node.new(:*, node)
    node.add_child(star_node)
    star_node.inc_parents
  end

  def count_completions_for_partial(partial)
    node = @root.find(partial)

    if node
      node.completions_count
    else
      0
    end
  end

  def display
    @root.display
  end
end
