Rails.application.routes.draw do
  resources :attendees
  resources :follows
  resources :routes
  resources :comments
  resources :events
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
