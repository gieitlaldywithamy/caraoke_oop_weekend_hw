class Room

  attr_reader :room_name, :playlist, :occupants

  def initialize(name, capacity, occupants=[])
    @room_name = name
    @capacity = capacity
    @occupants = occupants
    @playlist = []
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

  def room_full()
    return no_of_occupants == @capacity
  end

  def check_in(guest)
    return "No room at the inn for you" if room_full
    @occupants.push(guest) unless @occupants.include?(guest)
  end
end
