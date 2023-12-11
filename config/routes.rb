Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
  get '/', to: 'dashboard#index', as: 'dashboard_index'
  get '/dashboard', to: 'dashboard#show', as: 'dashboard_details'
  get '/summary', to: 'dashboard#summary', as: 'dashboard_summary'

  resources :sessions, only: %i[new create destroy]
  resources :users, only: %w[new create]

  namespace :api, defaults: { format: 'json' }, path: '/api' do
    resources :activities, only: [:create]
  end
end
