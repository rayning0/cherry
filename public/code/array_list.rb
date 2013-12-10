# Create a method on array called `list` that iterates over the array it is
# called on and appends a number, a period, and a space to each element.
# asdkasdkasdk
# e.g ["ich", "ni", "san"].make_list #=> ["1. ich", "2. ni", "3. san"]

class Array

  # Define your list method here.

  # Hint: remember that self is a way to refer to the Array itself.
  # Look at is_between.rb file for a reminder on how you might use
  # self.
  def make_list
    result = []
    self.each_with_index do |a, i|
      result << "#{i + 1}. #{a}" 
    end
    result
  end
end




