Rails.application.routes.draw do

	 root 'application#welcome'	
	 resources :users do
	 	resources :usermovements
	 	resources :userwods
	 end

	 namespace :admin do
	 	resources :movements, :wods
	 end	

	 get '/sessions/new', to: 'sessions#new'
	 post '/sessions/create', to: 'sessions#create'
	 delete '/sessions/destroy', to: 'sessions#destroy'

	 get '/auth/github/callback', to: 'sessions#create'
	 get 'auth/facebook/callback', to: 'sesssions#create'
	 get 'auth/failure', to: redirect('/')
	 
end
