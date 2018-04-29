Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  apipie

  resources :users  
  resources :campaigns
end
