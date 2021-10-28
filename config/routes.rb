Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users
  root to: 'home#index'
  #root to: 'home#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get :dashboard, to: 'home#dashboard'
  get :profile, to: 'home#profile'
  get :support, to: 'home#support'
  get :transactions, to: 'home#transactions'
  get :payment, to: 'home#payment'
end
