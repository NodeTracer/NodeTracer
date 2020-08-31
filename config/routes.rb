Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'registrations#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :registrations, only: [:new, :create]
  resource :dashboard, controller: :dashboard

  root "public#show"
end
