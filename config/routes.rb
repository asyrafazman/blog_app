Rails.application.routes.draw do
  # get 'welcomes', to: 'welcome#x'
  # Devise routes for user authentication
  devise_for :users

  # Defines the root path route ("/")
  root "posts#index"

  # Post routes with nested comments
  resources :posts do
    resources :comments, only: [:create]
  end

  # Standalone comment routes for deletion
  resources :comments, only: [:destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Profile routes
  # Profile routes
  get 'profile', to: 'profiles#show'
  get 'profile/edit', to: 'profiles#edit'
  patch 'profile', to: 'profiles#update'
  put 'profile', to: 'profiles#update'
  # get 'profile', to: 'profiles#show'
  # get "profiles/edit"
  # get "profiles/update"
  # get "comments/create"
  # get "comments/destroy"
  # get "posts/index"
  # get "posts/show"
  # get "posts/new"
  # get "posts/edit"
  # get "posts/create"
  # get "posts/update"
  # get "posts/destroy"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

end
