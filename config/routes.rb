Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  apipie

  resources :users do
    resource :campaigns, only: [:show, :create]
  end

  resources :monsters, only: [:show, :update]

  resources :campaigns, only: [] do
    resources :segments, only: [:index, :show, :create, :update]
    resources :characters, only: [:index, :show, :create, :update]
    resources :items, only: [:index, :show, :create, :update]
    resources :monsters, only: [:index, :create]
  end
end
