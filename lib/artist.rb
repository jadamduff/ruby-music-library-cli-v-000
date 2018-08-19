class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)any
    @name = name
    self.save
    @songs = []
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end

  def self.create(name)
    artist = self.new(name)
    artist
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
