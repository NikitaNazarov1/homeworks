require_relative 'homeworks'
require_relative 'notification'
# class mentor
class Mentor < Human
  attr_accessor :subscribe
  def initialize(_fullname)
    @subscribes = []
    @counter = 0
    @notif = {}
  end

  def subscribe_to_student(student)
    @subscribes << student
  end

  def get_hw(homework)
    return 'not subscribe' unless @subscribes.to_s.include?(homework.student)

    notifications(homework: homework)
  end

  def notifications(homework: Homeworks.new)
    return if homework.student.eql?('')

    @counter += 1
    @notif[@counter] = Notification.new(
      status: 'unread',
      student: homework.student,
      pull_r: homework.pull_r
    )
    @notif.each do |_key, v|
      puts "notice:<#{v.status}> from student: #{v.student} sent: #{v.pull_r}"
    end
  end

  def check_homework(homework: Homeworks.new)
    if homework.code.eql?('qwe')
      puts 'Correct homework, congratulations!'
    else
      puts 'Incorrect homework'
    end
  end

  def read_notifications!
    @notif.map { |_key, val| val.status = 'read' }
  end
end
