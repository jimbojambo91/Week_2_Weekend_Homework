require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../rooms')
require_relative('../songs')
require_relative('../guests')

class TestRooms < Minitest::Test

  def setup
    @song_1 = Songs.new("Living on a prayer", "Bon Jovi")
    @guest_1 = Guest.new("Larry")
    @room_1 = Rooms.new()
  end

  def test_check_in_guest
    @room_1.check_in_guest(@guest_1)
    assert_equal([@guest_1], @room_1.guests)
  end

  def test_check_out_guest
    @room_1.check_in_guest(@guest_1)
    @room_1.check_out_guest(@guest_1)
    assert_equal(0, @room_1.guests.length)
  end

  def test_check_out_guest_fail
    @room_1.check_in_guest(@guest_1)
    @room_1.check_out_guest("Steve")
    assert_equal(1, @room_1.guests.length)
  end

  def test_add_song_to_playlist
    @room_1.add_song_to_playlist(@song_1)
    assert_equal([@song_1], @room_1.playlist)
  end


end