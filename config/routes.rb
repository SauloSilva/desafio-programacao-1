Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :importers, only: [:index, :new, :create]

  root to: 'importers#index'
end
