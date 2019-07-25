require "pry"

class MP3Importer
  attr_accessor :path


  def initialize(filepath)
    @path = filepath
  end

  def files
    all_files = Dir.entries(@path)
    # binding.pry
    all_files.select { |file| file.include?(".mp3")}
  end

  def import
    songs = files
    songs.each do |song|
      Song.new_by_filename(song)
    end
  end

end