Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'up' => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "dashboard#index"
  get '/', to: 'dashboard#index', as: 'dashboard_index'
  get '/dashboard', to: 'dashboard#show', as: 'dashboard_details'
  get '/overview', to: 'dashboard#overview', as: 'dashboard_overview'
  get '/welcome', to: 'home#welcome', as: 'welcome'
  get '/privacy', to: 'home#privacy', as: 'privacy'
  get '/permissions', to: 'home#permissions', as: 'permissions'
  get '/data', to: 'home#data', as: 'data'

  resources :sessions, only: %i[new create destroy]
  resources :users
  resources :challenges, only: %w[index show] do
    get :ended, on: :collection
    resources :challenge_users, only: %w[index new create destroy]
    resources :teams, only: %w[index new create] do
      resources :team_challenge_users, only: %w[create]
    end
  end
  resources :notifications, only: %w[index] do
    put :read_all, on: :collection
  end

  resources :configurations, only: [] do
    get :ios, on: :collection
    get :android, on: :collection
  end

  resources :settings

  resources :tournaments
  resources :tournament_participants

  resources :goals, only: %w[index new create edit update]

  namespace :api, defaults: { format: 'json' }, path: '/api' do
    resources :activities, only: [:create]
    put '/users', to: 'users#update'
  end

  match '*unmatched_route', to: redirect('/404.html'), via: :all
end
