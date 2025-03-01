Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "blog_posts#index"
  resources :blog_posts do
    resources :cover_images, only: %i[destroy], module: :blog_posts
  end
end
