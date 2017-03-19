require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../guests')

class TestGuest < Minitest::Test

  def setup
    @guest_1 = Guest.new("Larry", 100, "Year of the cat")
  end

  def test_guest_name
    assert_equal("Larry", @guest_1.name)
  end

  def test_guest_has_cash
    assert_equal(100, @guest_1.money)
  end

end