class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
    self.save
  end

  def self.create(name)
    song = self.new(name)
    song
  end

  def artist=(artist)
    @artist = artist
    if self.artist != nil
      self.artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if genre != nil
      genre.songs << self if !genre.songs.include?(self)
    end
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}[0]
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end
end
