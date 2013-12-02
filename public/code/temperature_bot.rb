# Temperature bot is comfortable when it's room temperature.
# Figure out what the range for room temperature is based on
# the spec. Additionally, try to use ranges or a case statement.

def temperature_bot(t)
  case 
  when (15..21) === t 
    'comfortable'
  when t >= 22
    'hot'
  else
    'cold'
  end
end