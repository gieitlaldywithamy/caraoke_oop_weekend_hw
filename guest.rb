require_relative('bar')

class Guest

  attr_reader :guest_name
  attr_accessor :wallet

  def initialize(guest_name, money = 5, fav_song = nil)
    @guest_name = guest_name
    @wallet = money
    @favourite_song = fav_song
  end

  def can_afford(price)
    return @wallet >= price
  end

  def pay(price)
    if enough_money(price)
      pay_entry_free(price)
    else
      return "You can't afford that"
    end
  end

  def favourite_song_in_playlist(room)
    return "Woo I love #{@favourite_song.title}!" if room.playlist.include?(@favourite_song)
  end

  def pay_entry_free(entry_fee)
    @wallet -= entry_fee
  end
end
