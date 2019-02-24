# frozen_string_literal: true

require_relative '../../lib/polynomial'

RSpec.describe Polynomial do
  let(:coefficients) { [1] }
  subject { described_class.new(coefficients) }

  describe '#initialize' do
    it 'creates a new polynomial given an input coefficients' do
      expect(subject).to be_a Polynomial
    end

    it 'creates a Hash of coefficients indexed by exponent' do
      expect(subject.coefficients).to eql(
        0 => 1
      )
    end
  end
end
