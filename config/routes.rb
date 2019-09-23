Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :campaigns
    resources :clients
    resources :companies
    resources :corporates

    root to: "users#index"
  end

  root 'dashboard#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resources :user
end
