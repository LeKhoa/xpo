Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  get '/*path', to: 'home#index', format: false
end
