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
    nine = Card.new("Nine")
    two = Card.new("Two")
    ace = Card.new("Ace")
    king = Card.new("King")
    ten = Card.new("Ten")

    #test Spider class

    @spider.add_card(nine)
    assert_equal(true, @spider.contains?(nine), 'value not added')
    assert_not_equal(true, @spider.complete?, 'incorrect evaluation')

    @spider.add_card(two)
    assert_equal(true, @spider.contains?(two), 'value not added')
    assert_not_equal(true, @spider.complete?, 'incorrect evaluation')
    assert_equal(true, @spider.contains?(nine), 'value removed')
    assert_not_equal(true, @spider.complete?, 'incorrect evaluation')
    assert_equal(nil, @spider.evaluate, 'hand evaluated when not complete')

    @spider.add_card(ace)
    @spider.add_card(king)
    @spider.add_card(nine)
    assert_not_equal(true, @spider.complete?, 'incorrect evaluation')
    assert_not_equal(5, @spider.cards.size, 'extra value added')

    @spider.add_card(ten)
    assert_equal(5, @spider.cards.size, 'extra value added')

    assert_equal(0, @spider.value(ten), 'different value found')
    assert_equal(1, @spider.value(king), 'different value found')

    assert_equal(0, @spider.evaluate, 'hand evaluated when not complete')
  end
end