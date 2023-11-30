# frozen_string_literal: true

# Custom sort methods
module Sortable
  def merge_sort(arr)
    return arr if arr.length <= 1

    middle = arr.length / 2
    left = arr[0...middle]
    right = arr[middle..]
    merge(merge_sort(left), merge_sort(right))
  end

  def merge(left, right, sorted = [])
    until left.empty? || right.empty?
      sorted << if left[0] < right[0]
                  left.shift
                else
                  right.shift
                end
    end
    sorted.concat(left).concat(right)
  end
end
