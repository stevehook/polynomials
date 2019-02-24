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
  end
end
