# frozen_string_literal: true

require_relative '../../lib/polynomial'

RSpec.describe Polynomial do
  let(:coefficients) { [1] }
  subject { described_class.new(coefficients) }

  describe '#initialize' do
    it 'creates a new polynomial given an input coefficients' do
      expect(subject).to be_a Polynomial
    end
  end

  describe '#coefficients' do
    TEST_CASES = {
      [1] => { 0 => 1 },
      [1, 2, 3] => { 2 => 1, 1 => 2, 0 => 3 },
      [1, 0, -2, 3] => { 3 => 1, 2 => 0, 1 => -2, 0 => 3 }
    }.freeze

    TEST_CASES.each do |input, expected_output|
      context "given input coefficients #{input}" do
        subject { described_class.new(input) }

        it "we get #{expected_output}" do
          expect(subject.coefficients).to eql expected_output
        end
      end
    end
  end
end
