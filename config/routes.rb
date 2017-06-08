Rails.application.routes.draw do

  resources :movements

 resources :users, :usermovements, :userwods, :sessions

 get '/logout' => 'sessions#destroy'

 root 'application#welcome'

 # resources :wods, only [:show] do
 # 	resources :movements, only: [:index, :show]
 # end	
end
