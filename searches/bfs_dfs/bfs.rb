def breadth_first_search(root, target)
  queue = [root]

  until queue.empty?
    node = queue.shift
    
    return node if node.value == target

    queue << node.left unless node.left.nil?
    queue << node.right unless node.left.nil?
  end

  nil
end
