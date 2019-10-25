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

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  resources :campaigns
  resources :companies
  resources :corporates
  resources :clients
  resources :nodos
end
