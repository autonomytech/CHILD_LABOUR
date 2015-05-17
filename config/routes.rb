Rails.application.routes.draw do
  resources :complaints

  resources :reports do
    collection do
      get :years
      get :year_wise_report
      get :all_over_report
      get :download_pdf
      get :panchnama_child_labour
      get :panchnama_child_begger
      get :get_child_labour
    end
    member do
      get :panchnama
      get :child_labours
      get :child_beggers
    end
  end

  resources :dashboard

  resources :answers

  resources :questions

  resources :child_labours

  resources :child_beggers

  resources :raids do
    resources :community_farms do
      collection do
        get :community_farm
        post :create_community_farm
      end
    end
    resources :child_labours
    resources :children
    resources :child_beggers
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
