# Balanced-Binary-Search-Tree

## **The Binary Search Tree Data Structure Has The Following Methods:**

* **#build_tree** - Takes an array of data and turns it into a balanced binary tree.

* **#insert** - Takes a value and inserts it into the tree.

* **#delete** - Takes a value and deletes it from the tree if it's already in the tree.

* **#find** - Takes a value and returns the node with the given value.

* **#level_order** - Prints all the values in level order by using iteration. Can be used with block too.

* **#level_order_recursive** - Prints all the values in level order by using recursion. Can be used with block too.

* **#inorder** - Prints all the values in inorder. Can be used with block too.

* **#preorder** - Prints all the values in preorder. Can be used with block too.

* **#postorder** - Prints all the values in postorder. Can be used with block too.

* **#height** - Accepts a node (optinal: value) and returns the height of the given node.

* **#depth** - Accepts a node (optinal: value) and returns the depth of the given node.

* **#balanced?** - Checks if the tree is balanced.

* **#rebalance** -  Rebalances the current tree

***
### **main.rb does the following:**

1. Creates a binary search tree from an array of random numbers (Array.new(15) { rand(1..100) }).

2. Confirms that the tree is balanced by calling **#balanced?**.

3. Prints out all elements *in level, pre, post, and in order*.

4. Unbalances the tree by adding several numbers > 100.

5. Confirms that the tree is unbalanced by calling **#balanced?**.

6. Balances the tree by calling **#rebalance**.

7. Confirms that the tree is balanced by calling **#balanced?**.

8. Prints out all elements *in level, pre, post, and in order*.