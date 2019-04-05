# task 1
def fib(first, second, num)
  num.zero? ? first : fib(second, first + second, num - 1)
end

def task_4_1(number)
  (1..number).map { |n| fib(0, 1, n) }
end
