require_relative 'homework'
require_relative 'human'
# class mentor
class Mentor < Human
  attr_accessor :notification, :subscribes, :notif_arr
  def initialize(_fullname)
    @notification = []
    @subscribes = []
    @notif_arr = []
    super
  end

  def subscribe_to_student(student)
    if subscribes.to_s.include?(student.fullname)
      puts 'already subscribe'
    else
      subscribes << student
      student.subscriber(self)
    end
  end

  def notifications
    notif_arr = []
    notification.each do |v|
      return 'not subscribe' unless @subscribes.to_s.include?(v.student)

      notif_arr << "notice:<#{v.status}> from student: #{v.student} sent: #{v.pull_r}"
    end
    puts notif_arr
    notif_arr
  end

  def check_homework(homework: Homework.new)
    if homework.code.eql?('qwe')
      puts result = 'Correct homework, congratulations!'
    else
      puts result = 'Incorrect homework'
    end
    result
  end

  def read_notifications!
    notification.map { |val| val.status = 'read' }
    notif_arr = []
    notification.each do |v|
      notif_arr << "notice:<#{v.status}> from student: #{v.student} sent: #{v.pull_r}"
    end
  end
end
