class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    name, song_name, genre = file_name.split(" - ")
    new_song = self.new(song_name)
    new_song.artist_name = name
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end
end
