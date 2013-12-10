require_relative '../spec_helper'
require_relative './meal_choice.rb' # Code your solution in this file

describe '#meal_choice' do
  it 'should default to meat' do
    meal_choice.should == "meat"
  end

  it 'should allow you to set a meal' do
    meal_choice("vegan").should == "vegan"
  end
end
