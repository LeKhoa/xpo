Rails.application.routes.draw do
  namespace :admin do
      resources :admin_users
      resources :users
      resources :shrimpy_users
      resources :exchange_accounts
      resources :transactions
      resources :strategies

      root to: "admin_users#index"
    end
  devise_for :admin_users

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get '/prices', to: 'home#prices'

  namespace :api, defaults: { format: :json } do
    namespace :coinpayments do
      resources :transactions
      post '/webhooks', to: 'webhooks#create'
    end

    namespace :onramper do
      resources :transactions
      post '/webhooks', to: 'webhooks#create'
    end

    namespace :shrimpy do
      get '/rebalancing_balance', to: 'accounts#get_rebalancing_balance'
      post '/withdraw', to: 'accounts#withdraw'
    end

    resources :users
  end

  get '/*path', to: 'home#index', format: false
end
