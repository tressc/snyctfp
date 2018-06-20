# using Ruby's native sort_by
def sort_by_strings(s, t)
  s.chars.sort_by { |ch| t.index(ch) }.join
end

# using bubble-sort
def sort_by_strings(s, t)
  sorted = false
  until sorted
    sorted = true
    (s.length - 1).times do |i|
      if t.index(s[i]) > t.index(s[i + 1])
        s[i], s[i + 1] = s[i + 1], s[i]
        sorted = false
      end
    end
  end
  s
end
