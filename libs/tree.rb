# frozen_string_literal: true

require_relative 'node'

# Binary search tree data structure
class Tree
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  private

  attr_writer :root
end
