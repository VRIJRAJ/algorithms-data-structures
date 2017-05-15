require_relative 'heap'

describe MinHeap do
  subject(:min_heap) { MinHeap.new }

  describe "#push" do
    it "adds ascending items in the correct order" do
      (0..10).each do |el|
        min_heap.push(el)
      end

      expect(min_heap.store).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    end

    it "adds descending items in the correct order" do
      10.downto(0) do |el|
        min_heap.push(el)
      end

      expect(min_heap.store).to eq([0, 1, 5, 4, 2, 9, 6, 10, 7, 8, 3])
    end
  end

  describe "#peek" do
    it "returns the min" do
      (0..100).to_a.shuffle.each do |el|
        min_heap.push(el)
      end

      expect(min_heap.peek).to eq(0)
    end
  end

  describe "#poll" do
    it "returns the min and re-heapifies store" do
      results = []

      (0..100).to_a.shuffle.each do |el|
        min_heap.push(el)
      end

      101.times do
        results << min_heap.poll
      end

      expect(results).to eq((0..100).to_a)
    end
  end
end
