require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../rooms')
require_relative('../songs')
require_relative('../guests')

class TestRoom < Minitest::Test

  def setup
    @song_1 = Song.new("Living on a prayer", "Bon Jovi")
    @song_2 = Song.new("Bridge over troubled water", "Simon & Garfunkel")
    @song_3 = Song.new("PIMP", "50 Cent")
    @guest_1 = Guest.new("Larry", 100, "Living on a prayer")
    @guest_2 = Guest.new("Steve", 50, "Hello")
    @guest_3 = Guest.new("John", 10, "Boston tea party")
    @guest_4 = Guest.new("Laura", 200, "I want to break free")
    @room_1 = Room.new("The Royal Room",2, 50)
    @room_2 = Room.new("The Rock Room",10, 10)
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
    assert_equal("You don't seem to have the funds to enter that room.", result)
  end

  def test_room_playing_favourtie_song
    @room_2.check_in_guest(@guest_1)
    @room_2.check_in_guest(@guest_2)
    @room_2.check_in_guest(@guest_3)
    @room_2.check_in_guest(@guest_4)
    @room_2.add_song_to_playlist(@song_1)
    @room_2.add_song_to_playlist(@song_2)
    @room_2.add_song_to_playlist(@song_3)
    assert_equal("Larry: This my jam!", @room_2.room_playing_favourite_song)
  end


end