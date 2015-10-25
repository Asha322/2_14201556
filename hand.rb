class Hand
  @size
  @cards

  attr_accessor :size, :cards
  def initialize
    @size = 0
    @cards = []
  end

  def complete?
    @cards.size.equal?(@size)
  end

  def contains?(c)
    @cards.each do |i|
      if i.to_s.eql?(c.to_s)
        return false
      end
    end
  end

  def add_card(c)
    if !(self.complete?)
      @cards.push(c)
    end
  end
end