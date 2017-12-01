class Room

  attr_reader :room_name, :playlist, :occupants

  def initialize(name, capacity, occupants=[])
    @room_name = name
    @capacity = capacity
    @occupants = occupants
    @playlist = []
    @room_entry = 5
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
    return "No room at the inn for you" if !enough_space
    return "No money, no entry" if guest.guest_money < @room_entry
    if !@occupants.include?(guest)
      @occupants.push(guest)
      guest.guest_money -= @room_entry
    end
  end

  def check_out(guest)
    @occupants.delete(guest) unless !@occupants.include?(guest)
  end
end
