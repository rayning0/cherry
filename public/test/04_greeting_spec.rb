require_relative '../spec_helper'
require_relative './greeting.rb' # Code your solution in this file

describe '#greeting' do
  it 'should say Good Morning! during the morning' do
    greeting(6).should eq 'Good Morning!'
  end

  it 'should say Good Afternoon! during the afternoon' do
    greeting(15).should eq 'Good Afternoon!'
  end

  it 'should say Good Night! during the night' do
    greeting(23).should eq 'Good Night!'
  end
end

describe '#morning?' do
  it 'should return true during the morning' do
    morning?(10).should be_true
  end

  it 'should return false during the night and afternoon' do
    morning?(22).should be_false
    morning?(14).should be_false
  end
end

describe '#afternoon?' do
  it 'should return true during the afternoon' do
    afternoon?(14).should be_true
  end

  it 'should return false during the morning and night' do
    afternoon?(8).should be_false
    afternoon?(22).should be_false
  end
end

describe '#night?' do
  it 'should return true during the night' do
    night?(22).should be_true
  end

  it 'should return false during the morning and afternoon' do
    night?(8).should be_false
    night?(14).should be_false
  end
end
