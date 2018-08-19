class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(attributes)
    attributes.each {|key, val| self.send(("#{key}="), val)}
    self.save
    self
  end

  def self.create(name)
    song = self.new(name)
    song
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
