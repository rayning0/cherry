require_relative '../spec_helper'
require_relative './is_between.rb' # Code your solution in this file

describe Integer, "#is_between?" do

  it  "should return true if the number is between the two numbers" do
    15.is_between?(12, 18).should eq(true)
  end

  it "should return false if the number is not between the two numbers" do
    15.is_between?(2, 8).should eq(false)
  end

end
