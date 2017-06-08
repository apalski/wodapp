Rails.application.routes.draw do

 resources :users, :usermovements, :userwods, :sessions

 get '/logout' => 'sessions#destroy'

 root 'application#welcome'

 # resources :wods, only [:show] do
 # 	resources :movements, only: [:index, :show]
 # end	
end
