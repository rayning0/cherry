class PlaylisterCLI
  attr_accessor :songs
  APPROVED_COMMANDS = [:list, :exit, :play, :help]

  def initialize
    LibraryParser.parse
    @on = true
  end
  
  def on?
    @on
  end
  
  def call
    while on?
      self.help
    end
  end

  def exit
    @on = false
  end
  
  def help
    puts "Enter list, help, exit or play"
    self.command_request
  end

  def command(input)
    send(input) if command_valid?(input)
  end

  def command_valid?(input)
    APPROVED_COMMANDS.include?(input.downcase.to_sym)
  end

  def list
    Song.all.each_with_index do |song,i|
      puts "#{i+1}. #{song}"
    end
  end

  def play
    puts "Please enter a song name or number. \n"
    play_song(user_input)
  end

  def play_song(song_to_play)
    if song_to_play.to_i > 0 
      puts "\nNow playing #{Song.all[song_to_play.to_i]}\n"
    else
      puts "\nNow playing #{Song.find_by_name(song_to_play)}"
    end
  end
  
  def command_request
    self.command(user_input)
  end

  def user_input
    gets.downcase.strip
  end
end