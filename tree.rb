require_relative 'node'

class Tree
  attr_accessor :root

  # Intialize tree with an array
  def initialize(arr)
    # Sort array an remove duplicates  
    @arr = sort_arr(arr)
    # Buil tree and get root node of tree
    @root = build_tree(@arr)
  end

  # This function will sort array in order and remove duplicate values. 
  def sort_arr(arr)
    arr.sort.uniq
  end

  # Create a BST and return root node of tree
  def build_tree(arr)
    # Base Case: return if array/subarray is empty
    if arr.empty? then return end

    # Find middle indes, data value of middle index will be our root 
    mid = arr.length / 2 
    
    # Create node object where value at middle of ordered array is the root
    root = Node.new(arr[mid])

    # Create two subarrays, one on the left and another on the right of current array midpoint
    # Use recursion to buld left side of tree
    root.left = build_tree(arr[0 ... mid])

    # Use recursion to build right side of tree
    root.right = build_tree(arr[mid + 1 .. -1])
    
    # Return root of given level
    return root
    
  end

  # Will print out binary tree structure in the command terminal 
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end 


arr = [3,4,5,2,1,6,7,8,9]

p Tree.new(arr).pretty_print
