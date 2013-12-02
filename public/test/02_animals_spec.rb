require_relative '../spec_helper'
require_relative './animals.rb' # Code your solution in this file

describe '#sort_animals' do
  animals = ["marlin", "aardvark", "octopus", "cat", "fish", "elephant"]

  it 'sorts sea and land animals' do
    sorted_animals = [
      ["marlin", "octopus", "fish"],
      ["aardvark", "cat", "elephant"]
    ]

    sort_animals(animals).should == sorted_animals
  end

  it 'returns sea creatures first' do
    sort_animals(animals).first.should include "marlin"
  end

  it 'returns land animals second' do
    sort_animals(animals).last.should include "aardvark"
  end

end
