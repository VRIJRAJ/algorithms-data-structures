class Fixnum
  # Use Ruby's default Fixnum#hash
end

class Array
  def hash
    duped = self.dup
    hash_int = duped.shift.hash
    duped.each_with_index do |el, index|
      hash_int ^= (el + index).hash
    end

    hash_int
  end
end

class String
  def hash
    chars = self.chars.map(&:ord)
    chars.each_with_index.inject(0) do |hash_int, (ord, index)|
      hash_int ^ (ord + index).hash
    end
  end
end

class Hash
  def hash
    hash_int = 0
    self.each do |key, value|
      hash_int ^= (key.hash + value.hash)
    end

    hash_int
  end
end
