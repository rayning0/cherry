# Write a method `count_sentences` that returns the number of
# sentences in the string.

def count_sentences(text)
  # covers sentences that end with a ., ?, or !
  text.split(/[.?!]/).count   
end
