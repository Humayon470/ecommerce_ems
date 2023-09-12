Rails.application.routes.draw do
  root to: "homepage#index"
  resources :users

  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end
# config/routes.rb

resources :users, only: [:index, :show]


end
