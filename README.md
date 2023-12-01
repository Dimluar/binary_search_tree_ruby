# binary_search_tree_ruby

Balance _Binary Search Tree_ made with ruby.

The BST does not permit repeated values or an unordered array to create it. The further explain build_tree method eliminates any duplicates and orders the array with the merge_tree method.

The next methods are included:

- #build_tree: creates a BST from an array.
- #insert: adds a new value to the tree.
- #delete: eliminates an existing value from the tree.
- #find: returns an existing node from the tree, nil if it's not in it.
- #level_order: itinerates in breadth-first level order yielding each node to a given block. Returns array of values given block or not.
- #preorder, #inorder, #postorder: itinerates in it's respective depth-first order yielding each node to a given block. Returns array of values given block or not.
- #height: returns height of selected node, can be given value instead of node.
- #depth: returns depth of selected node, can be given value instead of node. Returns -1 if node it's not in tree.
- #balanced?: returns true if the tree is balanced.
- #rebalance: remakes the tree from scratch with it's current nodes.

The main.rb file contains an example script of the creation of a tree, the insertion of values the four itineration methods and the rebalancing of the tree.
