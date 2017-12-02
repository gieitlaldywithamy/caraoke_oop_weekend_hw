class Song

  attr_reader :title, :artist

  def initialize(song)
    @title = song[:title]
    @artist = song[:artist]
  end

end
