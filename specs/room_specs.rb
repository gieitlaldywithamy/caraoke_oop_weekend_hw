require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class TestRoom < Minitest::Test

  def setup

    #guests
    @hen_guest = Guest.new("Leery Lisa")
    @lonely_business_man = Guest.new("Mr i have worked so many hours this week, I have forgotten")

    @guest1 = Guest.new("Princess Genevive")
    @guest2 = Guest.new("Alice", 5, @frozen)
    @guest3 = Guest.new("Mr X.")
    @guest4 = Guest.new("Miss Moon")
    @guests = [@guest1, @guest2, @guest3, @guest4]

    @poor_guest = Guest.new("Aylie", 3, @frozen)
    @guests_with_poor = [@guest1, @guest2, @guest3, @guest4, @poor_guest]
    #rooms
    @hen_party = Room.new("Hen Party", 6 )
    @family_room = Room.new("Family", 10, @guests)
    @solo_room = Room.new("For 1 only", 1, [@lonely_business_man])
    @double_room = Room.new("Pairs", 2)
    @rooms = [@hen_party, @family_room, @solo_room]

    #songs
    @frozen = Song.new({title: "Let it go", artist: "Demi Lovato"})


  end

  def test_room_has_name
    assert_equal("Hen Party", @hen_party.room_name)
  end

  def test_add_song
    original_length_of_playlist = @family_room.playlist.length
    @family_room.add_song(@frozen)
    assert_equal(original_length_of_playlist+1, @family_room.playlist.length)
  end

  def test_num_guests
   assert_equal( 0, @hen_party.guest_count())
 end

 def test_enough_space
   assert_equal(true, @hen_party.enough_space)
 end



end
