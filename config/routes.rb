Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  namespace :api, default: {format: :json} do
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :create] do
        resources :comments, only: [:index, :create]
      end
    end
    post 'login', to: 'authentication#login'
    post 'signup', to: 'authentication#create'
  end
  # Defines the root path route ("/")
  root "users#index"
end
