require 'yaml'
def res(nam, datb, user, pas, mag)
  { nam => { db: datb, user: user, password: pas, magic_number: mag }.delete_if { |_key, value| value.nil? } }
end

def parse(con, key)
  k = con.key(con[key])
  dbs = con[key]['database']
  use = con[key]['username']
  pass = con[key]['password']
  m = con[key]['pool'].to_i * con[key]['timeout'].to_i
  res(k, dbs, use, pass, m)
end

def task_4_2(input)
  config = YAML.safe_load(input)
  config.each_key do |key|
    parse(config, key)
  end
end
