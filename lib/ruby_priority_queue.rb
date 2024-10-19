# frozen_string_literal: true

require_relative "ruby_priority_queue/version"

module RubyPriorityQueue
  class Error < StandardError; end

  # The RubyPriorityQueue module provides a simple implementation of a priority queue.
  # A priority queue is a data structure where each element is associated with a priority,
  # and elements are served based on their priority.
  #
  # The PriorityQueue class within this module supports the following operations:
  # - `push(item, priority)`: Adds an item with the given priority to the queue.
  # - `pop`: Removes and returns the item with the highest priority.
  # - `empty?`: Checks if the queue is empty.
  # - `peek`: Returns the item with the highest priority without removing it.
  #
  # Example usage:
  #   pq = RubyPriorityQueue::PriorityQueue.new
  #   pq.push("task1", 1)
  #   pq.push("task2", 2)
  #   pq.pop # => ["task1", 1]
  class PriorityQueue
    def initialize
      @heap = []
    end

    def push(item, priority)
      @heap << [item, priority]
      bubble_up(@heap.size - 1)
    end

    def pop
      return if @heap.empty?

      swap(0, @heap.size - 1)
      min = @heap.pop
      bubble_down(0)
      min
    end

    def empty?
      @heap.empty?
    end

    def peek
      @heap[0]
    end

    private

    def bubble_up(index)
      parent_index = (index - 1) / 2
      return if index <= 0 || @heap[parent_index][1] <= @heap[index][1]

      swap(index, parent_index)
      bubble_up(parent_index)
    end

    def bubble_down(index)
      child_index = (index * 2) + 1
      return if child_index >= @heap.size

      right_child_index = child_index + 1
      if right_child_index < @heap.size && @heap[right_child_index][1] < @heap[child_index][1]
        child_index = right_child_index
      end

      return if @heap[index][1] <= @heap[child_index][1]

      swap(index, child_index)
      bubble_down(child_index)
    end

    def swap(source, target)
      @heap[source], @heap[target] = @heap[target], @heap[source]
    end
  end
end
