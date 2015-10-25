require 'test/unit'
require_relative 'card.rb'

class Card_test < Test::Unit::TestCase
  def setup
    @c1 = Card.new("Ten")
    @c2 = Card.new("false")
  end
  def test_initialize
    init_array = %w{Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace}
    assert_equal(true, init_array.include?(@c1.to_s), 'not in array')
    assert_equal(false, init_array.include?(@c2.to_s), 'extra value found')
  end
  def test_tos
    assert_equal("Ten", @c1.to_s, 'different values')
    assert_equal("false", @c2.to_s, 'different values')
  end
end