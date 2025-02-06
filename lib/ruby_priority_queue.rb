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
    class Node
      include Comparable
      attr_accessor :item, :priority

      def initialize(item, priority)
        @item = item
        @priority = priority
      end

      def <=>(other)
        priority <=> other.priority
      end
    end

    def initialize
      @heap = []
    end

    def push(item = nil, priority = nil, **kwargs)
      item ||= kwargs[:item]
      priority ||= kwargs[:priority]
      @heap << Node.new(item, priority)
      bubble_up(@heap.size - 1)
    end

    # @return [Array] an array containing the item and its priority
    def pop
      return if @heap.empty?

      swap(0, @heap.size - 1)
      min = @heap.pop
      bubble_down(0)
      [min.item, min.priority]
    end

    def empty?
      @heap.empty?
    end

    # @return [Array] an array containing the item and its priority
    def peek
      [@heap[0].item, @heap[0].priority]
    end

    def size
      @heap.size
    end

    private

    def bubble_up(index)
      parent_index = (index - 1) / 2
      return if index <= 0 || @heap[parent_index] <= @heap[index]

      swap(index, parent_index)
      bubble_up(parent_index)
    end

    def bubble_down(index)
      left_child_index = (index * 2) + 1
      return if left_child_index >= @heap.size

      right_child_index = left_child_index + 1
      if right_child_index < @heap.size && @heap[right_child_index] < @heap[left_child_index]
        left_child_index = right_child_index
      end

      return if @heap[index] <= @heap[left_child_index]

      swap(index, left_child_index)
      bubble_down(left_child_index)
    end

    def swap(source, target)
      @heap[source], @heap[target] = @heap[target], @heap[source]
    end
  end
end
