require('minitest/autorun')
require('minitest/rg')

require_relative('../guest')
require_relative('../room')
require_relative('../song')

class TestGuest < Minitest::Test
  def setup
    @frozen = Song.new({title: "Let it go", artist: "Demi Lovato"})

    @guest1 = Guest.new("Princess Genevive")
    @guest2 = Guest.new("Alice", 3, @frozen)

    @guest3 = Guest.new("King of the Styx")
    @guest4 = Guest.new("Mr i have worked so many hours this week, I have forgotten")
    @guests = [@guest1, @guest2, @guest3]

    @hen_party = Room.new("Hen Party", 6)
    @family_room = Room.new("Family", 10, @guests)
    @solo_room = Room.new("For 1 only", 1, [@lonely_business_man])




  end

  def test_guest_name
    assert_equal("Princess Genevive", @guest1.guest_name)
  end

  def test_guest_money
    assert_equal(5, @guest1.guest_money)
  end

  def test_guest_enough_money
    assert_equal(true, @guest1.enough_money(@hen_party.entry))
  end
  
  def test_guest_favourite_song
    @family_room.add_song(@frozen)
    assert_equal("Woo", @guest2.favourite_song_in_playlist(@family_room))
  end

end
