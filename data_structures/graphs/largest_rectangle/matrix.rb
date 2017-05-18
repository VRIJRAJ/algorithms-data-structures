require_relative 'histogram'

class Matrix
  def initialize(matrix = [])
    @matrix = matrix
  end

  ## Largest Rectangle in Matrix
  def largest_rectangle
    histogram = Histogram.new(Array.new(@matrix[0].length, 0))
    max_area = 0

    @matrix.each do |row|
      histogram.update!(row)
      largest_in_histogram = histogram.largest_area
      max_area = [max_area, largest_in_histogram].max
    end

    max_area
  end
end
