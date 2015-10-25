require 'test/unit'
require 'card.rb'

class Card_test < Test::Unit::TestCase
  def setup
    @c1 = Card.new
  end
  def print
    init_array = %w{Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace}
    #b = init_array.include?(@c1.to_s)
    assert_equal(true, init_array.include?(@c1.to_s), 'not in array')
  end
end