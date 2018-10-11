# frozen_string_literal: true

Rails.application.routes.draw do
  get '/draw', to: 'draw#index'
end
