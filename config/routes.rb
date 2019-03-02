require 'sidekiq/web'


Rails.application.routes.draw do
  resources :team_user_relationships
  resources :teams
  resources :accountability_partnerships
  resources :comments
  resources :goals
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :users, :only => [:show, :edit, :index]
  resources :supported_users
  resources :journal_entries
  resources :sports
  resources :training_types
  resources :goal_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web, at: '/sidekiq'

  root 'welcome#index'

  get 'athleteapp', to: 'athleteapp#index'

end
