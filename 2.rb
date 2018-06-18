def decode_string(s)
  if s.count("[") == 1
    return parse_string(s)
  end

  new_s = ""
  first_bracket = s.index("[")
  remaining_s = s[(first_bracket + 1)..-1]
  second_bracket = remaining_s.index("[")
  inner_s = remaining_s[0...second_bracket - 1]
  next_s = remaining_s[(second_bracket - 1)..-1]
  int = s[0].to_i
  int.times do
    new_s << inner_s + decode_string(next_s)
  end
  return new_s
end

def parse_string(s)
  new_s = ""
  open_index = s.index("[")
  close_index = s.index("]")
  inner_s = s[(open_index + 1)...close_index]
  int = s[0].to_i
  int.times do
    new_s << inner_s
  end
  return new_s
end
