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

  # Adds a value to tree
  def insert(value)
    # if the tree already contains the value return
    return if contains?(value)
    new_node = Node.new(value)
    current_node = @root
    # While the next node in the list is not nil
    until current_node.nil?
      # Check if the value is greater than or less than the root
      previous_node = current_node
      if current_node > new_node
        # If less send it to the left else send it to the right
        current_node = previous_node.left_child
      elsif current_node < new_node
        current_node = previous_node.right_child
      end
    end
    # Check the previous node to see what side to set it
    previous_node > new_node ? previous_node.left_child = new_node : previous_node.right = new_node
  end

  # Deletes a value from the tree
  def delete(value)
    # If the tree does not contain the value return
    return unless contains?(value)

    current_node = @root
    # Until the end of the tree is reached traverse the tree
    until current_node.nil?
      # Leave the loop early when the node is found
      break if current_node.value == value

      # Cache the current node for reference
      previous_node = current_node
      # Set the current node to one of the children
      if current_node.value < value
        current_node = current_node.left_child
      else
        current_node.right_child
      end
    end
    # check the previous node to find out which child is the value
    # set that child to nil
    # reinsert the current nodes children unless they equal nil
  end

  # Returns node with the given value
  def find(value)
    return unless contains?(value)

    current_node = @root
    until current_node.nil?
      break if current_node.value == value

      # if value is less set the current node to the left child otherwise set the current node to the right child
      current_node.value > value ? current_node = current_node.left_child : current_node = current_node.right_child
    end
    current_node
  end

  # Traverses the tree in breadth-first level order
  def level_order
    # create a queue
    node_queue = []
    backup_array = [] unless block_given?
    # Add root node to the queue
    node_queue << @root
    # until the queue is empty
    until node_queue.empty?
      # take out first node set it to current node
      current_node = node_queue.shift
      # if it equals nil move to next interation
      next if current_node.nil?

      # yield node to block
      if block_given?
        yield current_node
      else
        backup_array << current_node
      end
      # Add both children to queue left to right
      node_queue << current_node.left_child
      node_queue << current_node.right_child
    end
    backup_array unless block_given?
  end

  # Traverses the tree in breadth-first level order recursively
  def level_order_rec
  end

  # Traverses the tree in depth-first preorder
  def preorder(root_node)
    backup_array = [] unless block_given?
    return if root_node.nil?
    if block_given?
      yield root_node
    else
      backup_array << root_node
    end
    preorder(root_node.left_child)
    preorder(root_node.right_child)
    backup_array unless block_given?
  end

  # Traverses the tree in depth-first inorder
  def inorder
    backup_array = [] unless block_given?
    return if root_node.nil?
    preorder(root_node.left_child)
    if block_given?
      yield root_node
    else
      backup_array << root_node
    end
    preorder(root_node.right_child)
    backup_array unless block_given?
  end

  # Traverses the tree in depth-first postorder
  def postorder
    backup_array = [] unless block_given?
    return if root_node.nil?
    preorder(root_node.left_child)
    preorder(root_node.right_child)
    if block_given?
      yield root_node
    else
      backup_array << root_node
    end
    backup_array unless block_given?
  end

  # Returns depth level of node argument
  def depth(node)
    result = "This node  has  a depth level of "
    return unless contains?
    depth_level = 0
    current_node = @root
    until current_node == node
      node < current_node ? current_node = current_node.left_child : current_node.right_child
      depth_level += 1
    end
    result += depth_level.to_s
    result
  end

  # Checks if the tree is balanced
  def balanced?(node)
    balanced_height(node) > -1
  end

  # Rebalances the tree
  def rebalance!

  end

  private

  def balanced_height(node)
    return 0 if node.nil?

    left_height = balanced?(node.left_child) 
    right_height = balanced?(node.right_child)

    return -1 if left_height == -1 || right_height == -1
    return -1 if (left_height - right_height).abs > 1
    return left_height + 1 if left_height > right_height

    right_height + 1
  end
end
