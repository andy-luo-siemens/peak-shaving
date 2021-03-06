Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :peak_shaving_plans do
      resources :topologies
    end
    resources :meters, shallow: true
    resources :sem3_gateways do
      resources :sem3_controllers, shallow: true do

      end
    end
    resources :evse_gateways do
      resources :evses, shallow: true
    end
  end


  post 'authenticate', to: 'authentication#authenticate'
  root 'static_pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


end
