# frozen_string_literal: true

require_relative '../../lib/polynomial'

RSpec.describe Polynomial do
  describe '#initialize' do
    let(:input_expression) { '1' }
    subject { described_class.new(input_expression) }

    it 'creates a new polynomial given an input string' do
      expect(subject).to be_a Polynomial
    end
  end
end
