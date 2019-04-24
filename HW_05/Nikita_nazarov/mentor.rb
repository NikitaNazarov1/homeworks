require_relative 'homeworks'
# class mentor
class Mentor < Human
  attr_accessor :notific
  def initialize(_fullname)
    @notific = []
    super
  end

  def subscribe_to_student(student)
    student.subscriber(self)
  end

  def notifications
    notific.each do |v|
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
    notific.map { |val| val.status = 'read' }
  end
end
