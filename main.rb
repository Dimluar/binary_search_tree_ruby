# frozen_string_literal: true

require_relative 'libs/tree'

def print_tree(tree)
  puts "Level ordered: #{print_ordered(tree)}"
  puts "Preorder: #{print_preorder(tree)}"
  puts "Inorder: #{print_inorder(tree)}"
  puts "Postorder: #{print_postorder(tree)}"
end

def print_ordered(tree, string = '')
  tree.level_order { |value| string += "#{value} " }
  string.strip
end

def print_preorder(tree, string = '')
  tree.preorder { |value| string += "#{value} " }
  string.strip
end

def print_inorder(tree, string = '')
  tree.inorder { |value| string += "#{value} " }
  string.strip
end

def print_postorder(tree, string = '')
  tree.postorder { |value| string += "#{value} " }
  string.strip
end

tree = Tree.new(Array.new(15) { rand(1..100) })
puts "Balanced?: #{tree.balanced?}"
print_tree(tree)
(Array.new(100) { rand(101..200) }).each { |value| tree.insert(value) }
puts "\nBalanced?: #{tree.balanced?}"
tree.rebalance
puts "Balanced?: #{tree.balanced?}"
print_tree(tree)
