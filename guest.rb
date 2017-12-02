class Guest

  attr_reader :guest_name
  attr_accessor :guest_money

  def initialize(guest_name, money=5, fav_song=nil)
    @guest_name = guest_name
    @guest_money = money
    @favourite_song = fav_song
  end

  def enough_money(price)
    return @guest_money >= price
  end

  def pay(price)
    if enough_money(price)
      pay_entry_free(price)
    else
      return "You can't afford that"
    end
  end

  def favourite_song_in_playlist(room)
    return "Woo" if room.playlist.include?(@favourite_song)
  end

  def pay_entry_free(entry_fee)
    @guest_money -= entry_fee
  end
end
