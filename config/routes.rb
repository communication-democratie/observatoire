Rails.application.routes.draw do
  resources :reports, only: :create
  resources :problems, only: [:index, :show]
  get ":taxonomy_slug" => 'categories#index', as: :taxonomy
  get ":taxonomy_slug/:category_slug" => 'categories#show', as: :category

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
