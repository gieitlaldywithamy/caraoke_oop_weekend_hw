class Room

  attr_reader :room_name, :playlist, :guests, :entry

  def initialize(name, capacity, occupants=[])
    @room_name = name
    @capacity = capacity
    @guests = occupants
    @playlist = []
    @entry = 5
  end

  def add_song(song)
    if @playlist.include? song
      return "Song has already been bagsied!"
    else
      @playlist << song
    end
  end

  def guest_count()
    return @guests.length
  end

  def enough_space
    return @capacity > @guests.length
  end

  def check_in(guest)
    if enough_space && guest.enough_money(@entry)
      @guests.push(guest)
      guest.pay_entry_free(@entry)
    end
  end

  def check_out(guest)
    @guests.delete(guest) unless !@guests.include?(guest)
  end
end
