Rails.application.routes.draw do
  resources :reports do
    collection do
      get :child_labours
      get :years
      get :year_wise_report
      get :all_over_report
      get :download_pdf
    end
    member do
      get :panchnama
    end
  end

  resources :dashboard

  resources :answers

  resources :questions

  resources :child_labours

  resources :raids do
    resources :community_farms
    resources :child_labours
  end

  resources :employers

  resources :departments

  resources :locations

  resources :roles

  resources :communities

  devise_for :users

  resources :users

  root 'dashboard#index'
end
