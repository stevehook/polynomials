# frozen_string_literal: true

require_relative '../../lib/polynomial'

class PolynomialsController < ApplicationController
  def differentiate
    render plain: Polynomial.new(params[:polynomials].split('/').map(&:to_i)).differentiate.to_s
  end
end
