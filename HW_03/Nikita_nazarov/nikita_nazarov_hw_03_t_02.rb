def task_2(str)
  res = []
  str.each_line do |s|
    date = s[/[\[].*[\]]/]
    sender = s[/^.* - -/]
    way = s[/T .* H/]
    if date && sender && way
      res << modifydate(date) + ' FROM: ' + modifysender(sender) + ' TO:' + modifyway(way)
    end
  end
  res
end

def modifydate(dat)
  dat.delete_prefix!('[').delete_suffix!(']')
end

def modifyway(des)
  des.delete_prefix!('T').delete_suffix!(' H').upcase
end

def modifysender(sen)
  sen.delete_suffix!(' - -')
end
