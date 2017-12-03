require('minitest/autorun')
require('minitest/rg')

require_relative('../guest')
require_relative('../room')
require_relative('../song')
require_relative('../bar')

class TestBar< Minitest::Test

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

    #Bar
    @bar = Bar.new([@hen_party, @family_room, @solo_room, @double_room])
  end

  def test_check_in
    @bar.check_in(@hen_guest, @hen_party)
    assert_equal([@hen_guest], @hen_party.guests)
    assert_equal(1, @hen_party.guest_count)
    assert_equal(0, @hen_guest.wallet)
    assert_equal(5, @bar.till)
  end

  def test_check_in_room_full
    result = @bar.check_in(@hen_guest, @solo_room)
    assert_equal("Sorry, no entry", result)
  end

  def test_check_out
    @bar.check_in(@hen_guest, @hen_party)
    @bar.check_out(@hen_guest, @hen_party)
    assert_equal(0,@hen_party.guest_count)
    assert_equal([], @hen_party.guests)
  end


  def test_check_out_error_handle
    assert_nil(@bar.check_out(@hen_guest, @hen_party))
  end

  def test_group_check_in
    @bar.group_check_in(@guests, @hen_party)
    #checking in will reduce guest wallets
    altered_guests = @guests.each{|guest| guest.wallet = 0}
    assert_equal(altered_guests, @hen_party.guests)
  end

  def test_group_check_in_not_space
    @bar.group_check_in(@guests, @double_room)
    assert_equal([], @double_room.guests)
  end

  def test_group_entry_one_cant_afford
    @bar.group_check_in(@guests_with_poor, @hen_party)
    assert_equal([], @hen_party.guests)
  end

  def test_group_check_out
    assert_equal(@guests, @family_room.guests)
    @bar.group_check_out(@guests, @family_room)
    assert_equal([], @family_room.guests)
  end

  def test_find_most_profitable_room
    assert_equal(@double_room, @bar.find_most_profitable_room([@guest1, @guest2]))
  end
end
