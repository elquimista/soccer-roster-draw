# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/draw', to: 'draw#index'
  post '/draw', to: 'draw#create'

  resources :matches, only: %i[edit update]
end
