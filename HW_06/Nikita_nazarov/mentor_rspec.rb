# rubocop:disable all
require_relative 'spec_helper'
require_relative '../../HW_05/Nikita_Nazarov/mentor'
require_relative '../../HW_05/Nikita_Nazarov/human'
require_relative '../../HW_05/Nikita_Nazarov/student'
require_relative '../../HW_05/Nikita_Nazarov/homework'

RSpec.describe Mentor do
  subject { Mentor.new(_fullname) }
  let(:_fullname) { 'fullname' }
  let(:student) { Student.new(_fullname) }
  let(:code) { 'qwe' }
  let(:pull_r) { 'pull_r' }
  let(:homework1) { Homework.new(code: code, student: _fullname, pull_r: pull_r) }
  let(:homework2) { Homework.new(code: 'incorrect', student: _fullname, pull_r: pull_r) }

  describe ' mentor fullname' do
    it 'return mentor fullname' do
      expect(subject.fullname).to eq _fullname
    end
  end

  describe ' method subscribe_to_student' do
    context 'unique subscription' do
      it 'add to subscribes' do
        expect { subject.subscribe_to_student(student) }.to change { subject.subscribes.select.count }.from(0).to(1)
      end
    end

    context 'not unique subscription' do
      before do
        subject.subscribe_to_student(student)
      end
      it "don't add to subscribes" do
        expect { subject.subscribe_to_student(student) }.not_to change { subject.subscribes }
      end
    end
  end

  describe ' notifications' do
    context 'get notification if subscribe and student submit homework' do
      let(:expected_notification) { ["notice:<unread> from student: #{student.fullname} sent: #{pull_r}"] }

      before do
        subject.subscribe_to_student(student)
        student.submit_homework(homework: homework1)
      end
      it 'add notification' do
        expect(subject.notifications).to eq(expected_notification)
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
      let(:expected_message) { 'Correct homework, congratulations!' }
      it 'get notification about correct homework' do
        expect(subject.check_homework(homework: homework1)).to eq(expected_message)
      end
    end

    context 'is incorrect homework ' do
      let(:expected_message) { 'Incorrect homework' }
      it 'get notification about incorrect homework' do
        expect(subject.check_homework(homework: homework2)).to eq(expected_message)
      end
    end
  end
  describe ' read notifications ' do
    let(:expected_notification) { ["notice:<read> from student: #{student.fullname} sent: #{pull_r}"] }

    before do
      subject.subscribe_to_student(student)
      student.submit_homework(homework: homework1)
      subject.notifications
    end
    it 'change status on read' do
      expect { subject.read_notifications! }.to change { subject.notifications }.to(expected_notification)
    end
  end
end
# rubocop:enable all