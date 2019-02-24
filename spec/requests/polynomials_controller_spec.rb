# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PolynomialsController, type: :request do
  describe '#differentiate' do
    it 'returns success code' do
      get '/differentiate/1'
      expect(response).to be_successful
    end

    it 'returns the correct result for the constant polynomial `f(x) = 1`' do
      get '/differentiate/1'
      expect(response.body).to eql '0'
    end
  end
end
