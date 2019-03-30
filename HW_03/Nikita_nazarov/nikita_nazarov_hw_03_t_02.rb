def task_2(str)
  result = []
  str.each_line do |s|
    d = s[/[\[].*[\]]/]
    sender = s[/^[1234567890].* - -/]
    to = s[/T .* H/]
    if d && sender && to
      result << modifyd(d) + ' FROM: ' + sender[0..-4] + ' TO: ' + modifydes(to)
    end
  end
  result
end

def modifyd(dat)
  dat.delete_prefix!('[').delete_suffix!(']')
end

def modifydes(des)
  des.delete_prefix!('T').delete_suffix!('H').upcase
end
