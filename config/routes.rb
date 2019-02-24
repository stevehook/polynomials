# frozen_string_literal: true

Rails.application.routes.draw do
  get '/differentiate/*polynomials', to: 'polynomials#differentiate'
end
