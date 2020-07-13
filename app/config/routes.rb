Rails.application.routes.draw do
  get 'auth/facebook', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  root 'sessions#home'
  #where a user signs up
  get '/signup', to: 'users#new'
  resources :users
  #where a user logs in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  #logout route
  delete '/logout', to: 'sessions#destroy'
end
