# frozen_string_literal: true

require_relative '../../lib/polynomial'

class PolynomialsController < ApplicationController
  def differentiate
    render plain: Polynomial.new(coefficient_params).differentiate.to_s
  end

  private

  def coefficient_params
    params[:polynomials].split('/').map(&:to_i)
  end
end
