require_relative 'spec_helper'
require_relative '../HW_05/Nikita_nazarov/homework'

RSpec.describe Homework do
  subject { Homework.new(code: code, student: student, pull_r: pull_r) }
  let(:code) { 'code' }
  let(:student) { 'student' }
  let(:pull_r) { 'pull_r' }

  describe 'code' do
    it 'return code' do
      expect(subject.code).to eq code
    end
  end
  describe 'student fullname' do
    it 'return student fullname' do
      expect(subject.student).to eq student
    end
  end
  describe 'pull request title' do
    it 'return pull request title' do
      expect(subject.pull_r).to eq pull_r
    end
  end
end
