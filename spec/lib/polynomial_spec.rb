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

  describe '#differentiate' do
    TEST_CASES = {
      [1] => {},
      [1, 2, 3] => { 1 => 2, 0 => 2 },
      [1, 0, -2, 3] => { 2 => 3, 1 => 0, 0 => -2 }
    }.freeze

    TEST_CASES.each do |input, expected_output|
      context "given original inputs #{input}" do
        subject { described_class.new(input) }
        let(:result) { subject.differentiate }

        it "we get #{expected_output} for the derived function" do
          expect(result.coefficients).to eql expected_output
        end
      end
    end
  end

  describe '#to_s' do
    TEST_CASES = {
      [1] => '1',
      [1, 2, 3] => 'x^2+2x+3',
      [1, 0, -2, 3] => 'x^3-2x+3'
    }.freeze

    TEST_CASES.each do |input, expected_output|
      context "given original inputs #{input}" do
        subject { described_class.new(input) }
        let(:result) { subject.to_s }

        it "string representation is #{expected_output}" do
          expect(result.to_s).to eql expected_output
        end
      end
    end
  end
end
