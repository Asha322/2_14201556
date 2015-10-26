require 'test/unit'
require_relative 'hand.rb'
require_relative 'card.rb'

class Hand_test < Test::Unit::TestCase
  def setup
    @spider = Spider.new
    @light = Light.new
    @idiot = Idiot.new
    @liar = Liar.new
  end

  def test_initialize
    assert_equal(5, @spider.size, 'different size')
    assert_equal(5, @light.size, 'different size')
    assert_equal(2, @idiot.size, 'different size')
    assert_equal(2, @liar.size, 'different size')
  end

  def test_add_card
    @spider.add_card(Card.new("Nine"))
    assert_equal(true, @spider.contains?("Nine"), 'value not added')
    assert_not_equal(true, @spider.complete?, 'incorrect evaluation')

    @spider.add_card(Card.new("Two"))
    @spider.add_card(Card.new("Ace"))
    @spider.add_card(Card.new("King"))
    @spider.add_card(Card.new("Nine"))
    assert_not_equal(true, @spider.complete?, 'incorrect evaluation')
    assert_not_equal(5, @spider.cards.size, 'extra value added')

    @spider.add_card(Card.new("Queen"))
    assert_equal(true, @spider.complete?, 'incorrect evaluation')


  end
end