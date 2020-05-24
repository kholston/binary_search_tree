require 'tree'
# This script runs through common tasks to test
# the functionality of the Binay Search Tree

# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
input_array = Array.new(15){rand(1..100)}
binary_tree = new Tree(input_array)
# 2. Confirm that the tree is balanced by calling `#balanced?`
puts "The tree is balanced: #{binary_tree.balanced?}"
# 3. Print out all elements in level, pre, post, and in order
puts 'Elements in level order:'
binary_tree.level_order { |node| puts node }
puts 'Elements in preorder:'
binary_tree.preorder { |node| puts node }
puts 'Elements in inorder:'
binary_tree.inorder { |node| puts node }
puts 'Elements in postorder:'
binary_tree.postorder { |node| puts node }
# 4. try to unbalance the tree by adding several numbers > 100
binary_tree.insert(101)
binary_tree.insert(102)
binary_tree.insert(103)
binary_tree.insert(104)
# 5. Confirm that the tree is unbalanced by calling `#balanced?`
binary_tree.balanced?
# 6. Balance the tree by calling `#rebalance!`
binary_tree.rebalance!
# 7. Confirm that the tree is balanced by calling `#balanced?`
binary_tree.balanced?
# 8. Print out all elements in level, pre, post, and in order
puts 'Elements in level order:'
binary_tree.level_order { |node| puts node }
puts 'Elements in preorder:'
binary_tree.preorder { |node| puts node }
puts 'Elements in inorder:'
binary_tree.inorder { |node| puts node }
puts 'Elements in postorder:'
binary_tree.postorder { |node| puts node }
