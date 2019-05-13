require_relative 'spec_helper'
require_relative '../../HW_05/Nikita_Nazarov/homework'

RSpec.describe Homework do
  subject { Homework.new(code: code, student: student, pull_r: pull_r) }
  let(:code) { 'code' }
  let(:student) { 'student' }
  let(:pull_r) { 'pull_r' }

  describe 'code' do
    it ' code match?' do
      expect(subject.code).to eq code
    end
  end
  describe 'student fullname' do
    it 'student fullname match?' do
      expect(subject.student).to eq student
    end
  end
  describe 'pull request title' do
    it ' pull request title match?' do
      expect(subject.pull_r).to eq pull_r
    end
  end
end
