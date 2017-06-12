Rails.application.routes.draw do

 resources :wods, only: [:index, :new, :create, :show]

 resources :users, :usermovements, :userwods, :sessions, :movements

 get '/logout' => 'sessions#destroy'

 root 'application#welcome'
end
