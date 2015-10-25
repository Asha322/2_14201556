class Hand
  @size
  @cards

  attr_accessor :size, :cards
  def complete?
    @cards.size.equal?(@size)
  end

  def contains?(c)
    @cards.each do |i|
      if i.to_s.eql?(c.to_s)
        return false
      end
    end
    return true
  end

  def add_card(c)
    if !(self.complete?)
      @cards.push(c)
    end
  end

  def value(c)
    @hash_values[c.to_s]
  end
end

class Hand_2cards < Hand
  @size
  @cards

  def initialize
    @size = 2
    @cards = []
  end
end

class Hand_5cards < Hand
  @size
  @cards

  def initialize
    @size = 5
    @cards = []
  end
end

module Evaluate
  def find_min
    min = @hash_values[@cards[0]]
    @cards.each do |i|
      if @hash_values[i] < min
        min = @hash_values[i]
      end
    end
  end

  def find_max
    max = @hash_values[@cards[0]]
    @cards.each do |i|
      if @hash_values[i] < max
        max = @hash_values[i]
      end
    end
  end

  def evaluate
    (find_max - find_min)/@size
  end
end

class Spider < Hand_5cards
  @hash_values = {"Ace"=>0, "Jack"=>3, "Queen"=>2, "King"=>1, "Two"=>0,
                  "Three"=>0, "Four"=>0, "Five"=>0, "Six"=>0, "Seven"=>0,
                  "Eight"=>0, "Nine"=>0, "Ten"=>0}

  def sort_hand!       #to find median - the middle value in a sorted array
    for i in 1..4
      for j in i+1..4
        if @hash_values[@cards[i]] > @hash_values[@cards[j]]
          temp = @cards[i]
          @cards[i] = @cards[j]
          @cards[j] = temp
        end
      end
    end
  end

  def evaluate
    if !self.complete?
      return nil
    end
    sort_hand!
    @cards[2]
  end
end

class Light < Hand_5cards
  include Evaluate
  @hash_values = {"Ace"=>1,"Jack"=>5, "Queen"=>8, "King"=>6, "Two"=>13,
                  "Three"=>12, "Four"=>4, "Five"=>3, "Six"=>10, "Seven"=>9,
                  "Eight"=>2, "Nine"=>7, "Ten"=>11}
end

class Idiot < Hand_2cards
  include Evaluate
  @hash_values = {"Ace"=>1, "Two"=>2, "Three"=>3, "Four"=>4, "Five"=>5,
                  "Six"=>6, "Seven"=>7, "Eight"=>8, "Nine"=>9, "Ten"=>10,
                  "Jack"=>11, "Queen"=>12, "King"=>13}
end

class Liar < Hand_2cards
  include Evaluate
  @hash_values = {"Ace"=>13, "Two"=>12, "Three"=>11, "Four"=>10, "Five"=>9,
                  "Six"=>8, "Seven"=>7, "Eight"=>6, "Nine"=>5, "Ten"=>4,
                  "Jack"=>3, "Queen"=>2, "King"=>1}
end