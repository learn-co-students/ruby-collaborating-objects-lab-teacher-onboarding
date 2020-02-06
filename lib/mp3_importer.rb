class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = Dir.entries(path).filter { |e| e.end_with?(".mp3") }
  end

  def import
    @files.each { |f| Song.new_by_filename(f) }
  end
end
