

describe "Grandma", '#speak_to' do
  let(:grandma){Grandma.new}
  it 'responds with HUH?!  SPEAK UP, SONNY! unless you are shouting' do
    Grandma.new.speak_to('Hi Nana, how are you?').should eq 'HUH?!  SPEAK UP, SONNY!'
  end

  it 'responds with NO, NOT SINCE 1938! when she can hear you' do
    Grandma.new.speak_to('WHAT DID YOU EAT TODAY?').should eq "NO, NOT SINCE 1938!"
  end  
end
