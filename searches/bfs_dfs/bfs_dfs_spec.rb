require 'rspec'
require_relative 'node'
require_relative 'bfs'
require_relative 'dfs'

root = Node.new(7)
root.left = Node.new(4)
root.left.left = Node.new(3)
root.left.right = Node.new(5)
root.right = Node.new(8)
root.right.left = Node.new(6)
root.right.right = Node.new(9)

#        7
#      /   \
#    4      8
#   / \    / \
#  3   5  6   9

describe "breadth_first_search" do
  subject(:tree) { root }

  it "finds a node" do
    node = breadth_first_search(tree, 5)

    expect(node.class).to be Node
    expect(node.value).to eq 5
  end

  it "returns nil if no node matches target" do
    node = breadth_first_search(tree, 10)

    expect(node).to be nil
  end
end

describe "depth_first_search" do
  subject(:tree) { root }

  it "finds a node" do
    node = depth_first_search(tree, 5)

    expect(node.class).to be Node
    expect(node.value).to eq 5
  end

  it "returns nil if no node matches target" do
    node = depth_first_search(tree, 10)

    expect(node).to be nil
  end
end
