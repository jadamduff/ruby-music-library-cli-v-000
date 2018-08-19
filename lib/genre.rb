class Genre
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    self.save
  end

  def self.create(name)
    genre = self.new(name)
    genre
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
