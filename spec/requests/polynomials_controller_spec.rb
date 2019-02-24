# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PolynomialsController, type: :request do
  describe '#differentiate' do
    context 'with a valid image id' do
      it 'returns success code' do
        get '/differentiate/1'
        expect(response).to be_successful
      end

      it 'returns the correct result' do
        pending 'TODO'
      end
    end
  end
end
