require_relative 'node'
require_relative 'tree'

# Create tree with 15 random elements with values between 1-100
tree = Tree.new(Array.new(15) {rand(1..100)})

# Print tree in command line
tree.pretty_print

# Check if tree is balanced
puts "Balanced?: #{tree.balanced?}", "\n"

# Print out all elements in level, pre, post, and in order
puts "Level Order: #{tree.level_order_recursive} \n", "Preorder: #{tree.preorder} \n", "Postorder: #{tree.postorder} \n", "Inorder: #{tree.inorder}", "\n"

# Unbalance the tree by adding several numbers greater than 100
add = Array.new(5) {rand(100 .. 150)}

for i in add
  tree.insert(i)
end 

# Print tree again
tree.pretty_print

# Confrim the tree is unbalanced
puts "Balanced?: #{tree.balanced?}", "\n"

# Rebalance tree
tree.rebalance

# Confrim tree is balanced
tree.pretty_print
puts "Balanced?: #{tree.balanced?}", "\n"

# Print out all elements in level, pre, post, and in order
puts "Level Order: #{tree.level_order_recursive} \n", "Preorder: #{tree.preorder} \n", "Postorder: #{tree.postorder} \n", "Inorder: #{tree.inorder}", "\n"
