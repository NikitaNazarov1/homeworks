def task_2(str)
  res = []
  str.each_line do |s|
    d = s[/[\[].*[\]]/]
    send = s[/^.* - -/]
    to = s[/T .* H/]
    if d && send && to
      res << modifyd(d) + ' FROM: ' + send[0..-4] + 'TO:' + modifydes(to)
    end
  end
  res
end

def modifyd(dat)
  dat.delete_prefix!('[').delete_suffix!(']')
end

def modifydes(des)
  des.delete_prefix!('T').delete_suffix!(' H').upcase
end
