# A class that defines a node for a Binary Search Tree
class Node
  include Comparable
  attr_accessor :left_child, :right_child, :data

  def initialize(value)
    @data = value
    @left_child, @right_child = nil
  end

  def <=>(other)
    @data <=> other.data
  end
end
