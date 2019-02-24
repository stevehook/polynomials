# frozen_string_literal: true

class Polynomial
  attr_accessor :coefficients

  def initialize(coefficients)
    self.coefficients = {}
    coefficients.reverse.each_with_index do |coefficient, exponent|
      self.coefficients[exponent] = coefficient
    end
  end

  def differentiate
    new_coefficients = {}
    coefficients.reverse_each do |exponent, coefficient|
      new_coefficients[exponent - 1] = exponent * coefficient if exponent.positive?
    end
    Polynomial.new(new_coefficients.values)
  end
end
