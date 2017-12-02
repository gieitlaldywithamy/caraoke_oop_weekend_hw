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

 def test_check_in
   @hen_party.check_in(@hen_guest)
   assert_equal([@hen_guest], @hen_party.guests)
   assert_equal(1, @hen_party.guest_count)
   assert_equal(0, @hen_guest.wallet)
 end

 def test_check_in_room_full
   result = @solo_room.check_in(@hen_guest)
   assert_equal("Sorry, no entry", result)
 end

 def test_check_out
   @hen_party.check_in(@hen_guest)
   @hen_party.check_out(@hen_guest)
   assert_equal(0,@hen_party.guest_count)
   assert_equal([], @hen_party.guests)
 end

 def test_check_out
   @hen_party.check_in(@hen_guest)
   @hen_party.check_out(@hen_guest)
   assert_equal(0,@hen_party.guest_count)
   assert_equal([], @hen_party.guests)
 end

 def test_check_out_error_handle
   assert_nil(@hen_party.check_out(@hen_guest))
 end

 def test_group_check_in
   @hen_party.group_check_in(@guests)
   #checking in will reduce guest wallets
   altered_guests = @guests.each{|guest| guest.wallet = 0}
   assert_equal(altered_guests, @hen_party.guests)
 end

 def test_group_check_in_not_space
   @double_room.group_check_in(@guests)
   assert_equal([], @double_room.guests)
 end

 def test_group_entry_one_cant_afford
   @hen_party.group_check_in(@guests_with_poor)
   assert_equal([], @hen_party.guests)
 end

end
