require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class TestSong < Minitest::Test

  def setup
    @macklemore = Song.new({title: "Thrift Shop", artist: "Macklemore"})
    @hanson = Song.new({title: "MMMBop", artist: "Hansen"})
    @hen_playlist = [@macklemore, @hanson]
  end

  def test_song_title
    assert_equal("Thrift Shop", @macklemore.title)
  end

  def test_song_artist
    assert_equal("Hansen", @hanson.artist)
  end
end
