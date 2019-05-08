require_relative 'spec_helper'
require_relative '../../HW_05/Nikita_nazarov/notification'

RSpec.describe Notification do
  subject { Notification.new(status: status, student: student, pull_r: pull_r) }
  let(:status) { 'status' }
  let(:student) { 'student' }
  let(:pull_r) { 'pull_r' }

  describe ' status' do
    it 'return status' do
      expect(subject.status).to eq status
    end
  end
  describe 'student fullname' do
    it 'return student fullname' do
      expect(subject.student).to eq student
    end
  end
  describe ' pull request title' do
    it 'return pull request title' do
      expect(subject.pull_r).to eq pull_r
    end
  end
end
