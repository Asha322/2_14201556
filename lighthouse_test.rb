require 'test/unit'
require_relative 'lighthouse.rb'
class LighthouseTest < Test::Unit::TestCase
  def setup
    @light_house = LightHouse.new
  end
  def test_initialize
    assert(@light_house.on_or_off? == :OFF,'new lighthouse not off')
  end
  def test_press_button
    @light_house.press_button
    assert_equal(true, @light_house.on_or_off? == :ON, 'lighthouse not on')

    @light_house.press_button
    assert_not_equal(true, @light_house.on_or_off? == :ON, 'lighthouse not off')
  end
end