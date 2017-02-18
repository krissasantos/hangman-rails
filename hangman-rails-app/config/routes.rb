Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: 'users#index'
   resources :users
   resources :games

  get '/login', to: 'users#index'
  get '/logout', to: 'sessions#destroy'

  post '/login', to: 'sessions#create' #review 
  post '/destroy', to: 'sessions#destroy' #review
end
