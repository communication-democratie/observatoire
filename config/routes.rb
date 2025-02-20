Rails.application.routes.draw do
  namespace :admin do
    namespace :reports do
      resources :steps
    end
    namespace :problems do
      resources :steps
    end
    resources :reports, only: [:index, :show, :edit, :update]
    resources :taxonomies, :categories, :problems
    root to: "dashboard#index"
  end

  resources :reports, only: :create
  resources :problems, only: [:index, :show], path: 'problemes'
  get ":taxonomy_slug" => 'categories#index', as: :taxonomy
  get ":taxonomy_slug/:category_slug" => 'categories#show', as: :category

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"
end
