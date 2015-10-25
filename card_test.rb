require 'test/unit'
require_relative 'card.rb'

class Card_test < Test::Unit::TestCase
  def setup
    @c1 = Card.new
  end
  def test_initialize
    init_array = %w{Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace}
    assert_equal(true, init_array.include?(@c1.to_s), 'not in array')
  end
end