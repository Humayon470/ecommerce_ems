Rails.application.routes.draw do
  root to: "homepage#index"

  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end
  resources :users do
    collection do
      get 'export_csv'
    end
  end
end 
