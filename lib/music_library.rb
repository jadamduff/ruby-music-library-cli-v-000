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
  end

  def list_songs
    songs = Song.all.sort {|x, y| x.name <==> y.name}
    songs.each_with_index do |val, index|
      puts "#{index + 1}. #{val.artist} - #{val.name} - #{val.genre}"
    end
    call
  end

end
