def changedate(dat)
  dat.delete_prefix!('[').delete_suffix!(']')
end

def changeway(des)
  des.delete_prefix!('T').delete_suffix!(' H').upcase
end

def changeip(sen)
  sen.delete_suffix!(' - -')
end

def task_2(str)
  str.each_line.map do |s|
    d = s[/[\[].*[\]]/]
    ip = s[/^.* - -/]
    way = s[/T .* H/]
    if d && ip && way
      changedate(d) + ' FROM: ' + changeip(ip) + ' TO:' + changeway(way)
    end
  end
end
