Rails.application.routes.draw do

 resources :wods

 resources :users, :usermovements, :userwods, :sessions, :movements

 get '/logout' => 'sessions#destroy'

 root 'application#welcome'
end
