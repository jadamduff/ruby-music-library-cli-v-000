class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    self.artist = artist
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

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end
end
