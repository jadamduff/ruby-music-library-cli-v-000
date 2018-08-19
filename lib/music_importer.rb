class MusicImporter
  attr_accessor :path
  attr_reader :files

  def initialize(filepath)
    @path = path
  end

  def files
    @files = Dir.entries(self.path)
  end
end
