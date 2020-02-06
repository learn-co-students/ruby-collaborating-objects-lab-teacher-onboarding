class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @artist = nil
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    artist, name = filename[0..-5].split(" - ")
    song = self.new(name)
    song.artist_name=artist
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
end
