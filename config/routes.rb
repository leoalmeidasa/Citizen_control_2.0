# frozen_string_literal: true

Rails.application.routes.draw do
  resources :citizens
  resources :addresses
  root to: 'citizens#index'
end
