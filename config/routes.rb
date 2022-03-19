Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  namespace :api, defaults: { format: :json } do
    post 'login', to: 'authentication#authenticate'
    post 'register', to: 'users#create'
    resources :users do
      resources :posts, only: [:index, :show, :create] do
        resources :comments, only: [:index, :create]
      end
    end
  end
  # Defines the root path route ("/")
  root "users#index"
end
