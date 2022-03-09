# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'citizens#index'
  resources :citizens
  resources :addresses
end
