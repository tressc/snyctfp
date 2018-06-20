def decode_string(s)
  if s.count("[") == 1
    return parse_string(s)
  end
  new_s = ""
  first_bracket = s.index("[")
  current_int = s[0...first_bracket].to_i
  remaining_s = s[(first_bracket + 1)..-1]
  next_int = find_integer_start(remaining_s)
  inner_s = remaining_s[0...next_int]
  next_s = remaining_s[next_int..-1]
  current_int.times do
    new_s << inner_s + decode_string(next_s)
  end
  return new_s
end

def find_integer_start(s)
  # finds the start index of a potentially multi-digit integer
  digits = "0123456789"
  next_bracket = s.index("[")
  int_start = next_bracket - 1
  while digits.include?(s[int_start - 1])
    int_start -= 1
  end
  return int_start
end

def parse_string(s)
  new_s = ""
  open_index = s.index("[")
  close_index = s.index("]")
  inner_s = s[(open_index + 1)...close_index]
  int = s[0...open_index].to_i
  int.times do
    new_s << inner_s
  end
  return new_s
end
