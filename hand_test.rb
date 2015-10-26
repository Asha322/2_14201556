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

  def test_spider
    nine = Card.new("Nine")
    two = Card.new("Two")
    ace = Card.new("Ace")
    king = Card.new("King")
    ten = Card.new("Ten")
    three = Card.new("Three")

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

    @spider.add_card(three)
    assert_equal(false, @spider.contains?(three), 'extra value added')

    assert_equal(0, @spider.value(ten), 'different value found')
    assert_equal(1, @spider.value(king), 'different value found')

    assert_equal(0, @spider.evaluate, 'hand evaluated evaluated incorrectly')
    assert_not_equal(nil, @spider.evaluate, 'hand is not complete')
  end

  def test_light
    nine = Card.new("Nine")
    two = Card.new("Two")
    ace = Card.new("Ace")
    king = Card.new("King")
    ten = Card.new("Ten")
    three = Card.new("Three")

    #test Light class

    @light.add_card(nine)
    assert_equal(true, @light.contains?(nine), 'value not added')
    assert_not_equal(true, @light.complete?, 'incorrect evaluation')

    @light.add_card(two)
    assert_equal(true, @light.contains?(two), 'value not added')
    assert_not_equal(true, @light.complete?, 'incorrect evaluation')
    assert_equal(true, @light.contains?(nine), 'value removed')
    assert_not_equal(true, @light.complete?, 'incorrect evaluation')
    assert_equal(nil, @light.evaluate, 'hand evaluated when not complete')

    @light.add_card(ace)
    @light.add_card(king)
    @light.add_card(nine)
    assert_not_equal(true, @light.complete?, 'incorrect evaluation')
    assert_not_equal(5, @light.cards.size, 'extra value added')
    assert_equal(4, @light.cards.size, 'value missed or extra value added')

    @light.add_card(ten)
    assert_equal(5, @light.cards.size, 'extra value added')

    @light.add_card(three)
    assert_equal(false, @light.contains?(three), 'extra value added')

    assert_equal(11, @light.value(ten), 'different value found')
    assert_equal(6, @light.value(king), 'different value found')

    assert_equal(13, @light.find_max, 'max found incorrectly')
    assert_equal(1, @light.find_min, 'min found incorrectly')
    assert_equal(2.8, @light.evaluate, 'hand evaluated incorrectly')
    assert_not_equal(nil, @light.evaluate, 'hand is not complete')
  end

  def test_idiot
    nine = Card.new("Nine")
    two = Card.new("Two")
    ace = Card.new("Ace")

    #test Idiot class

    @idiot.add_card(nine)
    assert_equal(true, @idiot.contains?(nine), 'value not added')
    assert_not_equal(true, @idiot.complete?, 'incorrect evaluation')

    @idiot.add_card(nine)
    assert_not_equal(true, @idiot.complete?, 'extra value added')

    @idiot.add_card(two)
    assert_equal(true, @idiot.contains?(two), 'value not added')
    assert_equal(true, @idiot.complete?, 'incorrect evaluation')

    @idiot.add_card(ace)
    assert_equal(false, @idiot.contains?(ace), 'extra value added')

    assert_equal(9, @idiot.value(nine), 'different value found')

    assert_equal(2, @idiot.cards.size, 'wrong hand size')
    
    #assert_equal(9, @light.find_max, 'max found incorrectly')
    #assert_equal(2, @light.find_min, 'min found incorrectly')
    #assert_equal(5.5, @light.evaluate, 'hand evaluated incorrectly')
  end
  
  def test_liar
    nine = Card.new("Nine")
    two = Card.new("Two")
    ace = Card.new("Ace")

    #test Liar class

    @liar.add_card(nine)
    assert_equal(true, @liar.contains?(nine), 'value not added')
    assert_not_equal(true, @liar.complete?, 'incorrect evaluation')

    @liar.add_card(nine)
    assert_not_equal(true, @liar.complete?, 'extra value added')

    @liar.add_card(two)
    assert_equal(true, @liar.contains?(two), 'value not added')
    assert_equal(true, @liar.complete?, 'incorrect evaluation')

    @liar.add_card(ace)
    assert_equal(false, @liar.contains?(ace), 'extra value added')

    assert_equal(5, @liar.value(nine), 'different value found')

    assert_equal(2, @liar.cards.size, 'wrong hand size')

    #assert_equal(12, @light.find_max, 'max found incorrectly')
    #assert_equal(5, @light.find_min, 'min found incorrectly')
    #assert_equal(5.5, @light.evaluate, 'hand evaluated incorrectly')
  end
end