require_relative 'card.rb'

class Hand
  @size
  @cards

  attr_accessor :size, :cards

  def complete?
    @cards.size == @size
  end

  def contains?(c)
    @cards.each do |i|
      if i.to_s == c.to_s
        return true
      end
    end
    return false
  end

  def add_card(c)
    @cards << c if !complete? && !contains?(c)
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

  def evaluate
    if !complete?
      return nil
    end
    arr = []
    @cards.each do |i|
      arr.push(@hash_values[i.to_s])
    end
    (arr.max + arr.min)/@size.to_f
  end
end

class Spider < Hand_5cards

  def initialize
    super
    @hash_values = {"Ace" => 0, "Jack" => 3, "Queen" => 2, "King" => 1, "Two" => 0,
                    "Three" => 0, "Four" => 0, "Five" => 0, "Six" => 0, "Seven" => 0,
                    "Eight" => 0, "Nine" => 0, "Ten" => 0}
  end

  def evaluate
    nil if !complete?
    arr = []
    @cards.each do |i|
      arr.push(@hash_values[i.to_s])
    end
    arr.sort!         #to find median - the middle value in a sorted array
    arr[2]
  end
end

class Light < Hand_5cards
  include Evaluate
  def initialize
    super
    @hash_values = {"Ace"=>1,"Jack"=>5, "Queen"=>8, "King"=>6, "Two"=>13,
                  "Three"=>12, "Four"=>4, "Five"=>3, "Six"=>10, "Seven"=>9,
                  "Eight"=>2, "Nine"=>7, "Ten"=>11}
  end
end

class Idiot < Hand_2cards
  include Evaluate
  def initialize
    super
    @hash_values = {"Ace"=>1, "Two"=>2, "Three"=>3, "Four"=>4, "Five"=>5,
                    "Six"=>6, "Seven"=>7, "Eight"=>8, "Nine"=>9, "Ten"=>10,
                    "Jack"=>11, "Queen"=>12, "King"=>13}
  end
end

class Liar < Hand_2cards
  include Evaluate
  def initialize
    super
    @hash_values = {"Ace"=>13, "Two"=>12, "Three"=>11, "Four"=>10, "Five"=>9,
                    "Six"=>8, "Seven"=>7, "Eight"=>6, "Nine"=>5, "Ten"=>4,
                    "Jack"=>3, "Queen"=>2, "King"=>1}
  end
end