  # Build a method to sort_animals by whether they live in the sea
# or on land.

# Your method should account for the species in the test suite.

# Return an array that contains two arrays, the first one
# should include the sea creatures, the second, land animals.

# Read the test suite for an example of a nested array.

def sort_animals(animals)
  animalhash = {"marlin" => "sea", "aardvark" => "land", "octopus" => "sea", 
    "cat" => "land", "fish" => "sea", "elephant" => "land", "rabbit" => "land"}
  sorted, sea, land = [], [], []
  animals.each do |animal|
    sea << animal if animalhash[animal] == 'sea'
    land << animal if animalhash[animal] == 'land'
  end
  sorted << sea << land
end
