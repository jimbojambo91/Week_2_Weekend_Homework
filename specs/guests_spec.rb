require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../guests')

class TestGuest < Minitest::Test

  def setup
    @guest_1 = Guest.new("Larry")
  end

  def test_guest_name
    assert_equal("Larry", @guest_1.name)
  end

end