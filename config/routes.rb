Rails.application.routes.draw do

 resources :users, :movements, :wods, :sessions

 get '/logout' => 'sessions#destroy'

 root 'application#welcome'

end
