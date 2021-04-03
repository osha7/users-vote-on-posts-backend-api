Rails.application.routes.draw do
  resources :votes
  resources :posts
  resources :users
  
  root to: 'application#home'

  namespace :api do
    namespace :v1 do

      resources :users

      resources :votes

      resources :posts do 
        resources :votes
      end

    end
  end

end

