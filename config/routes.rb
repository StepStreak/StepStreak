Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
  get '/dashboard', to: 'dashboard#index'
  get '/steps', to: 'steps#index'
  get '/calories', to: 'calories#index'
  get '/distance', to: 'distances#index'
end
