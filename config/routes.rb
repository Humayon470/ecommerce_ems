Rails.application.routes.draw do
  root to: "homepage#index"

  devise_for :users, controllers: {
    registrations: 'registrations'
  }
end
