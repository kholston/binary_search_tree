# A class that defines a binary search tree
require_relative 'node'

class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    
  end

end
