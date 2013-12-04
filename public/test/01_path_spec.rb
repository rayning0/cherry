  require_relative "../spec_helper"
require_relative "./path.rb" # Code your solution here.

# Code some tests for path.rb.

# There are three methods on the Path class.

# The normalize_path method will return an absolute
# path to the file no matter what kind of path sent
# to it.

# The absolute_path? method will return true if the
# path passed to it is absolute.

# The relative_path? method will return true if the 
# path passed to it is relative.

# Write some test that spec it out.

# Use the other tests in this suite to complete this.

# You should should write at least three describe blocks, 
# one for each method.

# Test the negative and positive results, for example,
# when describing absolute_path? make sure to test
# the results when sent a relative and absolute path.

describe Path, "#normalize path" do
  it "should normalize a relative path" do 
    path = '005.todo'
    Path.new(path).normalize_path.should eq("#{Dir.pwd}/005.todo")
  end

  it "should do nothing to an absolute path" do 
    path = "#{Dir.pwd}/005.todo"
    Path.new(path).normalize_path.should eq("#{Dir.pwd}/005.todo")
  end
end

describe Path, "#relative path" do
  it "should return true for relative path" do 
    path = '005.todo'
    Path.new(path).relative_path?.should eq(true)
  end

  it "should return false for relative path" do 
    path = "#{Dir.pwd}/005.todo"
    Path.new(path).relative_path?.should eq(false)
  end
end

describe Path, "#absolute path" do
  it "should return false for absolute path" do 
    path = '005.todo'
    Path.new(path).absolute_path?.should eq(false)
  end

  it "should return true for absolute path" do 
    path = "#{Dir.pwd}/005.todo"
    Path.new(path).absolute_path?.should eq(true)
  end
end

