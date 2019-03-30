def task_2(str)
  res = []
  str.each_line do |s|
    d = s[/[\[].*[\]]/]
    ip = s[/^.* - -/]
    way = s[/T .* H/]
    if d && ip && way
      res << changedate(d) + ' FROM: ' + changeip(ip) + ' TO:' + changeway(way)
    end
  end
  res
end

def changedate(dat)
  dat.delete_prefix!('[').delete_suffix!(']')
end

def changeway(des)
  des.delete_prefix!('T').delete_suffix!(' H').upcase
end

def changeip(sen)
  sen.delete_suffix!(' - -')
end
