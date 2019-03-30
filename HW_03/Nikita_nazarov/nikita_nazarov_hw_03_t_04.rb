def task_4(str)
  result = 0
  str.each_char do |x|
    result += x.to_i
  end
  result
end
