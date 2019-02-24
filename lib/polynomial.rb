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
    new_coefficients = coefficients.reverse_each.each_with_object({}) do |exponent_coefficient, result|
      exponent, coefficient = exponent_coefficient
      result[exponent - 1] = exponent * coefficient if exponent.positive?
    end
    Polynomial.new(new_coefficients.values)
  end

  def to_s
    coefficients.reverse_each.each_with_object(+'') do |exponent_coefficient, result|
      exponent, coefficient = exponent_coefficient
      is_first = (result == '')
      if coefficient.abs.positive?
        result <<
          "#{coefficient_expression(is_first, coefficient, exponent)}#{exponent_expression(exponent)}"
      end
    end
  end

  private

  def coefficient_expression(is_first, coefficient, exponent)
    expression = +''
    unless is_first && coefficient.positive?
      expression << (coefficient.positive? ? '+' : '-')
    end
    return expression if coefficient.abs == 1 && exponent.positive?

    expression << coefficient.abs.to_s
    expression
  end

  def exponent_expression(exponent)
    return '' if exponent.zero?

    return 'x' if exponent == 1

    "x^#{exponent}"
  end
end
