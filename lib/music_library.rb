class MusicLibraryController

  def initialize(filepath = './db/mp3s')
    importer = MusicImporter.new(filepath)
    importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip
    possible = ["list songs", "list artists", "list genres", "list artist", "list genre", "play song", "exit"]
    if possible.include?(input) && input != "exit"
      input.split(" ")
      self.send("#{input[0]}_#{input[1]}")
      call
    end
    call
  end

  def list_songs
    songs = Song.all.sort {|x, y| x.name <=> y.name}
    songs.each_with_index do |val, index|
      puts "#{index + 1}. #{val.artist.name} - #{val.name} - #{val.genre.name}"
    end
  end

end
