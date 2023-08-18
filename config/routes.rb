Rails.application.routes.draw do
  root "posts#index"

  resources :users 
  resources :profiles 
  resources :posts
  resources :sessions, only: [:create, :destroy] 
  resources :posts do 
    resources :comments, only: [:create, :destroy]
  end

  resources :posts do 
    resources :likes, only: [:create, :destroy] 
  end
end 

