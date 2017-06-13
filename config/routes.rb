Rails.application.routes.draw do

 resources :users, :usermovements, :userwods, :movements, :wods

 get '/sessions/new', to: 'sessions#new'
 post '/sessions/create', to: 'sessions#create'
 delete '/sessions/destroy', to: 'sessions#destroy'

 root 'application#welcome'
end
