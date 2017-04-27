class Node
  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value, @left, @right = value, left, right
  end
end
