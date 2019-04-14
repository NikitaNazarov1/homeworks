require 'json'
require 'net/http'
require_relative 'homeworks'
# class Student
class Student < Human
  attr_reader :homeworks, :counter

  def initialize(fullname)
    @fullname = fullname
    @homeworks = {}
    @counter = 0
  end

  def add_hw(homework)
    @counter += 1
    @homeworks[@counter] = homework
  end

  def make_hw
    puts "#{@fullname}, please, enter your source code: "
    homework = gets.chomp
    puts "#{@fullname}, please, enter pr_title:"
    pr = gets.chomp
    Homeworks.new(code: homework, student: @fullname, pull_r: pr).tap do |h|
      add_hw(h)
    end
  end

  def submit_homework(homework: Homeworks.new)
    hash = {
      "homework_source": homework.code,
      "student": @fullname,
      "pr_title": homework.pull_r
    }
    url = URI('https://www.example.com')
    Net::HTTP.post(url, hash.to_json)
  end
end
