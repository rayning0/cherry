def echo(s)
  s
end 

def shout(s)
  s.upcase
end

def repeat(s, num = 2)  # default value of num = 2, unless different value passed in 
  output = []

  num.times do
    output << s
  end

  output.join(" ")  # turns array back into string
end

def start_of_word(s, num)
  s.split('').first(num).join  # cuts string into array of 1 letter elements, takes first num elements, then joins them into string
end

def first_word(s)
  s.split[0]
end

def titleize(s)
  littlewords = ['a', 'and', 'the', 'over', 'an', 'of']
  s.capitalize!     # capitalizes first word of title
  words = s.split   # chops up title into array of single words
  
  words.each do |word|

    # Capitalizes each word in title only if it's NOT a "little word." (Doesn't affect 1st word, which is already capitalized.)
    word.capitalize! if !littlewords.include?(word) 
  end

  words.join(' ')   # joins single words back into 1 string, separated by spaces
end