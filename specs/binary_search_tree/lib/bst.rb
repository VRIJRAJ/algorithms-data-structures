class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
    else
      BinarySearchTree.insert!(@root, value)
    end
  end

  def find(value)

  end

  def inorder

  end

  def postorder

  end

  def preorder

  end

  def height

  end

  def min

  end

  def max

  end

  def delete(value)

  end

  def self.insert!(node, value)
    return BSTNode.new(value) unless node

    if value <= node.value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value

    if value < node.value
      BinarySearchTree.find!(node.left, value)
    else
      BinarySearchTree.find!(node.right, value)
    end
  end

  def self.preorder!(node)

  end

  def self.inorder!(node)
    return [] unless node

    left = BinarySearchTree.inorder!(node.left)
    right = BinarySearchTree.inorder!(node.right)
    
    left + [node.value] + right
  end

  def self.postorder!(node)

  end

  def self.height!(node)
    return -1 unless node

    [1 + BinarySearchTree.height!(node.left),
     1 + BinarySearchTree.height!(node.right)].max
  end

  def self.max(node)
    return nil unless node
    return node unless node.right

    BinarySearchTree.max(node.right)
  end

  def self.min(node)
    return nil unless node
    return node unless node.left

    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left

    node.left = BinarySearchTree.delete_min!(node.left)
  end

  def self.delete!(node, value)
    return nil unless node

    if value < node.value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif value > node.value
      node.right = BinarySearchTree.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left

      replaced_node = node
      node = BinarySearchTree.min(replaced_node.right)
      node.right = BinarySearchTree.delete_min!(replaced_node.right)
      node.left = replaced_node.left
    end

    node
  end
end
