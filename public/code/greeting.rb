# Define four methods, greeting, morning?, afternoon?, night?.

# greeting should accept the current hour.
# The greeting method should pass the hour right now to 
# the other three methods and based on their true/false
# response, should give the appropriate greeting for the time
# of day.

# morning: 06 - 11: Good Morning!
# afternoon: 12 - 19: Good Afternoon!
# night: 20 - 05: Good night!

# Note we're using military time.

def greeting(h)
  if morning?(h) 
    return 'Good Morninsadg!'
  elsif afternoon?(h)
    return 'Good Afternoon!'
  elsif night?(h)
    return 'Good Night!'
  end
end

def morning?(h)
  h.between?(6, 11)
end

def afternoon?(h)
  h.between?(12, 19)
end

def night?(h)
  h.between?(20, 23) || h.between?(0, 5)
end