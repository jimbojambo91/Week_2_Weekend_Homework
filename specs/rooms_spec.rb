require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../rooms')

class TestRooms < Minitest::Test

  def setup
    @song_1 = Songs.new("Living on a prayer", "Bon Jovi")
    @guest_1 = Guest.new("Larry")
    @room_1 = Rooms.new()
  end

end