Rails.application.routes.draw do
  get '/auth/facebook/callback' => 'sessions#create'
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

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  #logout route
  delete '/logout', to: 'sessions#destroy'

  get '/search', to: 'clients#search'

  resources :clients, except: [:index]
  resources :appointments, except: [:new, :index]
  resources :users do
    resources :clients, only: [:index, :new, :create]
    resources :vehicles, except: [:index]
  end

  
  resources :clients do 
    resources :appointments, only: [:new, :index]
    resources :vehicles, except: [:index]
  end

end
