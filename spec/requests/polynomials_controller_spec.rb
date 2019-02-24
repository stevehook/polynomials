# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PolynomialsController, type: :request do
  describe '#differentiate' do
    it 'returns success code' do
      get '/differentiate/1'
      expect(response).to be_successful
    end

    it 'returns the correct result for the constant polynomial `f(x) = x^2+2x+3`' do
      get '/differentiate/1/2/3'
      expect(response.body).to eql '2x+2'
    end
  end
end
