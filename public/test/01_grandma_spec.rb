require_relative '../spec_helper'
require_relative './grandma.rb' # Code your solution in this file

describe '#speak_to_grandma' do
  it 'responds with HUH?!  SPEAK UP, SONNY! unless you are shouting' do
    speak_to_grandma('Hi Nana, how are you?').should eq 'HUH?!  SPEAK UP, SONNY!'
  end

  it 'responds with NO, NOT SINCE 1938! when she can hear you' do
    speak_to_grandma('WHAT DID YOU EAT TODAY?').should eq "NO, NOT SINCE 1938!"
  end  
end



