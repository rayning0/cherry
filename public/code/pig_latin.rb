def translate(s)
  pig = []
  vowels = %w[a e i o u]
  consonants = ('a'..'z').to_a - vowels

  s.split.each do |word|
    c = 0
    len = word.length - 1

    if vowels.include?(word[0])   # if word's first character is vowel, add 'ay' to its end
      pig << punctcheck( capcheck(word + 'ay') )
    end

    if word[0..2].downcase == 'squ' 
      pig << punctcheck( capcheck(word[3..len] + word[0..2] + 'ay') )
      next  # go back to "each" above and continue loop
    end

    if word[0..1].downcase == 'qu' 
      pig << punctcheck( capcheck(word[2..len] + word[0..1] + 'ay') )
      next
    end

    while consonants.include?(word[c].downcase) 
      c += 1    # counts # of consecutive consonants at start of word
    end

    if c > 0    # if first character(s) are consonants, move them to end and add 'ay'
      pig << punctcheck( capcheck(word[c..len] + word[0..c - 1] + 'ay') )
    end

  end

  pig.join(' ')
end

def capcheck(word)
  capitals = /[A-Z]/
  # if Pig Latin word has a capital, make 1st letter capital and rest lowercase. Otherwise, return same word
  word.match(capitals) ? word.capitalize! : word 
end

def punctcheck(word)
  punctuation = /[^A-Za-z0-9_]/
  punc = word.index(punctuation)    # index where there's a punctuation mark
  if !punc.nil?   # if punctuation mark in word exists
    mark = word.slice(punc)   # actual punctuation mark in word
    word.slice!(punc)   # remove punctuation mark from word
    word += mark  # add mark to end of the word
  end
  word
end