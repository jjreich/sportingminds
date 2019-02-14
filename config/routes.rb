Rails.application.routes.draw do
  resources :accountability_partnerships
  resources :comments
  resources :goals
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :users, :only => [:show, :edit, :index]
  resources :journal_entries
  resources :sports
  resources :training_types
  resources :goal_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get 'athleteapp', to: 'athleteapp#index'

end
