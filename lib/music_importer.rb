class MusicImporter
  attr_accessor :path
  attr_reader :files

  def initialize(filepath)
    @path = path
  end

  def files
    files = Dir.entries(self.path)
    files.delete_if {|file| file == "." || file == ".."}
  end
end
