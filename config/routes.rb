Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  apipie

  resources :users do
    resource :campaigns, only: [:show, :create]
  end
end
