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
    return @root = build_tree([value]) if node.nil?
    return self if value == node.value

    if value < node.value
      return insert_nil_left(value, node) if node.left.nil?

      node = node.left
    else
      return insert_nil_right(value, node) if node.right.nil?

      node = node.right
    end
    insert(value, node)
  end

  private

  attr_writer :root

  def insert_nil_left(value, node)
    node.left = Node.new(value)
    self
  end

  def insert_nil_right(value, node)
    node.right = Node.new(value)
    self
  end
end
