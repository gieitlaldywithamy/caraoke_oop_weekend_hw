class Room

  attr_reader :room_name, :playlist, :guests, :entry, :capacity

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
    @capacity > @guests.length ? true : false
  end

end
