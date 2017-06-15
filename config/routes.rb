Rails.application.routes.draw do

 root 'application#welcome'	

 resources :users, :usermovements, :userwods, :movements, :wods

 get '/sessions/new', to: 'sessions#new'
 post '/sessions/create', to: 'sessions#create'
 delete '/sessions/destroy', to: 'sessions#destroy'

 get '/auth/github/callback', to: 'sessions#create'
 
end
