class Guest

  attr_reader :guest_name, :guest_money

  def initialize(guest_name, money=5, fav_song=nil)
    @guest_name = guest_name
    @guest_money = money
    @fav_song = fav_song
  end

  def enough_money(price)
    return true if @guest_money >= price
    return false
  end

  def pay(price)
    if enough_money(price) == true
      @guest_money -= price
    else
      "You can't afford that"
    end
  end

  def favourite_song_in_playlist(room)
    if room.playlist.include?(@fav_song)
      return "Woo"
    else
      return room.playlist, @fav_song
    end
  end

end
