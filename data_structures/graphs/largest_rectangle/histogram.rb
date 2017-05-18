class Histogram
  def initialize(histogram = [])
    @store = histogram
  end

  def update!(histogram)
    histogram.each_with_index do |val, index|
      if val > 0
        @store[index] += val
      else
        @store[index] = 0
      end
    end
  end

  ## Largest Area in Histogram
  def largest_area
    @heights = []
    @positions = []
    @max_size = 0

    @temp_pos = nil
    @temp_height = nil
    @temp_size = nil

    @store.each_with_index do |height, index|
      if @heights.empty? || height > @heights.last
        @heights.push(height)
        @positions.push(index)
      elsif height < @heights.last
        while !@heights.empty? && height < @heights.last
          pop_stacks(index)
        end

        @heights.push(height)
        @positions.push(@temp_pos)
      end
    end

    while !@heights.empty?
      pop_stacks(@store.length)
    end

    @max_size
  end

  def pop_stacks(pos)
    @temp_height = @heights.pop
    @temp_pos = @positions.pop
    @temp_size = @temp_height * (pos - @temp_pos)
    @max_size = [@max_size, @temp_size].max
  end
end
