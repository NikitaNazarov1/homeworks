def task_2(str)
  result = []
  str.each_line do |s|
    date = s[/[\[].*[\]]/]
    sender = s[/^[1234567890].* - -/]
    dest = s[/T .* H/]
    if date && sender && dest
      result << date.delete_prefix!('[').delete_suffix!(']') + ' FROM: ' + sender[0..-4] + ' TO: ' + dest.delete_prefix!('T').delete_suffix!('H').upcase
    end
  end
  result
end
