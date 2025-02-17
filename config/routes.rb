Rails.application.routes.draw do
  resources :reports, only: :create
  resources :problems, only: [:index, :show]

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :admin do
    resources :reports, only: [:index, :show, :edit, :update]
    resources :taxonomies
    resources :categories
    resources :problems
    root to: "dashboard#index"
  end

  root to: "home#index"
end
