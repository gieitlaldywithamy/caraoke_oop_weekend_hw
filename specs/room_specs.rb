require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')

class TestRoom < Minitest::Test

  def setup
    @hen_party = Room.new("Hen Party", 6)
    @family_room = Room.new("Family", 10)

    @hen_guest = Guest.new("Leery Lisa")
    @frozen = Song.new({title: "Let it go", artist: "Demi Lovato"})

    @lonely_business_man = Guest.new("Mr i have worked so many hours this week, I have forgotten")
    @solo_room = Room.new("For 1 only", 1, [@lonely_business_man])
  end

  def test_room_has_name
    assert_equal("Hen Party", @hen_party.room_name)
  end

  def test_add_song
    # integration test: check length
    original_length_of_playlist = @family_room.playlist.length
    @family_room.add_song(@frozen)
    assert_equal(original_length_of_playlist+1, @family_room.playlist.length)
  end

  def test_num_guests
   assert_equal( 0, @hen_party.no_of_occupants)
 end

 def test_check_in
   @hen_party.check_in(@hen_guest)

   assert_equal([@hen_guest], @hen_party.occupants)
   assert_equal(1, @hen_party.no_of_occupants)
 end

 def test_check_in_room_full
   result = @solo_room.check_in(@hen_guest)
   assert_equal("No room at the inn for you", result)

 end

 def test_check_out
   @hen_party.check_in(@hen_guest)
   @hen_party.check_out(@hen_guest)
  assert_equal(0,@hen_party.no_of_occupants)
  assert_equal([], @hen_party.occupants)
 end

 def test_check_out
   @hen_party.check_in(@hen_guest)
   @hen_party.check_out(@hen_guest)
  assert_equal(0,@hen_party.no_of_occupants)
  assert_equal([], @hen_party.occupants)
 end

 def test_check_out_error_handle
   assert_nil(@hen_party.check_out(@hen_guest))
 end







end
