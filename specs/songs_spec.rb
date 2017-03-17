require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../songs')

class TestSongs < Minitest::Test
  def setup
    @song_1 = Songs.new("Living on a prayer", "Bon Jovi")
  end

  def test_song_title
    assert_equal("Living on a prayer", @song_1.title)
  end

  def test_song_artist
    assert_equal("Bon Jovi", @song_1.artist)
  end

end