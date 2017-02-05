require_relative 'link'

class LinkedList
  include Enumerable

  def initialize
    @head, @tail = Link.new, Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return @head.next unless empty?
    nil
  end

  def last
    return @tail.prev unless empty?
    nil
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |link| return link.val if link.key == key }
  end

  def include?(key)
    each do |link|
      return true if link.key == key
    end

    false
  end

  def insert(key, val)
    unless include?(key)
      link = Link.new(key, val)
      @tail.prev.next = link
      link.next = @tail
      link.prev = @tail.prev
      @tail.prev = link
    end

    link
  end

  def remove(key)
    each do |link|
      link.remove if link.key == key
    end
  end

  def each(&prc)
    curr_link = @head.next
    until curr_link == @tail
      prc.call(curr_link)
      curr_link = curr_link.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
