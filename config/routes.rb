Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :importers, only: [:index, :new, :create]

  root to: 'importers#index'
end
