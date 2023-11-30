# frozen_string_literal: true

# BST element
class Node
  include Comparable
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def <=>(other)
    value <=> other.value
  end
end
