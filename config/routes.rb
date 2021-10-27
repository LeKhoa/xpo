Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users
  root to: 'home#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
