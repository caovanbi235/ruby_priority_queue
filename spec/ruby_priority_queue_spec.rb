# frozen_string_literal: true

RSpec.describe RubyPriorityQueue do
  it "has a version number" do
    expect(RubyPriorityQueue::VERSION).not_to be nil
  end

  describe RubyPriorityQueue::PriorityQueue do
    let(:pq) { RubyPriorityQueue::PriorityQueue.new }

    it "can push and pop items" do
      pq.push("task1", 1)
      pq.push(item: "task2", priority: 2)
      expect(pq.pop).to eq(["task1", 1])
      expect(pq.pop).to eq(["task2", 2])
    end

    it "can check if it is empty" do
      expect(pq.empty?).to be true
      pq.push("task1", 1)
      expect(pq.empty?).to be false
    end

    it "can peek at the top item" do
      pq.push("task1", 1)
      pq.push(item: "task2", priority: 2)
      expect(pq.peek).to eq(["task1", 1])
    end

    it "can return the size of the queue" do
      expect(pq.size).to eq(0)
      pq.push("task1", 1)
      expect(pq.size).to eq(1)
      pq.push(item: "task2", priority: 2)
      expect(pq.size).to eq(2)
      pq.pop
      expect(pq.size).to eq(1)
    end
  end
end
