Rails.application.routes.draw do

 root 'application#welcome'	
 resources :users, only: [:show] do
 	resources :usermovements, only: [:show, :index,]
 end
 
 resources :usermovements, only: [:new, :create, :update, :edit, :destroy]	

 resources :users, :userwods, :movements, :wods

 get '/sessions/new', to: 'sessions#new'
 post '/sessions/create', to: 'sessions#create'
 delete '/sessions/destroy', to: 'sessions#destroy'

 get '/auth/:profile/callback', to: 'sessions#create'
 
end
