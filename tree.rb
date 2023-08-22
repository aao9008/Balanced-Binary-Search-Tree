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

    if arr.empty? then return end

    mid = arr.length / 2 

    root = Node.new(arr[mid])

    root.left = build_tree(arr[0 ... mid])

    root.right = build_tree(arr[mid + 1 .. -1])

    return root
    
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end 


arr = [3,4,5,2,1,6,7,8,9]

p Tree.new(arr).pretty_print
