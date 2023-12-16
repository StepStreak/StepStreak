Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
  get '/', to: 'dashboard#index', as: 'dashboard_index'
  get '/dashboard', to: 'dashboard#show', as: 'dashboard_details'
  get '/summary', to: 'dashboard#summary', as: 'dashboard_summary'
  get '/welcome', to: 'home#welcome', as: 'welcome'
  get '/privacy', to: 'home#privacy', as: 'privacy'

  resources :sessions, only: %i[new create destroy]
  resources :users, only: %w[new create destroy]
  resources :challenges, only: %w[index show] do
    resources :challenge_users, only: %w[index new create destroy]
  end

  resources :configurations, only: [] do
    get :ios, on: :collection
    get :android, on: :collection
  end

  namespace :api, defaults: { format: 'json' }, path: '/api' do
    resources :activities, only: [:create]
    put '/users', to: 'users#update'
  end
end
