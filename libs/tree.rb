# frozen_string_literal: true

require_relative 'node'
require_relative 'sortable'

# Binary search tree data structure
class Tree
  include Sortable
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    return nil if arr.empty?

    arr_sorted = merge_sort(arr.uniq)
    middle = arr_sorted.length / 2
    root = Node.new(arr_sorted[middle])
    root.left = build_tree(arr_sorted[...middle])
    root.right = build_tree(arr_sorted[middle + 1..])
    root
  end

  def insert(value, node = root)
    return reset_root(value) if root.nil?
    return Node.new(value) if node.nil?

    if value < node.value
      node.left = insert(value, node.left)
    elsif value > node.value
      node.right = insert(value, node.right)
    end
    node
  end

  def delete(value, node = root)
    return node if node.nil?

    if value < node.value
      node.left = delete(value, node.left)
      return node
    elsif value > node.value
      node.right = delete(value, node.right)
      return node
    end
    delete_node(node)
  end

  def find(value, node = root)
    return node if node.nil?

    if value < node.value
      return find(value, node.left)
    elsif value > node.value
      return find(value, node.right)
    end

    node
  end

  private

  attr_writer :root

  def delete_node(node)
    if node.left.nil?
      node.right
    elsif node.right.nil?
      node.left
    else
      delete_with_children(node)
    end
  end

  def delete_with_children(node)
    parent = node
    succesor = node.right
    until succesor.left.nil?
      parent = succesor
      succesor = succesor.left
    end
    delete_set_directions(node, parent, succesor)
    node
  end

  def delete_set_directions(node, parent, succesor)
    if parent == node
      parent.right = succesor.right
    else
      parent.left = succesor.right
    end
    node.value = succesor.value
  end

  def reset_root(value)
    @root = Node.new(value)
    root
  end
end
