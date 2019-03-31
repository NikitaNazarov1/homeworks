def task_4(str)
  result = 0
  str.each_char { |ch| result += ch.to_i }
  result
end
