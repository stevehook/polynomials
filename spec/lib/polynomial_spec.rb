# frozen_string_literal: true

RSpec.describe Polynomial do
  describe '#initialize' do
    let(:input) { '1' }
    subject { described_class.new(input) }

    it 'creates a new polynomial given an input string' do
      expect(subject).to be_a Polynomial
    end
  end
end
