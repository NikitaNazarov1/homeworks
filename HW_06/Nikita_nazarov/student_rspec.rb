# rubocop:disable all
require_relative 'spec_helper'
require_relative '../../HW_05/Nikita_Nazarov/student'
require_relative '../../HW_05/Nikita_Nazarov/homework'
require_relative '../../HW_05/Nikita_Nazarov/mentor'
require_relative '../../HW_05/Nikita_Nazarov/notification'

RSpec.describe Student do
  subject { Student.new(fullname) }
  let(:homework) { Homework.new(code: code, student: subject.fullname, pull_r: pull_r) }
  let(:mentor) { Mentor.new(fullname) }
  let(:notificat) { Notification.new(status: 'unread', student: fullname, pull_r: pull_r) }
  let(:fullname) { 'fullname' }
  let(:code) { 'code' }
  let(:pull_r) { 'pull request title' }

  describe ' student fullname' do
    it 'student fullname match?' do
      expect(subject.fullname).to eq fullname
    end
  end

  describe 'add homework to array of homeworks' do
    it 'successful adding' do
      expect(subject.add_hw(homework)).to eq homework
    end
  end

  describe ' student submit homework' do
    context 'successful submit' do
      it 'get message' do
        expect(subject.submit_homework(homework: homework)).to eq('Successful submit')
      end
    end
  end

  describe 'send notification to mentor' do
    before do
      mentor.subscribe_to_student(subject)
      subject.submit_homework(homework: homework)
    end
    it 'successful sending' do
      expect(mentor.notifications).to eq ["notice:<unread> from student: #{fullname} sent: #{pull_r}"]
    end
  end
end
