Rails.application.routes.draw do
  resources :community_farms

  root 'dashboard#index'

  resources :dashboard

  resources :answers

  resources :questions

  resources :child_labours

  resources :raids

  resources :employers

  resources :departments

  resources :locations

  resources :roles

  resources :communities

  devise_for :users
end
