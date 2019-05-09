require_relative 'spec_helper'
require_relative '../../HW_05/Nikita_Nazarov/human'

RSpec.describe Human do
  subject { Human.new(fullname) }
  let(:fullname) { 'Full name' }

  describe 'fullname' do
    it 'return fullname' do
      expect(subject.fullname).to eq fullname
    end
  end
end
