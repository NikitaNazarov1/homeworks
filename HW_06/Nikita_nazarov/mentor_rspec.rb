# rubocop:disable all
require_relative 'spec_helper'
require_relative '../../HW_05/Nikita_Nazarov/mentor'
require_relative '../../HW_05/Nikita_Nazarov/human'
require_relative '../../HW_05/Nikita_Nazarov/student'
require_relative '../../HW_05/Nikita_Nazarov/homework'

RSpec.describe Mentor do
  subject { Mentor.new(_fullname) }
  let(:homework1) { Homework.new(code: code, student: _fullname, pull_r: pull_r) }
  let(:homework2) { Homework.new(code: 'incorrect', student: _fullname, pull_r: pull_r) }
  let(:student) { Student.new(_fullname) }
  let(:_fullname) { 'fullname' }
  let(:code) { 'qwe' }
  let(:pull_r) { 'pull_r' }

  describe ' mentor fullname' do
    it 'mentor fullname match?' do
      expect(subject.fullname).to eq _fullname
    end
  end

  describe 'add student to array of subscriptions' do
    it 'successful adding' do
      expect(subject.subscribe_to_student(student)).to eq ([student])
    end
  end

  describe ' notifications' do
    context 'get notification if subscribe and student submit homework' do
      before do
        subject.subscribe_to_student(student)
        student.submit_homework(homework: homework1)
      end
      it 'add notification' do
        expect(subject.notifications).to eq(["notice:<unread> from student: #{student.fullname} sent: #{pull_r}"])
      end
    end

    context 'do not get notification because not subscribe' do
      before do
        student.submit_homework(homework: homework1)
      end
      it 'don`t add notification' do
        expect(subject.notifications).to eq([])
      end
    end
    context 'do not get notification if student not submit homework' do
      before do
        subject.subscribe_to_student(student)
      end
      it 'add notification' do
        expect(subject.notifications).to eq([])
      end
    end
  end

  describe ' check homework ' do
    context 'is correct homework' do
      it 'get notification about correct homework' do
        expect(subject.check_homework(homework: homework1)).to eq('Correct homework, congratulations!')
      end
    end

    context 'is incorrect homework ' do
      it 'get notification about incorrect homework' do
        expect(subject.check_homework(homework: homework2)).to eq('Incorrect homework')
      end
    end
  end
  describe ' read notifications ' do
    before do
      subject.subscribe_to_student(student)
      student.submit_homework(homework: homework1)
      subject.notifications
    end
    it 'change status on read' do
      expect { subject.read_notifications! }.to change { subject.notifications }.to(["notice:<read> from student: #{student.fullname} sent: #{pull_r}"])
    end
  end
end
# rubocop:enable all