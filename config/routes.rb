Rails.application.routes.draw do

 root 'application#welcome'	
 resources :users do
 	resources :usermovements, only: [:show, :index,]
 	resources :userwods, only: [:show, :index,]
 end
 
 resources :usermovements, only: [:new, :create, :update, :edit, :destroy]	
 resources :userwods, only: [:new, :create, :update, :edit, :destroy]

 resources :movements, :wods

 get '/sessions/new', to: 'sessions#new'
 post '/sessions/create', to: 'sessions#create'
 delete '/sessions/destroy', to: 'sessions#destroy'

 get '/auth/:profile/callback', to: 'sessions#create'
 
end
