def task_1(str)
  result = ''
  # str.each_line(&:chomp)
  str.each_line do |s|
    s =~ /error/i ? result = s : result
  end
  result
end
