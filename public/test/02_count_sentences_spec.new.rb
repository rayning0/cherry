require_relative '../code/count_sentences.rb'
describe "#count_sentences" do

  it  "should return the number of sentences in a string" do
    count_sentences("one. two. three?").should eq(3)
  end

  it "should return zero if there are no sentences in a string" do
    count_sentences("").should eq(0)
  end

end
