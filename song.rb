class Song

  attr_reader :title
  
  def initialize(song)
    @title = song[:title]
    @artist = song[:artist]
  end

end
