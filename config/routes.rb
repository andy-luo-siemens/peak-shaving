Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :peak_shaving_plans do
      resources :topologies
    end
    resources :sem3_gateways do
      resources :sem3_controllers, shallow: true do
        resources :meters, shallow: true
      end
    end
    resources :evse_gateways do
      resources :evses, shallow: true
    end
  end


  root 'hello_world#hello'

end
