Rails.application.routes.draw do
  namespace :admin do
    resources :campaigns

    root to: "campaigns#index"
  end

  root 'dashboard#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resources :users
  resources :companies
  resources :corporates
end
