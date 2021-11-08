Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  namespace :api, defaults: { format: :json } do
    namespace :coinpayments do
      resources :transactions
      post '/webhooks', to: 'webhooks#create'
    end
  end

  get '/*path', to: 'home#index', format: false
end
