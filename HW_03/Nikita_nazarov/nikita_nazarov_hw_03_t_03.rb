require 'date'

def task_3(str)
  result = 0
  count = 0
  actions = []
  str.each_line do |x|
    next unless x.include?('Calling core with action:') == true

    count += 1
    actions << x[/^.* u/].delete_suffix!('u')
    result = time(actions) if count == 2
  end
   result.to_s
end

def time(arr)
  firstevent = DateTime.strptime(
    arr[1].insert(-1, '0'),
    '%Y-%m-%d %H:%M:%S.%L'
  ).strftime('%Q').to_i
  secondevent = DateTime.strptime(
    arr[0].insert(-1, '0'),
    '%Y-%m-%d %H:%M:%S.%L'
  ).strftime('%Q').to_i
  ((firstevent - secondevent) / 1000.0).round(1)
end
