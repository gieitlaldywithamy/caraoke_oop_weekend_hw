require('minitest/autorun')
require('minitest/rg')

require_relative('../guest')
require_relative('../room')
require_relative('../song')

class TestGuest < Minitest::Test
  def setup
    @guest1 = Guest.new("Princess Genevive")
    @guest2 = Guest.new("Haruki Murakmi")

    @guest3 = Guest.new("King of the Styx")
    @guest4 = Guest.new("Mr i have worked so many hours this week, I have forgotten")
    @guests = [@guest1, @guest2, @guest3]

    @hen_party = Room.new("Hen Party", 6)
    @family_room = Room.new("Family", 10, @guests)
    @solo_room = Room.new("For 1 only", 1)
    @frozen = Song.new({title: "Let it go", artist: "Demi Lovato"})
  end

  def test_guest_name
    assert_equal("Princess Genevive", @guest1.guest_name)
  end

  

end
