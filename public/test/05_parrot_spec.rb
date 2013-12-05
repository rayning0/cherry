require_relative '../spec_helper'
require_relative './parrot.rb' # Code your solution in this file

describe '#parrot' do
  it 'should say "Squawk!" by default' do
    $stdout.should_receive(:puts).with("Squawk!")

    parrot
  end

  it 'should return the default phrase' do
    phrase = parrot

    phrase.should == "Squawk!"
  end

  it 'should output the given phrase' do
    $stdout.should_receive(:puts).with("Pretty bird!")

    parrot("Pretty bird!")
  end

  it 'should return the given phrase' do
    phrase = parrot("Pretty bird!")

    phrase.should == "Pretty bird!"
  end
end
