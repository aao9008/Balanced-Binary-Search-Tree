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

  def insert(root = @root, value)
    # Base Case: reach a leaf node (root node has value of nil for left or right)
    if root == nil
      return Node.new(value)
    end

    # Compare insert value to value of the tree root.
    direction = @root.<=>(value)

    # Insertion value already exists in the tree
    if direction == 0
      return root
    # If comparble method return 1, continue traversing to the left side. 
    elsif direction == 1
      root.left = insert(root.left, value)
    # If comparble method returns -1, continue traversing to the right side.
    elsif direction == -1
      root.right = insert(root.right, value)
    end 
    
    # Return root to previous level (Root of current level is child of previous level)
    return root
  end

  # Function will remove node that contains the passed value
  def delete(root = @root, value)
    # Basecase: Value is not in BST
    return root if root == nil

    # If value is greater than node value, continue to right side of tree
    if root.data < value
      root.right = delete(root.right, value)
      return root
    # If value is less than node value, continue to the left side of tree
    elsif root.data > value
      root.left = delete(root.left, value)
      return root
    end

    # Node to be deleted has been found in other words root.data == value

    # If at least one of the children is nil 
    if root.left == nil
      temp = root.right
      return temp
    elsif root.right == nil
      temp = root.left
      return temp
    # Both children exist
    else
      parent_succ = root
      succ = parent_succ.right
      
      until succ.left == nil
        parent_succ = succ
        succ = succ.left
      end

      # Edge case: lowest value is right childe of node to be deleted
      if root == parent_succ
        parent_succ.right = succ.right
      # For all other cases
      else 
        parent_succ.left = succ.right
      end

      # Copy successor data to node to deleted
      root.data = succ.data

      # Return root
      return root 
    end
  end

  #Return node with the given value
  def find(value, root = @root)
    # Node with given value does not exist, return nil
    return nil if root.nil?
    # Node with given value has been found, return the node
    return root if root.data == value
    # Traverse tree looking for node with given value
    value < root.data ? find(value, root.left) : find(value, root.right)
  end

  # Returns number of edeges from given node to tree root
  def depth(node)
    # Start at tree root
    current_node = @root
    # Count number of edges
    count = 0
    # Traverse tree until given node is found or no nodes are left
    until current_node.<=>(node) == 0 || current_node == nil
      count += 1
      if current_node.<=>(node) == -1
        current_node = current_node.right
      elsif current_node.<=>(node) == 1
        current_node = current_node.left
      end
    end
    # Return edges count or nil if node is nil
    current_node.nil? ? nil : count
  end

  def level_order(root = @root)
    return if root.nil?

    # Queue array will be used for traversel
    queue = []
    # Ouptput array will return all values traversed
    output = []

    # Push current root into queue
    queue.push(root)

    until queue.empty?
      # 'Visit' discovered node (FIFO)
      current = queue.shift

      # Check if block is given yeild node, else push node value
      output.push(block_given? ? yield(current) : current.data)

      # Push left child to queue if not empty
      queue.push(current.left) if current.left
      # Push right child to queue if not empty
      queue.push(current.right) if current.right
    end

    # Return output array
    return output
  end

  # Breadth level traversal of tree
  def level_order_recursive(root = @root, queue = [], output = [], &block)
    # Check if block is given yeild node, else push node value
    output.push(block_given? ? yield(root) : root.data)

    # Push left child to queue if not empty
    queue.push(root.left) if root.left
    # Push right child to queue if not empty
    queue.push(root.right) if root.right

    # Base case
    return output if queue.empty?

    # 'Visit' new root
    level_order_recursive(queue.shift, queue, output, &block)
  end

  # Depth first search
  def inorder(root = @root, output = [], &block)
    # Base case
    return if root.nil?

    # Traverse left side
    inorder(root.left, output, &block)

    # Yield root if block is given
    if block_given? then yield(root)end
    # Push value to array
    output.push(root.data)

    # Traverse right side
    inorder(root.right, output, &block)

    # Function has return to root, tree has been traversed
    return output 
  end 

  # Depth first search
  def preorder(root = @root, output = [], &block)
    # Base case
    return if root.nil?

    # Yield root if block is given
    if block_given? then yield(root)end
    # Push value to array
    output.push(root.data)

    # Traverse left side
    preorder(root.left, output, &block)

    # Traverse right side
    preorder(root.right, output, &block)

    # Function has return to root, tree has been traversed
    return output 
  end 
end 


arr = [20,30,40,50,60,70,80]

tree = Tree.new(arr)

tree.pretty_print

r = Proc.new {|node| node.data * 2}

p = tree.preorder{ |root| puts root.data}
p p

