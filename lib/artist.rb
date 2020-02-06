class Artist
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist_name = self.name
  end

  def songs
    Song.all.filter { |e| e.artist && e.artist.name == self.name }
  end

  def self.find_or_create_by_name(name)
    artist = @@all.find { |e| e.name == name }
    artist || Artist.new(name)
  end

  def print_songs
    puts songs.map {|e| e.name}.join("\n")
  end
end
