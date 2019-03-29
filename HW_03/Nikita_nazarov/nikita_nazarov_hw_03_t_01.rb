def task_1(str)
  str.each_line(&:chomp)
  str.each_line do |s|
    s =~ /error/i ? puts(s) : puts("")
  end
end
