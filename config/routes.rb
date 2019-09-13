Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :campaigns
    resources :campaign_employees
    resources :clients
    resources :companies
    resources :corporates
    resources :nodos
    resources :reds

    root to: "users#index"
  end

  root 'dashboard#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
end
