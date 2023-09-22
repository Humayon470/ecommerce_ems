Rails.application.routes.draw do
  root to: "homepage#index"

  devise_for :users, controllers: {
    registrations: 'registrations',
    invitations: 'invitations'
  }
  namespace :admin do
    resources :products
    resources :users do
      collection do
        get :export_csv
      end
    end

    get 'dashboard', to: 'dashboard#index'
  end
end 
