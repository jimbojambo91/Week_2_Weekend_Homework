require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../rooms')
require_relative('../songs')
require_relative('../guests')

class TestRoom < Minitest::Test

  def setup
    @song_1 = Song.new("Living on a prayer", "Bon Jovi")
    @guest_1 = Guest.new("Larry", 100)
    @guest_2 = Guest.new("Steve", 50)
    @guest_3 = Guest.new("John", 10)
    @room_1 = Room.new(2, 50)
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

  def test_add_song_to_playlist
    @room_1.add_song_to_playlist(@song_1)
    assert_equal([@song_1], @room_1.playlist)
  end

  def test_remove_song_from_playlist
    @room_1.add_song_to_playlist(@song_1)
    @room_1.remove_song_from_playlist(@song_1)
    assert_equal(0, @room_1.playlist.length)
  end

  def test_over_capacity_room
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    assert_equal("Sorry, Room is full", @room_1.check_in_guest(@guest_3))
  end

  def test_guest_can_pay_for_room
    @room_1.check_in_guest(@guest_1)
    assert_equal(50, @guest_1.money)
  end

  def test_guest_cant_pay_for_room
    result = @room_1.check_in_guest(@guest_3)
    assert_equal("Not tonight mate", result)
  end


end