def depth_first_search(root, target)
  return nil if root.nil?
  return root if root.value == target

  [root.left, root.right].each do |child|
    search = depth_first_search(child, target)
    return search if search
  end

  nil
end
