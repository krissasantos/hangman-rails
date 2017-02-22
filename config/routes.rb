Rails.application.routes.draw do

   root to: 'users#index'
   resources :users
   resources :games
   resource :sessions, only: [:new, :create, :destroy]

   #customized

   get '/login', to: 'users#index'
   post '/login', to: 'sessions#create' 
   
   # get '/logout', to: 'sessions#destroy'
   # post '/destroy', to: 'sessions#destroy' 
end
