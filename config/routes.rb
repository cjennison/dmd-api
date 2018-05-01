Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  apipie

  resources :users do
    resource :campaigns, only: [:show, :create]
  end

  # Main Resources /:resource/:id
  resources :items, only: [:show, :update]
  resources :monsters, only: [:show, :update]
  resources :characters, only: [:show, :update]

  resources :campaigns, only: [] do
    resources :segments, only: [:index, :show, :create, :update]

    # Campaign Resource (campaign_assets) /campaigns/:campaign_id/:type
    resources :characters, only: [:index, :create]
    delete 'characters/:id', to: 'characters#campaign_destroy'

    resources :items, only: [:index, :create]
    delete 'items/:id', to: 'items#campaign_destroy'

    resources :monsters, only: [:index, :create]
    delete 'monsters/:id', to: 'monsters#campaign_destroy'

  end
end
