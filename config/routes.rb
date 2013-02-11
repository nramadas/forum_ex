Forum::Application.routes.draw do

  root to: "posts#index"

  resources :users
  resources :posts do
    resources :comments, only: [:index, :new]
  end

  resources :comments
  resources :sessions, only: [:new, :create, :destroy]

  get "/signin", to: "sessions#new"
  delete "/signout", to: "sessions#destroy"
  get "/signup", to: "users#new"

end