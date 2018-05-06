Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  apipie

  resources :users do
    resource :campaigns, only: [:show, :create]

    resource :assets, only: [] do
      get :search
    end

    # User Assets Paths
    resource :characters, :controller=>:assets, only: [] do
      get '', to: 'assets#characters_index'
      post '', to: 'assets#character_create'
      delete ':id', to: 'assets#character_destroy'
    end

    resource :monsters, :controller=>:assets, only: [] do
      get '', to: 'assets#monsters_index'
      post '', to: 'assets#monster_create'
      delete ':id', to: 'assets#monster_destroy'
    end

    resource :items, :controller=>:assets, only: [] do
      get '', to: 'assets#items_index'
      post '', to: 'assets#item_create'
      delete ':id', to: 'assets#item_destroy'
    end

  end

  # Main Resources /:resource/:id
  resources :items, only: [:show, :update]
  resources :monsters, only: [:show, :update]
  resources :characters, only: [:show, :update]

  resources :campaigns, only: [] do
    post ':asset_type/:asset_id', to: 'campaigns#add_asset'

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
