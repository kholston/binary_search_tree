require_relative 'node'

# A class that defines a binary search tree
class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array)
  end

  # Builds initial tree 
  def build_tree(array)
    root_node = Node.new(array[0])
    previous_node = root_node
    array[1..array.length].each do |element|
      next if contains?(element,root_node)

      current_node = Node.new(element)
      previous_node.left_child = current_node  if current_node > previous_node
      previous_node.left_child = current_node if current_node < previous_node
      # next if current_node == previous_node
      previous_node = current_node
    end
    root_node
  end

  # Checks if tree already contains a value
  def contains?(value, root_node )
    return if root_node.nil?

    start_node = root_node
    contains?(value, start_node)
    result = true if start_node.value == value
    result = true if start_node.left_child.value == value
    result = true if start_node.right_child.value == value
    result
  end
end
