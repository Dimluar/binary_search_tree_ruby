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

  private

  attr_writer :root
end
