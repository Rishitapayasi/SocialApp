Rails.application.routes.draw do
  root "user#index"

  resources :users, shallow: true do
    resources :profiles, only: [:show, :create, :update, :destroy]
    resources :posts, only: [:show, :create, :update, :destroy]
    resources :follows, only: [:show, :create, :destroy]
  end
  
  # resources :sessions, only: [:create, :destroy] 
  resources :posts do 
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy] 
  end

 
end 

