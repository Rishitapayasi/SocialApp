Rails.application.routes.draw do
  root "posts#index"

  resources :posts
  resources :users 
  resources :user_profiles
    
 
end
