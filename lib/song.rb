class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist_obj = nil)
    @name = name
    self.artist = artist_obj
    self.save
    self
  end

  def self.create(name)
    song = self.new(name)
    song
  end

  def artist=(artist)
    if artist_obj.is_a?(Artist)
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
