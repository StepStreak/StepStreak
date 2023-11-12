Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
  get '/', to: 'dashboard#index', as: 'dashboard_index'
  get '/dashboard', to: 'dashboard#show', as: 'dashboard_details'
  get '/steps', to: 'steps#index'
  get '/calories', to: 'calories#index'
  get '/distance', to: 'distances#index'

  namespace :api, defaults: { format: 'json' }, path: '/api' do
    resources :activities, only: [:create]
  end
end
