Rails.application.routes.draw do
  namespace :admin do
    namespace :reports do
      resources :steps
    end
    namespace :problems do
      resources :steps
    end
    resources :reports, only: [:index, :show, :edit, :update]
    resources :taxonomies, :categories, :problems, :pages
    root to: "dashboard#index"
  end

  resources :reports, only: :create
  get 'pubs' => 'problems#index', as: :problems
  get 'pubs/:id' => 'problems#show', as: :problem
  get 'analyses' => 'problems#analyzed', as: :analyzed_problems
  get ":taxonomy_slug" => 'categories#index', as: :taxonomy, constraints: lambda { |request|
    request.path.remove("/").in? Taxonomy.pluck(:slug)
  }
  get ":taxonomy_slug/:category_slug" => 'categories#show', as: :category

  get "up" => "rails/health#show", as: :rails_health_check
  
  root to: "pages#index"
  
  match "*slug" => "pages#show", via: :get, constraints: lambda { |request|
    request.path.exclude? 'rails/active_storage'
  }
end
