require 'test/unit'
require_relative 'card.rb'

class Card_test < Test::Unit::TestCase
  def setup
    @c1 = Card.new
  end
  def test_initialize
    init_array = %w{Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace}
    for i in 0..10 do
      @c1 = Card.new
      assert_equal(true, init_array.include?(@c1.to_s), 'not in array')
    end
  end
  def test_rand       #this test should sometimes fail and it does
    for i in 0..5 do
      @c3 = Card.new
      @c4 = Card.new
      assert_not_equal(true, @c3.to_s.eql?(@c4.to_s), 'equal')
    end
  end
end