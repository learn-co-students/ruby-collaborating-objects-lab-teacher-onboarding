class Song
  attr_accessor :name, :genre, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(song)
    song_array = song.split(" - ")
    song_artist = song_array[0]
    song_title = song_array[1]
    song_genre = song_array[2]

    new_song = Song.new(song_title)
    song_artist_object = Artist.find_or_create_by_name(song_artist)
    song_artist_object.add_song(new_song)

    new_song.artist = song_artist_object
    new_song.genre = song_genre

    new_song
  end

end