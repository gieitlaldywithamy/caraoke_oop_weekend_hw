class Room

  attr_reader :room_name, :playlist, :occupants, :entry

  def initialize(name, capacity, occupants=[])
    @room_name = name
    @capacity = capacity
    @occupants = occupants
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



  def no_of_occupants()
    return @occupants.length
  end

  def enough_space
    return @capacity > occupants.length
  end

  def check_in(guest)

    if enough_space && guest.enough_money(@entry)
      @occupants.push(guest)
      guest.pay_entry_free(@entry)

    end
  end

  def check_out(guest)
    @occupants.delete(guest) unless !@occupants.include?(guest)
  end
end
