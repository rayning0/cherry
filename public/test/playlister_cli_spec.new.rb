require_relative '../code/playlister_cli.rb'


describe "Playlister CLI" do
  let(:playlister){PlaylisterCLI.new}

  it 'loads the LibraryParser on initialization' do
    LibraryParser.should_receive(:parse)
    playlister
  end

  it 'is on when created' do
    playlister.on?.should be_true
  end

  it 'asks for help first' do
    playlister.should_receive(:user_input).and_return(:exit)
    STDOUT.should_receive(:puts).with(/help/)
    playlister.call
  end

  it 'turns off on exit' do
    playlister.exit
    playlister.should_not_receive(:help)
    playlister.call
  end

  it 'asks for input on help' do
    playlister.should_receive(:command_request)
    STDOUT.should_receive(:puts)
    playlister.help
  end

  it 'validates input commands' do
    playlister.command_valid?(:help).should be_true
    playlister.command_valid?("NOT A COMMAND").should be_false
  end

  it 'sends valid commands do jukebox' do
    playlister.should_receive(:help)
    playlister.command("help")
  end

  it 'asks for songs to play' do
    playlister.should_receive(:play_song)
    playlister.should_receive(:user_input)
    STDOUT.should_receive(:puts).with(/song/)
    playlister.play
  end

  it 'plays a valid song' do
    STDOUT.should_receive(:puts).twice.with(/Now/)
    playlister.play_song(1)
    playlister.play_song("Romance")
  end 

  it 'lists out all the songs' do
    STDOUT.should_receive(:puts).at_least(:once)
    playlister.list
  end

  it 'asks for user input' do
    playlister.should_receive(:gets).and_return("command")
    playlister.user_input
  end
end
