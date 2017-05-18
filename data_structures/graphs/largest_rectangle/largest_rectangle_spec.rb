require 'rspec'
require_relative 'matrix'
require_relative 'histogram'

describe Histogram do
  it "returns the largest area of a histogram" do
    histogram = Histogram.new([1, 3, 2, 1, 2])

    expect(histogram.largest_area).to eq(5)
  end
end

describe Matrix do
  context "Matrix" do
    it "returns the size of the largest rectangle in an adjacency matrix" do
      adj_matrix = Matrix.new([[0, 1, 1, 0],
                                        [1, 1, 1, 1],
                                        [1, 1, 1, 1],
                                        [1, 1, 0, 0]])

      expect(adj_matrix.largest_rectangle).to eq(8)
    end
  end
end
