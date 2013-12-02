require_relative '../spec_helper'
require_relative "./array_list.rb" # Code your solution in this file

describe "Array", "#list" do

  let(:array) { ["eins", "zwei", "drei"] }

  it "should return an array" do
    array.make_list.should be_a(Array)
  end

  it "should return an array with the same number of elements" do
    array.make_list.length.should eq(array.length)
  end

  it "should put a number period and space before an element" do
    array.make_list.first.should start_with("1. ")
  end

  it "should put a number period and space before every element" do
    array.make_list.should eq(["1. eins", "2. zwei", "3. drei"])
  end

end