Rails.application.routes.draw do
  root to: "homepage#index"
  resources :homepage

  devise_for :users, controllers: {
    registrations: 'registrations',
    invitations: 'invitations'
  }

  resources :carts do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :products do
      collection do
        get :export_csv
      end
    end
    resources :users do
      collection do
        get :export_csv
      end
    end

    resources :categories

    resources :coupons do
      collection do
        get :export_csv
      end
    end
  end

  namespace :api do
    get 'homepage/index'
    resources :homepage
    post :auth, to: "authentication#create"
    delete :auth, to: "authentication#destroy"
    resources :carts do
      member do
        post :add_to_cart
      end
    end
  
    namespace :admin do
      resources :products do
        collection do
          get :export_csv
        end
      end
      resources :users do
        collection do
          get :export_csv
        end
      end
  
      resources :categories
  
      resources :coupons do
        collection do
          get :export_csv
        end
      end
    end
  end
end 
